class AccountSchemesController < ApplicationController
  # GET /account_schemes
  # GET /account_schemes.xml
  def index
    @account_schemes = AccountScheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_schemes }
    end
  end

  # GET /account_schemes/1
  # GET /account_schemes/1.xml
  def show
    @account_scheme = AccountScheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account_scheme }
    end
  end

  # GET /account_schemes/new
  # GET /account_schemes/new.xml
  def new
    @account_scheme = AccountScheme.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account_scheme }
    end
  end

  # GET /account_schemes/1/edit
  def edit
    @account_scheme = AccountScheme.find(params[:id])
  end

  # POST /account_schemes
  # POST /account_schemes.xml
  def create
    @account_scheme = AccountScheme.new(params[:account_scheme])

    respond_to do |format|
      if @account_scheme.save
        flash[:notice] = 'AccountScheme was successfully created.'
        format.html { redirect_to(@account_scheme) }
        format.xml  { render :xml => @account_scheme, :status => :created, :location => @account_scheme }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account_scheme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /account_schemes/1
  # PUT /account_schemes/1.xml
  def update
    @account_scheme = AccountScheme.find(params[:id])

    respond_to do |format|
      if @account_scheme.update_attributes(params[:account_scheme])
        flash[:notice] = 'AccountScheme was successfully updated.'
        format.html { redirect_to(@account_scheme) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account_scheme.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /account_schemes/1
  # DELETE /account_schemes/1.xml
  def destroy
    @account_scheme = AccountScheme.find(params[:id])
    @account_scheme.destroy

    respond_to do |format|
      format.html { redirect_to(account_schemes_url) }
      format.xml  { head :ok }
    end
  end
end
