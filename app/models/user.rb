class User < ActiveRecord::Base
  has_many :activities
  has_many :brewery_users
  has_many :breweries, through: :brewery_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
