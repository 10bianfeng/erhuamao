# -*- encoding : utf-8 -*-
# insub's scaffold template
# rails g scaffold_controller_insub pages tit:string sub_tit:text cont:text page_category_id:integer author:string 
class UsersController < ApplicationController
  #before_filter :custom_user_auth, :only => [:home, :setting]
  prepend_before_filter :authenticate_scope!, :except => [:show]
  include Devise::Controllers::InternalHelpers #加上之后就不能过滤权限了

  def show # 对外的访问主页，也可作为自己的主页，尚有待完善，字段是否使用username?
    @user = User.find_by_username(params[:id])
    unless @user
      render :text => "无此用户"
    end
  end

  def setting
    @user = User.find(current_user.id)
  end

  def update_setting
    @user = User.find(current_user.id)
    @user.localtion = params[:user][:localtion] #不允许修改用户名
    
    if @user.save
      redirect_to :action => "setting"
    else
      render :action => "setting", :error => '出错.'
    end
  end

  def update_password
     @user = User.find(current_user.id)
     @params = {:current_password => params[:user][:current_password],:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}

     # 如果当前密码正确并且修改后密码不等于空
     if @user.update_with_password(@params) && !params[:user][:password].blank?
        redirect_to(:new_user_session)
     else
        render :action => "setting"
     end
  end

  def update_avatar
     @user = User.find(current_user.id)
     @user.avatar = params[:user][:avatar]
     if @user.save
      redirect_to :action => "setting"
    else
      render :action => "setting", :error => '出错.'
    end
  end

private
  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
      send(:"authenticate_user!", :force => true)
      self.resource = send(:"current_user")
  end
  
end
