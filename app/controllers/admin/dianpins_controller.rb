# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin dianpins name:string cont:text travel_code:string travel_id:integer user_id:integer is_show:boolean 

class Admin::DianpinsController < Admin::BaseController
  
  # GET /dianpins
  # GET /dianpins.xml
  def index
    @dianpins = Dianpin.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dianpins }
    end
  end

  # GET /dianpins/1
  # GET /dianpins/1.xml
  def show
    @dianpin = Dianpin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dianpin }
    end
  end

  # GET /dianpins/new
  # GET /dianpins/new.xml
  def new
    @dianpin = Dianpin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dianpin }
    end
  end

  # GET /dianpins/1/edit
  def edit
    @dianpin = Dianpin.find(params[:id])
  end

  # POST /dianpins
  # POST /dianpins.xml
  def create
    @dianpin = Dianpin.new(params[:dianpin])

    respond_to do |format|
      if @dianpin.save
        format.html { redirect_to(admin_dianpins_url, :notice => 'Dianpin was successfully created.') }
        format.xml  { render :xml => @dianpin, :status => :created, :location => @dianpin }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dianpin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dianpins/1
  # PUT /dianpins/1.xml
  def update
    @dianpin = Dianpin.find(params[:id])

    respond_to do |format|
      if @dianpin.update_attributes(params[:dianpin])
        format.html { redirect_to([:admin, @dianpin], :notice => 'Dianpin was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dianpin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dianpins/1
  # DELETE /dianpins/1.xml
  def destroy
    @dianpin = Dianpin.find(params[:id])
    @dianpin.destroy

    respond_to do |format|
      format.html { redirect_to(admin_dianpins_url) }
      format.xml  { head :ok }
    end
  end
end
