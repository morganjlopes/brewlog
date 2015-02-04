class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]
  
  has_many :activities
  has_many :brewery_users
  has_many :breweries, through: :brewery_users
  has_many :access_invitations, as: :sender
  has_many :access_invitations, as: :receiver
  has_many :recipes, as: :author
  has_many :batches, as: :author

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    name.scan(/\w+/).first
  end

  def last_name
    name.split.last
  end
end
