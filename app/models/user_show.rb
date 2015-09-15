class UserShow < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  scope :playing_soon, -> {
    includes(:show, :user).joins(:show, :user).where <<-SQL
      CASE
        WHEN users.timezone = 'pst' THEN
          shows.pst_playtime > now()
        AND
          shows.pst_playtime < now() + interval \'30 minutes\'
        WHEN users.timezone = 'est' THEN
          shows.est_playtime > now()
        AND
          shows.est_playtime < now() + interval \'30 minutes\'
      END
    SQL
  }

  def send_notification!
  end
end
