class User < ActiveRecord::Base
#  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_one :facebook_account
  has_many :facebook_node
  has_many :friends, :through => :facebook_node, :foreign_key => :facebook_account_id, :source=>:facebook_account
end
#  facebook_node
