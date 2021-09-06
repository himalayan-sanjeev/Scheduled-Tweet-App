class MainController < ApplicationController
  def index
    flash[:notice]="Logged in Successfully"
    flash[:alert]="Invalid Entries"
    #flash.now[:alert]="Invalid Entries"

  end

end