class RegistrationsController <ApplicationController
  def new
    @user=User.new
  end  

  def create
    # render plain: "Thanks" #it just return plain text display "Thanks"
    # render plain: params[:user] #renders user params of submitted user entries
    # params
    # params[:user]
    @user=User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created accounted"
    else
      #flash[:alert]="Something was wrong"
      render :new 
    end 
  end
  
  private
  def user_params #helper method
    params.require(:user).permit(:email,:password,:password_confirmation) #only allowed/permitted attributes for user is email,password and password_confirmation and require-> user is required
  end
end