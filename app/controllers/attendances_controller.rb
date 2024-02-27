class AttendancesController < ApplicationController
    def new
      @attendance = Attendance.new
    end
  
    def create
      @attendance = Attendance.new(attendance_params)
      if @attendance.save
        redirect_to event_path(@attendance.event), notice: "Successfully attended the event."
      else
        render :new
      end
    end
  
    private
  
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
  end
  