require 'active_record'

class Clock < ActiveRecord::Base
	belongs_to :employees

end