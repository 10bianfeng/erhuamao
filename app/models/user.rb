class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # 基本数据库
         #:token_authenticatable, # 
         #:omniauthable, # 社会化登录
         #:timeoutable, #
         :registerable, # 注册
         :async, # 异步发送
         :recoverable, # 找回密码
         :rememberable, # Remember
         :trackable, # 用户登录IP等追踪记录
         :validatable # 校验字段
         #:lockable#, # 禁用解锁用户
         #:confirmable # 再次（邮件激活）确认才可登录

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  validates_presence_of :email
  validates_uniqueness_of :email

  validates :password, :presence =>true, :confirmation => true, :length => { :within => 6..40 },:on => :create
  validates :password, :confirmation => true, :length => { :within => 6..40 }, :unless => lambda{ |user| user.password.nil? }, :on => :update
  # 定义用户名和email的格式
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

  has_many :bookings
  has_many :gbookings
  has_many :questions
  has_many :dianpins

  #def after_database_authentication
    当用户成功登录后会执行此处代码，另有登录后到那个路径的方法
  #end

  # 是否是管理员
  def admin?
    Setting.admin_emails.include?(self.email)
  end
  
end
