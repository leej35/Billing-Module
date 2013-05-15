class WardTypesController < ApplicationController
  # GET /ward_types
  # GET /ward_types.xml
  def index
    @ward_types = WardType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ward_types }
    end
  end

  # GET /ward_types/1
  # GET /ward_types/1.xml
  def show
    @ward_type = WardType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ward_type }
    end
  end

  # GET /ward_types/new
  # GET /ward_types/new.xml
  def new
    @ward_type = WardType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ward_type }
    end
  end

  # GET /ward_types/1/edit
  def edit
    @ward_type = WardType.find(params[:id])
  end

  # POST /ward_types
  # POST /ward_types.xml
  def create
    @ward_type = WardType.new(params[:ward_type])

    respond_to do |format|
      if @ward_type.save
        flash[:notice] = 'WardType was successfully created.'
        format.html { redirect_to(@ward_type) }
        format.xml  { render :xml => @ward_type, :status => :created, :location => @ward_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ward_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ward_types/1
  # PUT /ward_types/1.xml
  def update
    @ward_type = WardType.find(params[:id])

    respond_to do |format|
      if @ward_type.update_attributes(params[:ward_type])
        flash[:notice] = 'WardType was successfully updated.'
        format.html { redirect_to(@ward_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ward_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ward_types/1
  # DELETE /ward_types/1.xml
  def destroy
    @ward_type = WardType.find(params[:id])
    @ward_type.destroy

    respond_to do |format|
      format.html { redirect_to(ward_types_url) }
      format.xml  { head :ok }
    end
  end
end
