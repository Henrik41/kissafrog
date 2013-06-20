class ShowuserController < ApplicationController
  def index
    @allusers = User.all
    
  end

  def show
    @usermail = User.find_by_id(params[:id])
    
  end
end
