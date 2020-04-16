class Tt0413sController < ApplicationController

  before_action :authorized

  def index
    @tt0413s = Tt0413.all
  end

end
