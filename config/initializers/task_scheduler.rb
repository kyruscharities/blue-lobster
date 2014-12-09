require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("2s") do
    User.send_emails
end