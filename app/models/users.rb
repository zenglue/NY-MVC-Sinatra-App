class User < ActiveRecord::Base
  has_many :organization_user_experiances
  has_many :organizations, through: :organization_user_experiances
  has_many :cities, through: :organizations
end
