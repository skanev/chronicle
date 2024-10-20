namespace :db do
  desc "Disconnect all other connections"
  task disconnect: :environment do
    ActiveRecord::Base.connection.execute <<~SQL
      SELECT pg_terminate_backend(pg_stat_activity.pid)
      FROM pg_stat_activity
      WHERE datname = current_database() AND pid <> pg_backend_pid();
    SQL
  end

  task :drop => :disconnect
end
