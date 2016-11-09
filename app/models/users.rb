class User < ActiveRecord::Base
  has_many :user_experiances
  has_many :organizations, through: :user_experiances
  # has_many :organization_experiances, through: :user_experiances

  def slug
  end

  def self.find_by_slug
  end
end
