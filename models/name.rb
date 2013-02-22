# coding: utf-8
class Name
  attr_reader :name, :real_name, :gender

  include StringUtil

  def initialize(name)
    @name = titlecase(name)
    find_real_name
    guess_gender
  end

  def letters
    @letters ||= downcase(real_name).chars.to_a
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
    if alias_name = NameAlias.find(:short => titlecase(name))
      alias_name.long
    else
      name
    end
  end
end
