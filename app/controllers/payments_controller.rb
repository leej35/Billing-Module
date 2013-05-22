class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.xml
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payments }
    end
  end
  
  
  # GET /payments/summary
  # GET /payments/summary.xml
  def summary
    @payment = Payment.new
    @account = Account.find(params[:account_id])
    @items = Item.find_all_by_account_id_and_is_paid(@account.id, FALSE)
	
	
    respond_to do |format|
      format.html # summary.html.erb
      format.xml  { render :xml => @payment }
    end

  end

  # GET /payments/1
  # GET /payments/1.xml
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.xml
  def new
    @payment = Payment.new
	@payment.amount = 0
	
	@items = Item.find(params[:items])
    if Payment.last.nil?
 	  payment_id = 1
 	else
 	  payment_id = Payment.last.id + 1
    end
	
	
	@items.each do |item|
	  @payment.amount = item.final_price + @payment.amount
	  item.is_paid = true
	  item.payment_id = payment_id
	  item.save
	end
	
	@payment.account_id = @items.first.account_id
	
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment }
    end
  end



  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.xml
  def create
    @payment = Payment.new(params[:payment])
# 	@payment.account_id = @payment.account_id

    respond_to do |format|
      if @payment.save
        flash[:notice] = 'Payment was successfully created.'
        format.html { redirect_to(@payment) }
        format.xml  { render :xml => @payment, :status => :created, :location => @payment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.xml
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        flash[:notice] = 'Payment was successfully updated.'
        format.html { redirect_to(@payment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.xml
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to(payments_url) }
      format.xml  { head :ok }
    end
  end
end
