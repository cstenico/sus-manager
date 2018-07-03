class DashboardsController < ApplicationController
    def index

    end

    def sign_in
        respond_to do |format|
            format.html { render :layout => 'static' }
        end
    end

end
