class MainController < ApplicationController
  def index
    #flash[:notice]="Logged in Successfully"
    #flash[:alert]="Invalid Entries"
    #flash.now[:alert]="Invalid Entries"
    if session[:user_id]
      # @user=User.find(session[:user_id]) #error if id not found
      @user=User.find_by(id: session[:user_id])

    end
  end

end