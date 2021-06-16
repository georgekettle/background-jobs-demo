class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "doing something time consuming"
    sleep 3
    puts "finished doing time consuming stuff"
    # Do something later
  end
end
