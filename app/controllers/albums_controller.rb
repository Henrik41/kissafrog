class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json
  layout 'album'
  before_filter :getcurrentuser
  
  def index
    
    @albums = @user.albums.all

    respond_to do |format|
      format.html # index.html.erb

      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
   
    @album = @user.albums.find(params[:id])

    respond_to do |format|
         
      format.html # show.html.erb
      format.js { render 'show'}
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
     
    @album = @user.albums.new
     respond_to do |format|
        format.js { render 'new' }
        format.html # show.html.erb
      end
  end

  # GET /albums/1/edit
  def edit
    
    @album = @user.albums.find(params[:id])
   
      if @album
         
         render :action => 'cropping'

     else
       render :action => 'new'
     end
  end

  # POST /albums
  # POST /albums.json
  def create
          
    @album = @user.albums.new(params[:album])
    
    if @album.save
       flash[:notice] = 'User was successfully created.'
       if params[:album][:avatar].blank?
         redirect_to @album
       else
        
         render :action => 'cropping'
       end
     else
       render :action => 'new'
     end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
       
    @album = @user.albums.find(params[:id])
    respond_to do |format|
       format.js { render 'new' }
       format.html{
     if @album.update_attributes params[:album]
        @album.avatar.reprocess!
        flash[:notice] = 'User was successfully updated.'
        if params[:album][:avatar].blank?
          redirect_to @album
        else
          
          render :action => 'cropping'
        end
      else
        render :action => "edit"
      end}
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy

    @album = @user.albums.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
  
  private
  def getcurrentuser
    @user = current_user
  end
  
end
