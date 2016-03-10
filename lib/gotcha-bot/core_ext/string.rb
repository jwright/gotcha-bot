require_relative "string/inflector"

module GotchaBot
  class String
    include Inflector

    def initialize(string)
      @string = string.to_s
    end

    def to_s
      string
    end
    alias to_str  to_s

    def ==(other)
      to_s == other
    end
    alias eql? ==

    def method_missing(m, *args, &blk)
      if respond_to?(m)
        s = string.__send__(m, *args, &blk)
        s = self.class.new(s) if s.is_a? ::String
        s
      else
        raise NoMethodError.new(%(undefined method `#{m}' for "#{string}":#{self.class}))
      end
    end

    def respond_to_missing?(m, include_private=false)
      string.respond_to?(m, include_private)
    end

    private

    attr_reader :string
  end
end
