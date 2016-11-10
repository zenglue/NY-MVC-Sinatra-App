class Organization < ActiveRecord::Base
  has_many :user_experiences
  has_many :users, through: :user_experiences
end
