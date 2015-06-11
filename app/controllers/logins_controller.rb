class LoginsController < InheritedResources::Base

def index
	if user_signed_in? 		
	 		redirect_to :controller => 'home', :action => 'new' 	 			
	 	end 
	
end



  private

    def login_params
      params.require(:login).permit()
    end
end

