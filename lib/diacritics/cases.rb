# encoding: utf-8

# String core class
class String
  alias_method :old_downcase, :downcase
  alias_method :old_upcase, :upcase
end

# Diacritics classes
module Diacritics
  # Downcase or upcase with diacritics support
  class Cases
    def self.instance
      @instance ||= new
    end

    def initialize(lang: nil, space_replace_char: nil)
      @alphabet = Diacritics::Alphabet.new(lang: lang, space_replace_char: space_replace_char)
      @hash = alphabet.hash
      @regexp = alphabet.regexp
      @space_replace_char = space_replace_char
    end

    def downcase(text)
      text.old_downcase.gsub @regexp[:downcase], @hash[:downcase]
    end

    def upcase(text)
      text.old_upcase.gsub @regexp[:upcase], @hash[:upcase]
    end

    def permanent(text, space_replace_char = nil)
      if space_replace_char && space_replace_char != @space_replace_char
        @hash, @regexp = alphabet.reload_permanent(space_replace_char)
        @space_replace_char = space_replace_char
      end

      text.old_downcase.gsub @regexp[:permanent], @hash[:permanent]
    end

    private

    attr_reader :alphabet
  end
end
