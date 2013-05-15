class DrugItemsController < ApplicationController
  # GET /drug_items
  # GET /drug_items.xml
  def index
    @drug_items = DrugItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drug_items }
    end
  end

  # GET /drug_items/1
  # GET /drug_items/1.xml
  def show
    @drug_item = DrugItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drug_item }
    end
  end

  # GET /drug_items/new
  # GET /drug_items/new.xml
  def new
    @drug_item = DrugItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drug_item }
    end
  end

  # GET /drug_items/1/edit
  def edit
    @drug_item = DrugItem.find(params[:id])
  end

  # POST /drug_items
  # POST /drug_items.xml
  def create
    @drug_item = DrugItem.new(params[:drug_item])
    if DrugItem.last.nil?
 	  drugitem_id = 1
 	else
 	  drugitem_id = DrugItem.last.id + 1
    end
    
	@drug_item.product_id = "drg_" + drugitem_id.to_s
    respond_to do |format|
      if @drug_item.save
        flash[:notice] = 'DrugItem was successfully created.'
        format.html { redirect_to(@drug_item) }
        format.xml  { render :xml => @drug_item, :status => :created, :location => @drug_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drug_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drug_items/1
  # PUT /drug_items/1.xml
  def update
    @drug_item = DrugItem.find(params[:id])

    respond_to do |format|
      if @drug_item.update_attributes(params[:drug_item])
        flash[:notice] = 'DrugItem was successfully updated.'
        format.html { redirect_to(@drug_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drug_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_items/1
  # DELETE /drug_items/1.xml
  def destroy
    @drug_item = DrugItem.find(params[:id])
    @drug_item.destroy

    respond_to do |format|
      format.html { redirect_to(drug_items_url) }
      format.xml  { head :ok }
    end
  end
end
