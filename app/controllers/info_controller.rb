class InfoController < ApplicationController
  

  
  def index
    @user = current_user
        @albums = @user.albums.all
        @numpic = (8 - @albums.count)
        @mainpic = @user.albums.where(:setting => true)
        
    @saysomething = @user.saysomething
        
  end

  
end
