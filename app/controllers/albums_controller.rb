class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.json
  def index
    @user = current_user
    @albums = @user.albums.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @user = current_user    
    @album = @user.albums.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @user = current_user
    @album = @user.albums.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @user = current_user    
    @album = @user.albums.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @user = current_user        
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
    @user = current_user
    @album = @user.albums.find(params[:id])

     if @user.update_attributes params[:album]
        flash[:notice] = 'User was successfully updated.'
        if params[:album][:avatar].blank?
          redirect_to @album
        else
          render :action => 'cropping'
        end
      else
        render :action => "edit"
      end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @user = current_user
    @album = @user.album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end
