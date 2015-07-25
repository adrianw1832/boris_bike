require_relative './lib/docking_station.rb'

puts 'What capacity would you like the station to have?'
number = gets.chomp.to_i
station = DockingStation.new(number)
number.times { station.dock Bike.new }
obj = Object.new

while true
  puts
  puts 'commands: report_broken(useless), dock(useless), release_bike, release_specific_bike, exit'
  command = gets.chomp
  puts 'argument?'
  argument = gets.chomp
  if command == 'exit'
    exit
  elsif station.respond_to?(command) && !obj.respond_to?(command)
    argument.empty? ? (p station.send command) : (p station.send(command, argument.to_i))
  else
    puts 'Huh? Please type in one of the commands.'
  end
end
