class User < ActiveRecord::Base
  has_many :programs
  has_many :programs, through :cities
end
