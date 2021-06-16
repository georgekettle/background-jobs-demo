namespace :user do
  desc "update all users with clearbit api"
  task update_all: :environment do
    User.all.each do |user|
      UpdateUserJob.perform_later(user)
    end
  end

  desc "update single user with clearbit api"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    UpdateUserJob.perform_later(user)
  end
end
