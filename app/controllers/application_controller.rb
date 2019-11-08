class ApplicationController < ActionController::Base
    include UsersHelper
    
    private

    def has_access?
        unless is_administrator?(@event)
          flash[:danger] = "NON"
          redirect_back(fallback_location: root_path)
        end
      end
end
