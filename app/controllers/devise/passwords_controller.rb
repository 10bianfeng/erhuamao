# -*- encoding : utf-8 -*-
class Devise::PasswordsController < ApplicationController
  prepend_before_filter :require_no_authentication
  include Devise::Controllers::InternalHelpers
  #  validates_captcha

  # GET /resource/password/new 忘记密码
  def new
    build_resource({})
    render_with_scope :new
  end

  # POST /resource/password 发送重置密码邮件
  def create
    # insub 增加验证码校验
    unless captcha_validated?
      self.resource = resource_class.new
      flash[:error] = '验证码错误，请重新输入'
      render :action => 'users/passwords/new'
    else
      self.resource = resource_class.send_reset_password_instructions(params[resource_name])

      if successfully_sent?(resource)
        respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
      else
        respond_with_navigational(resource){ render_with_scope :new }
      end
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
    render_with_scope :edit
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end

  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      new_session_path(resource_name)
    end

end
