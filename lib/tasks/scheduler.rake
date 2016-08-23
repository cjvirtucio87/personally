desc "This task is called by the Heroku scheduler add-on"

task :test_warn => :environment do
  puts "Testing warning email..."
  user = User.first
  CompareBusinessJob.perform_now(user.business.ttxid)
  puts "done."
end

task :warn_owner => :environment do
  users = User.all
  users.each do |user|
    puts "Checking SF Open Data.."
    if CompareBusinessJob.perform_now(user.business.ttxid)
      puts "Changes detected! Informing the owner now."
    else
      puts "No changes found. Carrying on."
    end
  end
end

task :notify_watchers => :environment do
  users = User.watchers
  if users.empty?
    puts "No bookmarks at the moment!"
  else
    users.each do |user|
      puts "Informing watchers.."
      NotifyWatchersJob.perform_now(user.business.ttxid)
      puts "Done."
    end
  end
end