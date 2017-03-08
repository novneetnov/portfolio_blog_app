module ApplicationHelper
	def login_helper
		if current_user.is_a? User
			link_to "Logout", destroy_user_session_path, method: :delete
		else
			signup = link_to "Signup", new_user_registration_path
			login = link_to "Login", new_user_session_path
			signup + " | " + login
		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
			content_tag(:p, greeting)
		end
	end
end
