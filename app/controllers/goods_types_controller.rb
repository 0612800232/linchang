class GoodsTypesController < ApplicationController
  # GET /goods_types
  # GET /goods_types.xml
   layout "admin"
  def index
 @goods_types = GoodsType.paginate :page => params[:page]||1,
                            :per_page=>10,
                            :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goods_types }
    end
  end

  # GET /goods_types/1
  # GET /goods_types/1.xml
  def show
    @goods_type = GoodsType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goods_type }
    end
  end

  # GET /goods_types/new
  # GET /goods_types/new.xml
  def new
    @goods_type = GoodsType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goods_type }
    end
  end

  # GET /goods_types/1/edit
  def edit
    @goods_type = GoodsType.find(params[:id])
  end

  # POST /goods_types
  # POST /goods_types.xml
  def create
    @goods_type = GoodsType.new(params[:goods_type])

    respond_to do |format|
      if @goods_type.save
        format.html { redirect_to(goods_url, :notice => 'Goods type was successfully created.') }
        format.xml  { render :xml => @goods_type, :status => :created, :location => @goods_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goods_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goods_types/1
  # PUT /goods_types/1.xml
  def update
    @goods_type = GoodsType.find(params[:id])

    respond_to do |format|
      if @goods_type.update_attributes(params[:goods_type])
        format.html { redirect_to(goods_url, :notice => 'Goods type was successfully created.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goods_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goods_types/1
  # DELETE /goods_types/1.xml
  def destroy
    @goods_type = GoodsType.find(params[:id])
    @goods_type.destroy

    respond_to do |format|
      format.html { redirect_to(goods_types_url) }
      format.xml  { head :ok }
    end
  end
end
