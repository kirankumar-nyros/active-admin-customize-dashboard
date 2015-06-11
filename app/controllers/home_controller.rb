class HomeController < ApplicationController
  before_action :authenticate_user! 
	def index
		@contacts = Contact.all
		@groups = Group.all
		@skills = Skill.all
	 	if user_signed_in? 		
	 		redirect_to :controller => 'home', :action => 'new' 
	 			
	 	else
	 		 redirect_to '/admin/login' 	
	 	end 
	end

	def new
		@contacts = Contact.all
		@groups = Group.all
		@skills = Skill.all
		respond_to do |format|
		format.html { render :new }
	end
	end
	def edit
	end

end
