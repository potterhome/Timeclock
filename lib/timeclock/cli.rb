require 'thor'
require 'formatador'
require_relative 'employee'
require_relative 'clock'
require_relative "db_connector"
require "active_record"

module Timeclock
	class CLI < Thor

		
		def self.start(*)
			super
		end

		def initialize(*)
			Timeclock::DBConnector.new
			super
		end

		default_task :help

		desc "help", ''
		long_desc <<-LD
			Usage: timeclock COMMAND [NAME]\n
				Commands\n
				clockin:    clock employee in\n
				clockout:  clock employee out\n
				list:       get a list of timeclocks\n

				Optionally you can specify a name for a specific person.
		LD
		def help(command = 'help')
			super command
		end

		desc "clockin", ''
		def clockin(name = 'No Name')
			employee = Employee.find_or_create_by(name: name)
			c = Clock.create(employee_id: employee.id)
		
			puts "#{name.capitalize} clocked in at #{employee.clock.in}."
		end

		desc "clockout", ''
		def clockout name = "No Name"
			employee = Employee.find_by(name: name)
			puts "#{name.capitalize} clocked out at #{employee.clock.out}."
		end

		desc "list", ''
		def list(name = "No Name")
			employee = ::Employee.find_by(name: name)
				<<-LIST 
				#{name}
					Day				In					Out
					#{employee.clocks.each do |clock|
						
					end
					}
				LIST
		end
	end
end


