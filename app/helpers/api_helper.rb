
module ApiHelper

  # def weekly_show_writer(array_of_shows, shows)
  #   array_of_shows.each do |show_data|
  #     show = find_show(show_data[:title])
  #     if show
  #       show_updater(show_data, show)
  #     else
  #       show_writer(show_data)
  #     end
  #   end
  # end

  # def show_writer(show)
  #   title = show.fetch(:title)
  #   playtime = show.fetch(:playtime)
  #   channel = show.fetch(:channel)
  #   date = show.fetch(:date)
  #   Show.create(title: title, playtime: playtime, channel: channel, date: date)
  # end

  # def show_updater(apiShow, dbShow)
  #   Show.update(dbShow.id , :playtime => apiShow[:playtime])
  # end

end
