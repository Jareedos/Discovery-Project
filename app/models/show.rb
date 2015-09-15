class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :users, through: :user_shows, dependent: :destroy

  scope :playing_in_minutes, -> (n){
    where('shows.playtime > (?)', Time.now).where('shows.playtime < (?)', n.minutes.from_now)
  }

end
