# app/controllers/users_controller.rb
class UsersController < Devise::RegistrationsController
    before_action :authenticate_user!
    
    def show
      @user = current_user
      @created_events = @user.events
    end
end
  