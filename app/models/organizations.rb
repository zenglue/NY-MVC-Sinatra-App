class Organization < ActiveRecord::Base
  has_many :organization_experiances
  has_many :user_experiances, through: :organization_experiances, source: :users
  has_many :users, through: :user_experiances
end
