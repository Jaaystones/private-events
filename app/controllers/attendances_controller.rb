class AttendancesController < ApplicationController
  before_action :authenticate_user!, except: :new
  
  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.build(event: @event)
    if @attendance.save
      redirect_to event_path(@event), notice: "Successfully attended the event."
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
    params.require(:attendance).permit(:event_id)
  end
end
