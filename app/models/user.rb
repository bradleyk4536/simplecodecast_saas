class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
#	associate to plan table
	belongs_to :plan
	attr_accessor :stripe_card_token
	def save_with_payment
#		check to see if inputs are valid on credit card form
		if valid? 
			#			use stripe gem to send information to stripe server
			customer = Stripe::Customer.create(description: email, plan: plan_id, card: strip_card_token)
			self.stripe_customer_token = customer.id
			save!
			
		end
	end
end
