class GoodsController < ApplicationController
  # GET /goods
  # GET /goods.xml
  layout "admin"
  def index
    @goods = Good.where("1=1") 
    @goods = @goods.where("name like '%#{params[:name].strip}%'") if params[:name]  and params[:name].strip !=""
    @goods = @goods.where("goods_type_id = #{params[:goods_type_id]}") if params[:goods_type_id] and params[:goods_type_id] !=""
    @goods = @goods.paginate :page => params[:page]||1,
      :per_page=>10,
      :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods }
    end
  end

  # GET /goods/1
  # GET /goods/1.xml
  def show
    @good = Good.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/new
  # GET /goods/new.xml
  def new
    @good = Good.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @good }
    end
  end

  # GET /goods/1/edit
  def edit
    @good = Good.find(params[:id])
  end

  # POST /goods
  # POST /goods.xml
  def create
    @good = Good.new(params[:good])

    respond_to do |format|
      if @good.save
        format.html { redirect_to(@good, :notice => 'Good was successfully created.') }
        format.xml  { render :xml => @good, :status => :created, :location => @good }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods/1
  # PUT /goods/1.xml
  def update
    @good = Good.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:good])
        format.html { redirect_to(@good, :notice => 'Good was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @good.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.xml
  def destroy
    @good = Good.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.html { redirect_to(goods_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def add_new

    params[:no_select_id].each do |id|
      if id!=nil and id !=""
        good = Good.find(id)
        good.is_new =false 
        good.save
      end
    end

    params[:select_id].each do |id|
      if id!=nil and id !=""
        good = Good.find(id)
        good.is_new =true 
        good.save
      end
    end if params[:select_id]
    respond_to do |format|
      format.html { redirect_to(goods_url) }
    end
  end
end
