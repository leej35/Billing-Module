class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = Account.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])
    @patient = Patient.find(@account.patient_id)
	@patient_bean = PatientService.get_patient(@patient.person)
  
	scheme_ids = AccountScheme.find_all_by_account_id(@account.id).map { |account_scheme| [account_scheme.medical_scheme_id]}      
    @schemes_array = MedicalScheme.find(scheme_ids)

	@items_paid = Item.find_all_by_account_id_and_is_paid(@account.id,1)
	@items_unpaid = Item.find_all_by_account_id_and_is_paid(@account.id,0)
	
	#     @medical_schemes = MedicalScheme.find_all_by_id(account_schemes.medical_scheme_id)

# #     
#     account_schemes = []
#     raise @medical_schemes.to_yaml
# 
#     
#     @account_schemes.each do |account_scheme|
#       @account_schemes << account_scheme
#     end
#  	
#  	medical_schemes = []
# 
#     account_schemes.each do |account_scheme|
#       medical_schemes << account_scheme.medical_schemes
#     end
# 
    
    
    
    
#     
#     
#     @schemes = MedicalScheme.find(@account_schemes.medical_scheme_id)
#     
#     @schemes.detect{|medicalscheme| medicalscheme.id = @scheme.medical_scheme_id}
#     
#     @rules.detect{|rule| rule.product_id == @item.product_id}
#     
#     services_array = Service.all.map { |service| [service.name, service.product_id]
#     
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to(@account) }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end
