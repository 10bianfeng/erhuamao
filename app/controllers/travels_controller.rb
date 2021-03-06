# -*- encoding : utf-8 -*-
class TravelsController < ApplicationController
  # GET /travels
  # GET /travels.xml
  def index
    @travels = Travel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travels }
    end
  end

  # GET /travels/1
  # GET /travels/1.xml
  def show
    @travel = Travel.find(params[:id])
    @extend_travels = Travel.find(@travel.extensions_ids.split(",").map { |s| s.to_i })
    @photo_gallerys = []
#    @travel.destinations.each do |destination|
#      @photo_gallerys << destination.photo
#    end

    @hotel_ids = []
    @travel.itineraries.each do |itinerarie|
      @hotel_ids << itinerarie.hotel_id
      @hotel_ids << itinerarie.hotel_id2
      @hotel_ids << itinerarie.hotel_id3
      @hotel_ids << itinerarie.hotel_id4
      @hotel_ids << itinerarie.hotel_id5
    end

    @hotels = Hotel.where("hotels.id in (?)", @hotel_ids.uniq!.compact!)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  # GET /travels/new
  # GET /travels/new.xml
  def new
    @travel = Travel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travel }
    end
  end

  # GET /travels/1/edit
  def edit
    @travel = Travel.find(params[:id])
  end

  # POST /travels
  # POST /travels.xml
  def create
    @travel = Travel.new(params[:travel])

    respond_to do |format|
      if @travel.save
        format.html { redirect_to(@travel, :notice => 'Travel was successfully created.') }
        format.xml  { render :xml => @travel, :status => :created, :location => @travel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /travels/1
  # PUT /travels/1.xml
  def update
    @travel = Travel.find(params[:id])

    respond_to do |format|
      if @travel.update_attributes(params[:travel])
        format.html { redirect_to(@travel, :notice => 'Travel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.xml
  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    respond_to do |format|
      format.html { redirect_to(travels_url) }
      format.xml  { head :ok }
    end
  end
end

