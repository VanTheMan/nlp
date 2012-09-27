class UsersController < ApplicationController
	def index
		@users = User.order("num_translate DESC").limit(5)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user])
		@user.num_translate = 0
				
		if (params[:user][:name] == "")
			@user.name = "Anonymous"
		end

		if @user.save
			session[:user_id] = @user.id
			sign_in @user
			redirect_to edit_scripts_path()
		elsif 
			redirect_to root_path()
		end
				
	end

	def sign_out
		reset_session
		redirect_to root_path
	end
end
