class Tt0413sController < ApplicationController

  before_action :authorized

  def index
    @tt0413s = Tt0413.all

    respond_to do |format|
      format.html
      format.csv {
        filename = "submissions-#{Date.today}.csv"
        send_data @tt0413s.to_csv, filename: filename
      }
    end
  end

end
