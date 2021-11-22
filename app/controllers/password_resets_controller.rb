class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user=User.find_by(email: params[:email])

    if @user.present?
    #send email 
    #   PasswordMailer.with(user: @user).reset.deliver_later  #for mail sending as background job
    PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "If the account associated with provided email found, an email with reset link will be sent."
  end

  def edit
    @user=User.find_signed(params[:token],purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "your token has expired, try again !" 
  end

  def update
    @user=User.find_signed(params[:token],purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your Password has ben reset successfully ! Sign in to continue !"
    else
      render :edit
    end
  end



  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end