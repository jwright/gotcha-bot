module GotchaBot
  module Hooks
    module Base
      def included(caller)
        define_class_method_for_hooks caller
        define_instance_method_for_hooks caller

        caller.hooks << GotchaBot::String.new(name).demodulize.underscore.to_sym
      end

      private

      def define_class_method_for_hooks(caller)
        caller.instance_eval do
          def hooks
            @hooks ||= []
          end
        end unless caller.respond_to? :hooks
      end

      def define_instance_method_for_hooks(caller)
        caller.class_eval do
          def hooks
            self.class.hooks
          end
        end unless caller.instance_methods.include? :hooks
      end
    end
  end
end
