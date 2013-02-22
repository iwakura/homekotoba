# coding: utf-8
class Name
  attr_reader :name, :real_name, :gender

  def initialize(name)
    @name = name
    find_real_name
    guess_gender
  end

  def letters
    @letters ||= word.chars.to_a
  end

  def word
    @word ||= downcase(real_name)
  end

  def guess_gender
    @gender =
    if real_name =~ /[ая]$/
      :female
    else
      :male
    end
  end

  def find_real_name
    @real_name =
    if alias_name = NameAlias.find(:short => downcase(name))
      alias_name.long
    else
      name
    end
  end

  def downcase(line)
    defined?(UnicodeUtils) ? UnicodeUtils.downcase(line) : line
  end
end
