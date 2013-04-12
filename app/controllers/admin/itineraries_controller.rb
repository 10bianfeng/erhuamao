# -*- encoding : utf-8 -*-
# insub's admin scaffold template
# rails g scaffold_controller_admin itineraries name:string desc:text travel_id:integer sort:integer hotel_id:integer meals:string start_day_num:integer end_day_num:integer 

class Admin::ItinerariesController < ApplicationController
  layout "admin"
  before_filter :require_admin  #, :only=> [:index], :except=> [:index]
  
  # GET /itineraries
  # GET /itineraries.xml
  def index
    @itineraries = Itinerary.order("updated_at DESC").page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @itineraries }
    end
  end

  # GET /itineraries/1
  # GET /itineraries/1.xml
  def show
    @itinerary = Itinerary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @itinerary }
    end
  end

  # GET /itineraries/new
  # GET /itineraries/new.xml
  def new
    @itinerary = Itinerary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @itinerary }
    end
  end

  # GET /itineraries/1/edit
  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  # POST /itineraries
  # POST /itineraries.xml
  def create
    @itinerary = Itinerary.new(params[:itinerary])

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to(admin_itineraries_url, :notice => 'Itinerary was successfully created.') }
        format.xml  { render :xml => @itinerary, :status => :created, :location => @itinerary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /itineraries/1
  # PUT /itineraries/1.xml
  def update
    @itinerary = Itinerary.find(params[:id])

    respond_to do |format|
      if @itinerary.update_attributes(params[:itinerary])
        format.html { redirect_to([:admin, @itinerary], :notice => 'Itinerary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @itinerary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /itineraries/1
  # DELETE /itineraries/1.xml
  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to(admin_itineraries_url) }
      format.xml  { head :ok }
    end
  end
end
