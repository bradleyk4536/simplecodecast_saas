class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end
	
	def create
		@contact = Contact.new(contact_params)
		
		#		immediately attempts to save contact info to database if passes performs code below
		if @contact.save
#			variables for email 
			name = params[:contact][:name]
			email = params[:contact][:email]
			body = params[:contact][:body]
			
#			looks in contact controller and runs contact_email method
			ContactMailer.contact_email(name, email, body).deliver
			
			
#			displays message when successful
			flash[:success] = 'Message Sent'
			
#			redirects back to empty contact form
			redirect_to new_contact_path
			
#			if email fails performs code below
		else
			#			displays message when failed
			flash[:danger] = 'Error Occured, message has not been sent'
			
			#			redirects back to empty contact form
			redirect_to new_contact_path 
		end
	end
	
	private
		def contact_params
			params.require(:contact).permit(:name, :email, :comment)
		end
	
end