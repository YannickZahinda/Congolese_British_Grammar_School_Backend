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

  def destroy
    @event = Event.where(id: params[:id]).first 
    if @event.destroy
      head(:ok)
    else  
      head(:unprocessable_entity)
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
    params.require(:event).permit()
  end
end
