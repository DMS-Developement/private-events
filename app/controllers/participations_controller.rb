class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @event.attendees << current_user
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:event_id])
    participation = @event.participations.find_by(user_id: current_user.id)
    participation.destroy if participation
    redirect_to @event
  end
end
