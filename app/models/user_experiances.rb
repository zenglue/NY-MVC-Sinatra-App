class UserExperiance < ActiveRecord::Base
  has_many :organization_experiances
  has_many :users, through: :organization_experiances
  has_many :organizations, through: :organization_experiances
end
