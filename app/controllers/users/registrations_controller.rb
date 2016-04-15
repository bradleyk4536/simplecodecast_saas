class Users::RegistrationsController < Devise::RegistrationController
	
	def create
		
		super do |resource| #import create action code from devise
			if params[:plan]
				resource.plan_id = params[:plan] #set user plan id in database
				if resource.plan_id ==2
					resource.save_with_payment 
				else
					resource.save
				end
			end
		end
	end
end