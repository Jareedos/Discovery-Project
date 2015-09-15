class ImportEasternTimeZoneWorker
  include Sidekiq::Worker

  def perform
    getData!
    parseData!
    updateShows!
  end

  def getData!
    @data = HTTParty.get('https://www.kimonolabs.com/api/c6y03b18?apikey=sCyT3JYkyDSnJanCpL8ZUSF9HBIKeQTw')
  end

  def parseData!
    @showsUpdates = @data['results']['collection1'].map do |object|
      temp = {}
      title = object["title"]["text"]
      playtime = object["westerntime"]
      date = Rack::Utils.parse_query(URI.parse(object["url"]).query)["date"]
      month, day, year = date.split('/')
      playtime = Time.parse("#{year}-#{month}-#{day} #{playtime} PST")
      channel = object["channel"]
      {
        title: title,
        pst_playtime: playtime,
        channel: channel
      }
    end
  end

  def updateShows!
    @showsUpdates.each do |updates|
      show = Show.where(title: updates[:title]).first_or_initialize
      show.update!(updates)
    end
  end

end

