require 'thor'
require "timeclock"

module Timeclock
	class CLI < Thor

		def self.start(*)
			super
		end

		def initialize
			DBConnector.new
		end

		default_task :help

		desc "help", ''
		long_desc <<-LD
			Usage: timeclock COMMAND [NAME]\n
				Commands\n
				clockin:  \t  clock employee in\n
				clockout: \t  clock employee out\n
				list:     \t  get a list of timeclocks\n

				Optionally you can specify a name for a specific person.
		LD
		def help(command = 'help')
			super command
		end


		desc "clockin", "clocks employee in"
		long_desc <<-LD
			Usage: timeclock clockin [NAME]\n
				Commands\n
				clockin:  \t  clock employee in\n
				You can optionally specify a name for a specific person.
		LD
		def clockin(name = 'No Name')
			employee = Employee.create_or_first(name: name)
			employee.clock
		end

	end
end