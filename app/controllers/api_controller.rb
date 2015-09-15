
class ApiController < ApplicationController

    def data
      puts "HELLO data"
      ImportShowsWorker.perform_in(2.minutes.from_now)
      render 'api'
    end

    def Updater
      ImportEasternTimeZoneWorker.perform_in(3.minutes.from_now)
      render 'api'
    end

    #      @array_of_tv_shows = []
    #     # @things = Kimono.TV_links_crawl
    #      @things = HTTParty.get('https://www.kimonolabs.com/api/82rcgyz6?apikey=sCyT3JYkyDSnJanCpL8ZUSF9HBIKeQTw')
    #      @things['results']['collection2'].each do |object|
    #       # p object2 = object["url"].scan(/=.{8,10}\b/)[0][1..-1]
    #        temp = {}
    #        temp[:title] = object["title"]["text"]
    #        playtime = object["playtime"]
    #        date = object["url"].scan(/=.{8,10}\b/)[0][1..-1]
    #        playtime = "#{date} #{playtime} EST"
    #        p temp[:est_playtime] = Time.parse("#{date} #{playtime} EST")
    #        temp[:channel] = object["channel"]
    #        @array_of_tv_shows << temp
    #      end
    #        @shows = Show.all
    #        weekly_show_writer(@array_of_tv_shows, @shows)
    #        render 'api'
    #   end

    #   def find_show(show_title)
    #     Show.where({title: show_title}).first
    #   end

    #   def weekly_show_writer(array_of_shows, shows)
    #     array_of_shows.each do |show_data|
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
    #   est_playtime = show.fetch(:est_playtime)
    #   # pst_playtime = show.fetch(:pst_playtime)
    #   channel = show.fetch(:channel)
    #   Show.create(title: title, est_playtime: est_playtime, channel: channel)
    # end

    # def show_updater(apiShow, dbShow)
    #   Show.update(dbShow.id , :est_playtime => apiShow[:est_playtime])


end

