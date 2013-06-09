class SaysomethingsController < ApplicationController
  # GET /saysomethings
  # GET /saysomethings.json
  before_filter :choose_user
  
  def index
    @saysomethings = @user.saysomething.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saysomethings }
    end
  end

  # GET /saysomethings/1
  # GET /saysomethings/1.json
  def show
    @saysomething = @user.saysomething

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saysomething }
    end
  end

  # GET /saysomethings/new
  # GET /saysomethings/new.json
  def new
    
    @saysomething = @user.build_saysomething(params[:saysomething])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saysomething }
    end
  end

  # GET /saysomethings/1/edit
  def edit
   
    if @user.saysomething
      
      @saysomething = @user.saysomething

       respond_to do |format|
         format.js {}
          format.html {}# new.html.erb
          format.xml  { render :xml => @user.saysomething }
        end
        

    
    else
        respond_to do |format|

          format.html {redirect_to :controller => "saysomething", :action => "new" }
        end

      end
  end

  # POST /saysomethings
  # POST /saysomethings.json
  def create
    @saysomething = @user.create_saysomething(params[:saysomething])

    respond_to do |format|
      if @saysomething.save
        format.html { redirect_to @saysomething, notice: 'Saysomething was successfully created.' }
        format.json { render json: @saysomething, status: :created, location: @saysomething }
      else
        format.html { render action: "new" }
        format.json { render json: @saysomething.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saysomethings/1
  # PUT /saysomethings/1.json
  def update
    @saysomething = @user.saysomething

    respond_to do |format|
      if @saysomething.update_attributes(params[:saysomething])
        format.html { redirect_to @saysomething, notice: 'Saysomething was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saysomething.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saysomethings/1
  # DELETE /saysomethings/1.json
  def destroy
    @saysomething = @user.saysomething.find(params[:id])
    @saysomething.destroy

    respond_to do |format|
      format.html { redirect_to saysomethings_url }
      format.json { head :no_content }
    end
  end
  
  private
     def choose_user
        @user = current_user
     end
     
end
