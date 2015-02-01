Blue Lobster
================

CSV.parse(File.read('/Users/bb/Downloads/CheckpointMarshall Input - Organizations.csv'))[1..-1].each {|line| Organization.find_or_create_by!(name: line[0]) {|o| o.description = line[1];o.phone=line[2];o.address=line[3];o.url=line[4]}}

CSV.parse(File.open('/Users/bb/Downloads/CheckpointMarshall Input - Primary Data.csv', "r:ISO-8859-1").read)[1..-1].each {|line| Program.find_or_create_by!(organization: Organization.find_by(name: line[0]),name: line[1], description: line[2], url: line[8])}