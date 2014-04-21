require 'active_record'

module Timeclock
	class DBConnector < ActiveRecord::Base
		DATABASE = "#{Dir.home}/timeclock_db"

		def initialize
			if FileTest.exists? File.expand_path(DATABASE)
				connect
			else
				connect
				setup_database
			end
		end

		def self.print_database_path
			puts 
		end

		def setup_database
			CreateTables.up
		end

		def delete_database
			CreateTables.down
		end

		def connect
			ActiveRecord::Base.establish_connection(
				:adapter => 'sqlite3',
				:database => DATABASE
				)
		end

	end
DBConnector.print_database_path

	class CreateTables < ActiveRecord::Migration

		def self.up
			create_table :employees do |t|
				t.string :name
			end

			create_table :clocks do |t|
				t.string :employee_id
				t.string :in
				t.string :out
			end
		end

		def self.down
			drop_table :employees
			drop_table :clocks
		end
		
	end
end