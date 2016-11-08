class OrganizationExperiances < ActiveRecord::Base
  has_many :user_experiances
  has_many :users, through: :user_experiances
  has_many :organizations, through: :user_experiances
end
