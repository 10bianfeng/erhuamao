# -*- encoding : utf-8 -*-

require "weibo"
class WelcomeController < ApplicationController
  #before_filter :authenticate_user!, :only => [:barn]

  def index
  end

  def search    
    @destinations = Destination.all
    @interests = Interest.all
    @departure_dates_years = Datesprice.all.map{|d| d.start_date.strftime("%Y")}.uniq.sort
    @departure_dates = Datesprice.all.map{|d| d.start_date.strftime("%Y.%m")}.uniq.sort
    if !params[:keyword].nil?
      @travels = Travel.where("name LIKE ?", "%#{params[:keyword]}%").page(params[:page])
    elsif !params[:destination].nil?
      @travels = Destination.find(params[:destination]).travels.page(params[:page])
    elsif !params[:interest].nil?
      @travels = Interest.find(params[:interest]).travels.page(params[:page])
    elsif !params[:date].nil?
      @travels = Travel.where("name LIKE ?", "%#{params[:date]}%").page(params[:page])
    elsif !params[:price_start].nil?
      @travels = Travel.where("priced_from > ? and priced_from < ?", "#{params[:price_start]}","#{params[:price_end]}").page(params[:page])
    else
      @travels = Travel.page(params[:page])
    end

    if cookies[:trip_compare]
      @compare_array = cookies[:trip_compare].split(',')
    end
  end

  def compare
    compares=[]
    if cookies[:trip_compare]
      @compare_array=cookies[:trip_compare].split(',')
      (-3..-1).each do |i|
        compares.unshift(@compare_array[i]) if @compare_array[i]
      end
    end
    @compares=Travel.find(compares)
  end

  def customize_select_destination
    @destination = Destination.find(params[:id])
    @citys = @destination.cities
    render :layout => false
  end

  def customize_select_city
    @city = City.find(params[:id])
    @destination = @city.destination
    @hotels = @city.hotels
    render :layout => false
  end

  def customize_select_hotel
    @hotel = Hotel.find(params[:id])
    render :layout => false
  end

  # weibo authentication
  def weibo_login 
    session[:quick_login] = true if params[:quick_login]
    redirect_to WeiboAuth.new.authorize_url
  end

  def weibo_callback
    auth = WeiboAuth.new
    auth.callback(params[:code])
    ap auth
    user_info = auth.get_user_info
    @account = User.where(:provider => 'weibo', :uid => user_info['id'].to_i).first
    # create commenter account when first weibo login
    unless @account 
      @account = User.create(:provider => 'weibo', :uid => user_info['id'], :name => user_info['screen_name'], :profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
    end
    # update weibo profile if profile is empty
    if @account.profile_url.blank? || @account.profile_image_url.blank?
      @account.update_attributes(:profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
    end

    sign_in(:user, @account)
    flash[:notice] = '成功登录'
    redirect_to root_path
  end
end
