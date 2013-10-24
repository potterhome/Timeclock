require 'thor'
require_relative "db_connector"

module Timeclock
	class CLI < Thor


		def self.start(*)
			super
		end

		def initialize(*)
			::DBConnector.new
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



	end
end