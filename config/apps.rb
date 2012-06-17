Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '6e18541ea51479bce3f8cb72e8e875fb733fe4ae36b20c8495b0b31cb2338a83'
end

Padrino.mount('Complimentator').to('/')

Padrino.mount('Admin').to('/admin')
