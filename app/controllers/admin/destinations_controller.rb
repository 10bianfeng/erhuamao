# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin destinations name:string desc_title:string desc:text banner_pic:string map_pic:string flights:text timezone:string climate:text health_requirements:text voltage:text currency:text ancestry:string 

class Admin::DestinationsController < ApplicationController
  layout "admin"
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /destinations
  # GET /destinations.xml
  def index
    @destinations = Destination.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.xml
  def show
    @destination = Destination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/new
  # GET /destinations/new.xml
  def new
    @destination = Destination.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
  end

  # POST /destinations
  # POST /destinations.xml
  def create
    @destination = Destination.new(params[:destination])

    respond_to do |format|
      if @destination.save
        format.html { redirect_to(admin_destinations_url, :notice => 'Destination was successfully created.') }
        format.xml  { render :xml => @destination, :status => :created, :location => @destination }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.xml
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to([:admin, @destination], :notice => 'Destination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.xml
  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy

    respond_to do |format|
      format.html { redirect_to(admin_destinations_url) }
      format.xml  { head :ok }
    end
  end

  def new_photo
    @destination = Destination.find(params[:id])
  end

  def upload_photo
    @destination = Destination.find(params[:id])
    @photo = @destination.photos.create(:pic => params[:photo][:pic], :desc => params[:photo][:desc])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        format.html { redirect_to([:admin, @destination], :notice => 'Destination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  #绑定相关PDF
  def new_brochure_destination
    @destination = Destination.find(params[:id])
  end

  def create_brochure_destination
    @destination = Destination.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    @destination.brochures << @brochure

    respond_to do |format|
      if @destination.save
        format.html { redirect_to([:admin, @destination], :notice => 'Destination was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "new_brochure_destination" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy_brochure_destination
    @destination = Destination.find(params[:id])
    @brochure = Brochure.find(params[:brochure_id])
    

    respond_to do |format|
      if BrochureDestination.where("destination_id = ? AND brochure_id = ?", @destination.id , @brochure.id ).destroy_all
        format.html { redirect_to([:admin, @destination], :notice => 'Destination was successfully updated.') }
        format.xml  { head :ok }
      end
    end
  end
  
end
