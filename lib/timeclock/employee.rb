require "active_record"

class Employee < ActiveRecord::Base
	has_many :clocks, dependent: :destroy

	def clock
		clocks.last.clock
	end
end