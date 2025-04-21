class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.expect(event: [ :_id, :name, :description, :address, :map_url, :date, :modality, :cancellation_policy, :participant_edition_policy, :ticket_type, :ticket_price, :ticket_quantity ])
    end
end
