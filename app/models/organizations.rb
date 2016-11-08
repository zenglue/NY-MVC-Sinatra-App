class Organization < ActiveRecord::Base
  belongs_to :city
  has_many :organization_user_exeperiances
  has_many :users, through: :organization_user_experiances
end
