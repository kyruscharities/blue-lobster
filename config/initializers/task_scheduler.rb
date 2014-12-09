require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("2h") do
    User.send_emails
end