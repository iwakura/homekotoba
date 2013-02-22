class NameAlias < Sequel::Model
  plugin :validation_helpers
  include StringUtil

  def validate
    validates_presence [:short, :long]
    validates_unique :short, :only_if_modified => true
  end

  def before_validation
    return false if super == false
    self.short = titlecase(short)
    self.long = titlecase(long)
  end

end
