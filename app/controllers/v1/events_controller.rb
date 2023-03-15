class V1::EventsController < ApplicationController
  load_and_authorize_resource
  before_action :set_event, only: %i[show update destroy]


  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)  
    if @event.save
      render json: { data: 'event added successfully', status: :created }
    else 
      render json: { data: @event.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end       
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: {data: 'Updated succesfully', status: :ok}
    else  
      render json: {data: 'Something went wrong', status: 'failed'}
    end
  end

  def destroy
    if Event.destroy(params[:id]) 
      render json: {data: 'Event deleted successfully', status: :ok}
    else  
      render json: {data: 'Couldn\'t delete event', status: 'failed'}
    end
  end

  def show
    render json: @events.to_json(include: :parent)
  end

  private  

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:event_title, :event_description)
  end
end
