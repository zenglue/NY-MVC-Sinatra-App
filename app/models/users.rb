class User < ActiveRecord::Base
  has_many :organization_experiances
  has_many :organizations, through: :organziation_experiances
  has_many :user_experiances, through: :organization_experiances

  def slug
  end

  def self.find_by_slug
  end
end
