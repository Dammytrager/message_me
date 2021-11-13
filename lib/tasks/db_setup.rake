namespace :db_setup do

  task :init do
    desc 'Initialize database with some data'

    puts 'creating tables...'
    system('rails db:migrate')
    puts 'tables created'

    puts 'seeding database...'
    system('rails db:seed')
    puts 'database seeded'
  end

  task :rerun do
    desc 'drop all tables db_setup:reset and reruns the db_setup:init job'

    system('rake db_setup:reset')
    system('rails db_setup:init')
  end

  task :reset do
    desc 'drop all tables'

    system('rake db:migrate VERSION=0')
  end
end
