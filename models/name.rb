# coding: utf-8
class Name
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def letters
    @letters ||= word.chars.to_a
  end

  def word
    @word ||= defined?(UnicodeUtils) ? UnicodeUtils.downcase(name) : name
  end

  def gender
    if @name =~ /[ая]$/
      :female
    else
      :male
    end
  end
end
