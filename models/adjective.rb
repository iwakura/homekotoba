# coding: utf-8
class Adjective < Sequel::Model
  plugin :validation_helpers

  def validate
    validates_unique :word unless id
  end

  subset :checked, :checked => true

  def dataset.starts_with(letters)
    filter('word SIMILAR TO ?', "[#{letters}]%")
  end

end
