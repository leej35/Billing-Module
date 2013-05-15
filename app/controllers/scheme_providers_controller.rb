class SchemeProvidersController < ApplicationController
  # GET /scheme_providers
  # GET /scheme_providers.xml
  def index
    @scheme_providers = SchemeProvider.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scheme_providers }
    end
  end

  # GET /scheme_providers/1
  # GET /scheme_providers/1.xml
  def show
    @scheme_provider = SchemeProvider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scheme_provider }
    end
  end

  # GET /scheme_providers/new
  # GET /scheme_providers/new.xml
  def new
    @scheme_provider = SchemeProvider.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scheme_provider }
    end
  end

  # GET /scheme_providers/1/edit
  def edit
    @scheme_provider = SchemeProvider.find(params[:id])
  end

  # POST /scheme_providers
  # POST /scheme_providers.xml
  def create
    @scheme_provider = SchemeProvider.new(params[:scheme_provider])

    respond_to do |format|
      if @scheme_provider.save
        flash[:notice] = 'SchemeProvider was successfully created.'
        format.html { redirect_to(@scheme_provider) }
        format.xml  { render :xml => @scheme_provider, :status => :created, :location => @scheme_provider }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scheme_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scheme_providers/1
  # PUT /scheme_providers/1.xml
  def update
    @scheme_provider = SchemeProvider.find(params[:id])

    respond_to do |format|
      if @scheme_provider.update_attributes(params[:scheme_provider])
        flash[:notice] = 'SchemeProvider was successfully updated.'
        format.html { redirect_to(@scheme_provider) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scheme_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scheme_providers/1
  # DELETE /scheme_providers/1.xml
  def destroy
    @scheme_provider = SchemeProvider.find(params[:id])
    @scheme_provider.destroy

    respond_to do |format|
      format.html { redirect_to(scheme_providers_url) }
      format.xml  { head :ok }
    end
  end
end
