module ApplicationHelper
	def sign_in(user)
	    self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		# binding.pry
		if !session[:user_id]
			nil
		else
	    	@current_user ||= User.find(session[:user_id])
	    end
	end

	def signed_in?
		!current_user.nil?
	end
end
