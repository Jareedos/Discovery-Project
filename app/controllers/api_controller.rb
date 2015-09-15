
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
end

