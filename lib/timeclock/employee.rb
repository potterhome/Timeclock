require "active_record"

class Employee < ActiveRecord::Base
	has_many :clocks

end