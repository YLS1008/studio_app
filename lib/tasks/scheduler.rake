desc "Sending summary of open tasks at the start of the day"

task :send_task_summary => :environment do
  OpenTasksJob.perform_now
end
