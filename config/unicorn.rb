worker_processes 2
timeout 30

before_fork do |server, worker|
  # the following is highly recomended for "preload_app true"
  if defined?(Sequel::Model)
    Sequel::DATABASES.each{ |db| db.disconnect }
  end
end
