class ProfilesController < ApplicationController

	def new
#		form where user can fill out own profile.
		@user = User.find(params[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)

		if @profile.save
			flash[:success] = 'Profile Created'
			redirect_to user_path(params[:user_id])
		else
			render action: :new
		end
	end

		private

#		white list input from form
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :desciption)
		end

end
