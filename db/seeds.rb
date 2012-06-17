# coding: utf-8

if Account.count.zero?
  email     = 'admin@example.com'
  password  = 'secret'

  account = Account.create(:email => email,
                          :name => 'Foo',
                          :surname => 'Bar',
                          :password => password,
                          :password_confirmation => password,
                          :role => 'admin')

  if account.valid?
    shell.say 'Account created'
  else
    shell.say 'Sorry but some thing went wrong!'
    account.errors.full_messages.each { |m| shell.say "   - #{m}" }
  end
end

if !Adjective.count.zero?
  Adjective.delete
  file = ENV['FULL'] == 'YES' ? 'adjectives.txt' : 'adjectives-short.txt'
  checked = !ENV['FULL']
  path = File.join(File.dirname(__FILE__), 'data', file)
  File.open(path).each_line do |word|
    Adjective.insert :word => word.strip, :checked => checked
  end
end
