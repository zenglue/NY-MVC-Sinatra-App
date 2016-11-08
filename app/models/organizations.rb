class Organization < ActiveRecord::Base
  belongs_to :city
  has_many :user_experiances
  has_many :users, through: :user_experiances
end
