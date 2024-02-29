class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events or /events.json
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    unless @event.creator == current_user
      redirect_to events_path, alert: "You can only edit events you created."
    end
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params) # Ensure current_user is set correctly
  
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    if @event.creator == current_user
      @event.destroy
      redirect_to events_path, notice: "Event was successfully deleted."
    else
      redirect_to events_path, alert: "You can only delete events you created."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
end
