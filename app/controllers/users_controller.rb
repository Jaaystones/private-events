# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @created_events = @user.events
  end
end
