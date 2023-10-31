class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
      flash[:notice] = 'Event was created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_location, :event_time, :event_title, :description)
  end
end
