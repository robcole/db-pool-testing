require "db"
require "pg"

initial_pool_size = 1
max_idle_pool_size = 20
max_pool_size = 10
retry_attempts = 99999
host = "localhost"
dbname = "hirobot_app_development"

url = "postgres://#{host}/#{dbname}?initial_pool_size=#{initial_pool_size}&max_pool_size=#{max_pool_size}&max_idle_pool_size=#{max_pool_size}&checkout_timeout=5.0&retry_attempts=#{retry_attempts}&retry_delay=1&max_idle_pool_size=#{max_idle_pool_size}"

DB.open(url) do |db|
  loop do
    begin
      puts "\n\n"
      db.using_connection do |cnn|
        db.query("select now()").close
        puts db.pool.stats
        puts "\n"
      end
    rescue e
      pp e
    end
    sleep 1
  end
end
