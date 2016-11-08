class User < ActiveRecord::Base
  has_many :user_experiances
  has_many :organizations, through: :user_experiances
  has_many :cities, through: :organizations
end
