class ImagesIndicesController < ApplicationController
  # GET /images_indices
  # GET /images_indices.xml
  layout "admin"
  def index
    @images_indices = ImagesIndex.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @images_indices }
    end
  end

  # GET /images_indices/1
  # GET /images_indices/1.xml
  def show
    @images_index = ImagesIndex.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @images_index }
    end
  end

  # GET /images_indices/new
  # GET /images_indices/new.xml
  def new
    @images_index = ImagesIndex.new nil

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @images_index }
    end
  end

  # GET /images_indices/1/edit
  def edit
    @images_index = ImagesIndex.find(params[:id])
  end

  # POST /images_indices
  # POST /images_indices.xml
  def create
    @images_index = ImagesIndex.new(params[:images_index])

    respond_to do |format|
        if @images_index.save
        format.html { redirect_to("/images_indices", :notice => 'images_index was successfully created.') }
        format.xml  { render :xml => @images_index, :status => :created, :location => @images_index }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /images_indices/1
  # PUT /images_indices/1.xml
  def update
     @images_index = ImagesIndex.new(params[:images_index])

    respond_to do |format|
      if ImagesIndex.update @images_index
        format.html { redirect_to("/images_indices", :notice => 'Images index was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @images_index.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /images_indices/1
  # DELETE /images_indices/1.xml
  def destroy
   ImagesIndex.delete params[:id]
    respond_to do |format|
      format.html { redirect_to("/images_indices") }
      format.xml  { head :ok }
    end
  end
end
