class ApplicationController < ActionController::Base
    include UsersHelper
    include EventsHelper
    
    private

    def has_access?
        unless is_administrator?(@event)
          flash[:danger] = "NON"
          redirect_back(fallback_location: root_path)
        end
      end
end
