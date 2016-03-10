module GotchaBot
  module Inflector
    def demodulize
      @string = string.gsub(/^.*::/, "")
      self
    end

    def underscore
      @string = string
          .gsub(/::/, "/")
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr("-", "_")
          .downcase
      self
    end
  end
end
