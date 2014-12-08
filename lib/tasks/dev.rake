namespace :dev do
  desc 'Sets the app up for development'
  task :setup => :environment do
    admin = User.find_or_create_by! email: 'admin@foo.com' do |u|
      u.password = 'password'
      u.password_confirmation = 'password'
    end

    admin.update! confirmed_at: Time.now
    admin.add_role :admin

    user = User.find_or_create_by! email: 'user@foo.com' do |u|
      u.password = 'password'
      u.password_confirmation = 'password'
    end

    user.update! confirmed_at: Time.now
    user.add_role :veteran

  end
end