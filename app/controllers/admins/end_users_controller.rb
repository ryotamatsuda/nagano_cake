class Admins::EndUsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @all_end_users = EndUser.with_deleted
  end

end
