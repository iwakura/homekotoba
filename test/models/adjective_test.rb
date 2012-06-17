require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class AdjectiveTest < Test::Unit::TestCase
  context "Adjective Model" do
    should 'construct new instance' do
      @adjective = Adjective.new
      assert_not_nil @adjective
    end
  end
end
