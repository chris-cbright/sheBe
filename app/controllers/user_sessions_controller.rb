class UserSessionsController < ApplicationController
  
  def create
    if params[:password] == APP_CONFIG[:admin_password]
      cookies[:admin] = { :value => APP_CONFIG[:admin_cookie], :expires => 1.year.from_now}
      redirect_to posts_path
    else
      render :action=>"new"
    end
  end
end
