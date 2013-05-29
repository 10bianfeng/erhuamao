# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  #before_filter :authenticate_user!, :only => [:barn]

  def index
  end

  def search
    # type: 1: Destinations 2: 
    @travels = Travel.page(params[:page])
    @destinations = Destination.all
    @interests = Interest.all
    #@departure_dates = Datesprice.all.group_by{|d| d.start_date.strftime("%Y %m")}
    @departure_dates_years = Datesprice.all.map{|d| d.start_date.strftime("%Y")}.uniq.sort
    @departure_dates = Datesprice.all.map{|d| d.start_date.strftime("%Y.%m")}.uniq.sort
    if !params[:type].nil?
      # 搜索关键字
      
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

  def customize
      @travels = Travel.all
  end

  # weibo authentication
  def weibo_login 
    session[:quick_login] = true if params[:quick_login]
    redirect WeiboAuth.new.authorize_url
  end

  def weibo_callback
    halt 401, "没有微博验证码" unless params[:code]
    auth = WeiboAuth.new
    begin
      auth.callback(params[:code])
      user_info = auth.get_user_info
      @account = User.where(:provider => 'weibo', :uid => user_info['id'].to_i).first
      # create commenter account when first weibo login
      unless @account 
        @account = User.create(:provider => 'weibo', :uid => user_info['id'], :name => user_info['screen_name'], :role => 'commenter', :profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
      end
      # update weibo profile if profile is empty
      if @account.profile_url.blank? || @account.profile_image_url.blank?
        @account.update_attributes(:profile_url => user_info['profile_url'], :profile_image_url => user_info['profile_image_url'])
      end
      session[:account_id] = @account.id
      if session[:quick_login]
        session[:quick_login] = nil
        render 'home/weibo_callback', :layout => false
      else
        flash[:notice] = '成功登录'
        redirect_to url(:index)
      end
    rescue => e
      STDERR.puts e
      STDERR.puts e.backtrace.join("\n")
      halt 401, "授权失败，请重试几次"
    end
  end
end