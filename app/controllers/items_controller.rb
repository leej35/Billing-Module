class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/hello
  # GET /items/hello.xml

  def hello
    raise "hello world".to_yaml
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    if params[:type] == "admission"
    	@admission = Admission.find(params[:admission])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.account_id = @item.account_id.to_i
    @item.is_paid = 0
    
    # add additional information to item
    if @item.product_id.slice(0,3) == "svc"
      @item.product_type = "service"
      @item.original_price = Service.find_by_product_id(@item.product_id).price
    elsif @item.product_id.slice(0,3) == "drg"
      @item.product_type = "drugitem"
      @item.original_price = DrugItem.find_by_product_id(@item.product_id).price
    elsif @item.product_id.slice(0,3) == "adm"
      @item.product_type = "admission"
    else
      @item.product_type = "wrongtype"
    end
    
    # check patient has medical scheme
    if not AccountScheme.find_all_by_account_id(@item.account_id).map{ |scheme| [scheme.id]}.nil?  
      schemes_array = AccountScheme.find_all_by_account_id(@item.account_id).map{ |scheme| scheme.medical_scheme_id}

      if @item.product_type == "service" || @item.product_type == "drugitem"
        if Rule.find_all_by_medical_scheme_id_and_product_id(schemes_array,@item.product_id).any?
          rules = Rule.find_all_by_medical_scheme_id_and_product_id(schemes_array,@item.product_id)
          #apply rule that has maximum rate among multiple rules
		  i=0
		  rules.each do |rule|
		    max_rate = rule.rate
		    if max_rate < rule.rate 
  		      max_rate=rule.rate
  		      max_index = i
  		    end
		    i+=1
		  end
		  @rule = rules[i-1]
          @item.rule_id = @rule.id # save the rule id to @item.rule_id
          @item.final_price = @item.original_price * (1 - @rule.rate)   # apply discount, save final price
	    else
	      @item.final_price = @item.original_price
	    end
	    
	  elsif @item.product_type == "admission"  
	    if Rule.find_all_by_medical_scheme_id_and_product_id(schemes_array,WardType.find(Admission.find_by_product_id(@item.product_id).ward_type).product_id).any? # apply rule for "admission"
          rules = Rule.find_all_by_medical_scheme_id_and_product_id(schemes_array,WardType.find(Admission.find_by_product_id(@item.product_id).ward_type).product_id)
        
          #apply rule that has maximum rate among multiple rules
		  i=0
		  rules.each do |rule|
		    max_rate = rule.rate
		    if max_rate < rule.rate 
  		      max_rate=rule.rate
  		      max_index = i
  		    end
		    i+=1
		  end
		
		  @rule = rules[i-1]
          @item.rule_id = @rule.id # save the rule id to @item.rule_id
          @item.final_price = @item.original_price * (1 - @rule.rate)   # apply discount, save final price    
	    else
	      @item.final_price = @item.original_price 
	    end
      end
    else
      @item.final_price = @item.original_price 
    end
    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
