class ConversationController < ApplicationController
  def create
    @sender = User.find_by_id(params[:id])
    x = current_user.send_message(@sender,params[:sendmymail],'hi')
    
   redirect_to :action => 'justsend', :id => @sender.id
  end
  
  def justsend
    @sender = User.find_by_id(params[:id])
    @user == current_user
  end
  
end
