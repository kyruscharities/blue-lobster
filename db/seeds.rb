# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

array_of_arrays = CSV.read('db/MOC_to_ONET-SOC.csv', encoding: 'iso-8859-1:UTF-8')
array_of_arrays.each do |row|
  MilitaryJobCode.find_or_create_by! service: row[0], mpc: row[1], status: row[2], code: row[3], title: row[4], onetcode: row[5], onettitle: row[6]
end

array_of_arrays = CSV.read('db/ListOfProfDesignations.csv', encoding: 'iso-8859-1:UTF-8')
array_of_arrays.each do |row|
  unless row.empty?
    Certification.find_or_create_by! name: row[1], category: row[0], post_nominal: row[2]
  end
end