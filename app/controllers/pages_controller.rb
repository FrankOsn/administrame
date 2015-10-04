class PagesController < ApplicationController
  #before_action :authenticate
  
  def index
    @meli = Meli.new(1234, "a secret", "Access_Token", "Refresh_Token")
    respond_to do |format|
    
      format.html # show.html.erb
      format.json { render json: @meli }
  
     end
  end

  def show
    meli = Meli.new(123456, "application_secret")
    response = meli.get("/items/MLB474720094")
    respond_to do |format|
    
      format.html # show.html.erb
      format.json { render json: @meli }
  
     end
  end
  
  protected
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        Meli.find_by(auth_token: "Access_Token")
        if auth_token==@meli.access_token
          redirect_to "/pages/index"
        end
      end
    end
end
