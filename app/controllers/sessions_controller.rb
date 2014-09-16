class SessionsController < ApplicationController
  def new
	@error1 = false
	@error2 = false
	if params[:username] != nil
	  if User.find_by_username(params[:username]) == nil
		@error1 = true
		elsif User.find_by_username(params[:username]).password == params[:password]
		  session[:username] = params[:username]
		  redirect_to(:action => 'welcome')
		else
		  @error2 = true
		   end
	  end
	end
	
	def welcome
	  if params[:logout] != nil
	    session[:username] = nil
		redirect_to(:action => 'new')
	  end
	  
	  @error = false
	  if session[:username] == nil
		@error = true
	  else 
		@username = session[:username]
	end
	end
  end

