class ProfileController < ApplicationController
  
before_filter :getcurrentuser
  def index
    @mainpic1 = @user.albums.where('setting' => true)
    @mainpic = @mainpic1.first
    @allpics = @user.albums.all
    @xtra = @user.xtra
  end
  

private

   def getcurrentuser
     @user = current_user
   end
   

  end