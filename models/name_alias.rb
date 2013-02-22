class NameAlias < Sequel::Model
  plugin :validation_helpers

  def validate
    validates_presence [:short, :long]
    validates_unique :short, [:short, :long]
  end

end
