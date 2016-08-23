desc "This task is called by the Heroku scheduler add-on"
task :test_warn => :environment do
  puts "Testing warning email..."
  user = User.first
  CompareBusinessJob.perform_now(user.business.ttxid)
  puts "done."
end
