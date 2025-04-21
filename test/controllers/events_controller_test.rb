require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { _id: @event._id, address: @event.address, cancellation_policy: @event.cancellation_policy, date: @event.date, description: @event.description, map_url: @event.map_url, modality: @event.modality, name: @event.name, participant_edition_policy: @event.participant_edition_policy, ticket_price: @event.ticket_price, ticket_quantity: @event.ticket_quantity, ticket_type: @event.ticket_type } }, as: :json
    end

    assert_response :created
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { _id: @event._id, address: @event.address, cancellation_policy: @event.cancellation_policy, date: @event.date, description: @event.description, map_url: @event.map_url, modality: @event.modality, name: @event.name, participant_edition_policy: @event.participant_edition_policy, ticket_price: @event.ticket_price, ticket_quantity: @event.ticket_quantity, ticket_type: @event.ticket_type } }, as: :json
    assert_response :success
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event), as: :json
    end

    assert_response :no_content
  end
end
