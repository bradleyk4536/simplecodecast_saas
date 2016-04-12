class ContactMailer < ActiveMailer::Base
	
	default to: 'k_bnet570@verizon.net'
	
	def contact_email(name, email, body)
		
		@name = name
		@email = email
		@body = body
		
		mail(from: email, subject: 'Contact Form Message')
	end
end