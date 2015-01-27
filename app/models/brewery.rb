class Brewery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

  has_many :brewery_users
  has_many :users, through: :brewery_users

  has_many :batches
  has_many :activities, as: :trackable

  validates_presence_of :name

  def total_volume_brewed
    volume = 0
    batches.each do |batch|
      next unless batch.actual_volume_in_gallons.present?
      volume += batch.actual_volume_in_gallons
    end
    volume
  end

  def collective_activity_log
    all_activities = activities
    batches.each do |batch|
      all_activities += batch.activities
    end
    all_activities
  end
end
