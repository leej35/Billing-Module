class MedicalSchemesController < ApplicationController
  # GET /medical_schemes
  # GET /medical_schemes.xml
  def index
    @medical_schemes = MedicalScheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medical_schemes }
    end
  end

  # GET /medical_schemes/1
  # GET /medical_schemes/1.xml
  def show
    @medical_scheme = MedicalScheme.find(params[:id])

	@rules =  @medical_scheme.rules.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medical_scheme }
    end
  end

  # GET /medical_schemes/new
  # GET /medical_schemes/new.xml
  def new
    @medical_scheme = MedicalScheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medical_scheme }
    end
  end

  # GET /medical_schemes/1/edit
  def edit
    @medical_scheme = MedicalScheme.find(params[:id])
  end

  # POST /medical_schemes
  # POST /medical_schemes.xml
  def create
    @medical_scheme = MedicalScheme.new(params[:medical_scheme])

    respond_to do |format|
      if @medical_scheme.save
        flash[:notice] = 'MedicalScheme was successfully created.'
        format.html { redirect_to(@medical_scheme) }
        format.xml  { render :xml => @medical_scheme, :status => :created, :location => @medical_scheme }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medical_scheme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medical_schemes/1
  # PUT /medical_schemes/1.xml
  def update
    @medical_scheme = MedicalScheme.find(params[:id])

    respond_to do |format|
      if @medical_scheme.update_attributes(params[:medical_scheme])
        flash[:notice] = 'MedicalScheme was successfully updated.'
        format.html { redirect_to(@medical_scheme) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medical_scheme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_schemes/1
  # DELETE /medical_schemes/1.xml
  def destroy
    @medical_scheme = MedicalScheme.find(params[:id])
    @medical_scheme.destroy

    respond_to do |format|
      format.html { redirect_to(medical_schemes_url) }
      format.xml  { head :ok }
    end
  end
end
