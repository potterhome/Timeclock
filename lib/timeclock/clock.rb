require 'active_record'

class Clock < ActiveRecord::Base
	belongs_to :employee

	after_create :clock

	def clock
		if self[:in] == nil
			self[:in] = Time.now
		elsif self[:out] == nil
			self[:out] = Time.now
		else
			self.create(employee_id: self[:id], in: Time.now)
		end
		self
	end
end
