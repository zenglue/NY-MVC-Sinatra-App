class User < ActiveRecord::Base
  has_many :programs
  has_many :cities, through: :programs
end
