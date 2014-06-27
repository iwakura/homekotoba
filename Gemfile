source 'http://rubygems.org'

ruby '1.9.3'

gem 'padrino', '~>0.11.2'
gem 'activesupport', '~>3.2.18'
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'erubis', '~> 2.7.0'
gem 'pg'
gem 'sequel'

group :test do
  gem 'shoulda', '~>3.3.2'
  gem 'rack-test', :require => 'rack/test'
end

if RUBY_VERSION > '1.9'
  gem 'unicode_utils'
end

group :production, :development do
  gem 'unicorn'
end
