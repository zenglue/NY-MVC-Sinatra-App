class OrganizationUserExperiance < ActiveRecord::Base
  belongs_to :user_account
  belongs_to :organization
end
