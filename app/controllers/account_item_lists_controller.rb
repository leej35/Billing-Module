class AccountItemListsController < ApplicationController
  # GET /account_item_lists
  # GET /account_item_lists.xml
  def index
    @account_item_lists = AccountItemList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_item_lists }
    end
  end

  # GET /account_item_lists/1
  # GET /account_item_lists/1.xml
  def show
    @account_item_list = AccountItemList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account_item_list }
    end
  end

  # GET /account_item_lists/new
  # GET /account_item_lists/new.xml
  def new
    @account_item_list = AccountItemList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account_item_list }
    end
  end

  # GET /account_item_lists/1/edit
  def edit
    @account_item_list = AccountItemList.find(params[:id])
  end

  # POST /account_item_lists
  # POST /account_item_lists.xml
  def create
    @account_item_list = AccountItemList.new(params[:account_item_list])

    respond_to do |format|
      if @account_item_list.save
        flash[:notice] = 'AccountItemList was successfully created.'
        format.html { redirect_to(@account_item_list) }
        format.xml  { render :xml => @account_item_list, :status => :created, :location => @account_item_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account_item_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /account_item_lists/1
  # PUT /account_item_lists/1.xml
  def update
    @account_item_list = AccountItemList.find(params[:id])

    respond_to do |format|
      if @account_item_list.update_attributes(params[:account_item_list])
        flash[:notice] = 'AccountItemList was successfully updated.'
        format.html { redirect_to(@account_item_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account_item_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /account_item_lists/1
  # DELETE /account_item_lists/1.xml
  def destroy
    @account_item_list = AccountItemList.find(params[:id])
    @account_item_list.destroy

    respond_to do |format|
      format.html { redirect_to(account_item_lists_url) }
      format.xml  { head :ok }
    end
  end
end
