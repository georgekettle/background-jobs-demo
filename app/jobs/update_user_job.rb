class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Calling Clearbit API for #{user.email}..."
    sleep 5
    puts "Finsihed calling Clearbit API for #{user.email}..."
    # Do something later
  end
end
