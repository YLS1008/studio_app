class OpenTasksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    AdminMailer.open_tasks.deliver_later
  end
end
