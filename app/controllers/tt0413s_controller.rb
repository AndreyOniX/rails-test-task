class Tt0413sController < ApplicationController

  before_action :authorized

  def index
    @tt0413s = Tt0413.page(params[:page])

    respond_to do |format|
      format.html
      format.csv {
        filename = "submissions-#{Date.today}.csv"
        send_data Tt0413.all.to_csv, filename: filename
      }
    end
  end

end
