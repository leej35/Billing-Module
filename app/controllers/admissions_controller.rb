class AdmissionsController < ApplicationController
  # GET /admissions
  # GET /admissions.xml
  def index
    @admissions = Admission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admissions }
    end
  end

  # GET /admissions/1
  # GET /admissions/1.xml
  def show
    @admission = Admission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admission }
    end
  end

  # GET /admissions/new
  # GET /admissions/new.xml
  def new
    @admission = Admission.new
    @admission.account_id = params[:account_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admission }
    end
  end

  # GET /admissions/1/edit
  def edit
    @admission = Admission.find(params[:id])
  end

  # POST /admissions
  # POST /admissions.xml
  def create
    @admission = Admission.new(params[:admission])
    if Admission.last.nil?
 	  admission_id = 1
 	else
 	  admission_id = Admission.last.id + 1
    end
	@admission.product_id = "adm_" + admission_id.id.to_s

	#calculate price of admission
	@days = (@admission.end_date.to_date - @admission.start_date.to_date).numerator
	@admission.totalprice = @days * WardType.find(@admission.ward_type).daily_price

    respond_to do |format|
      if @admission.save
        flash[:notice] = 'Admission was successfully created.'
        format.html { redirect_to( :controller => "items", :action => "new", :admission => @admission ,:account_id => @account.id, :type => "admission") }
        format.xml  { render :xml => @admission, :status => :created, :location => @admission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admissions/1
  # PUT /admissions/1.xml
  def update
    @admission = Admission.find(params[:id])

    respond_to do |format|
      if @admission.update_attributes(params[:admission])
        flash[:notice] = 'Admission was successfully updated.'
        format.html { redirect_to(@admission) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admissions/1
  # DELETE /admissions/1.xml
  def destroy
    @admission = Admission.find(params[:id])
    @admission.destroy

    respond_to do |format|
      format.html { redirect_to(admissions_url) }
      format.xml  { head :ok }
    end
  end
end
