class AttendancesController < ApplicationController
  before_action :authenticate_user!, except: :new
    def new
      @attendance = Attendance.new
    end
  
    def create
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        @event = Event.includes(:attendances).find(params[:attendance][:event_id])
        redirect_to event_path(@attendance.event), notice: "Successfully attended the event."
      else
        render :new
      end
    end

    def destroy
      @attendance = current_user.attendances.find_by(event_id: params[:event_id])
      if @attendance.destroy
        redirect_to event_path(params[:event_id]), notice: 'Successfully removed yourself from the event.'
      else
        redirect_to event_path(params[:event_id]), alert: 'Failed to remove yourself from the event.'
      end
    end
  
    private
  
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
  end
  