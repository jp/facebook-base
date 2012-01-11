class User < ActiveRecord::Base
  has_one :facebook_account
  has_many :facebook_node
  has_many :friends, :through => :facebook_node, :foreign_key => :facebook_account_id, :source=>:facebook_account
end
#  facebook_node
