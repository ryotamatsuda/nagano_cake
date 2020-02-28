class Publics::EndUsersController < ApplicationController

  before_action :authenticate_end_user!

  def show
  end

  def edit
  end

  def update
    if current_end_user.update(end_user_params)
      redirect_to end_users_path
    else
      render :edit
    end
  end

  # def withdraw_confirmation
  # end

  def destroy
    current_end_user.destroy
    redirect_to new_end_user_session_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:email)
  end

end
