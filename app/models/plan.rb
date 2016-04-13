class Plan < ActiveRecord::Base
#	setup plan options
	
	has_many :users
	
end