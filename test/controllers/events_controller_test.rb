require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = Event.create!(
      name: "Evento de Teste",
      description: "Descrição de teste",
      address: "Endereço de teste",
      map_url: "http://exemplo.com",
      date: Date.today,
      modality: "Presencial",
      cancellation_policy: "Política de cancelamento",
      participant_edition_policy: "Política de edição",
      ticket_type: "VIP",
      ticket_price: 99.99,
      ticket_quantity: 10
    )
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { name: "Novo Evento", description: "Nova descrição", address: "Novo endereço", map_url: "http://novoexemplo.com", date: Date.today, modality: "Online", cancellation_policy: "Sem cancelamento", participant_edition_policy: "Sem edição", ticket_type: "Regular", ticket_price: 150.0, ticket_quantity: 20 } }, as: :json
    end

    assert_response :created
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { name: "Evento Atualizado" } }, as: :json
    assert_response :success
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event), as: :json
    end

    assert_response :no_content
  end
end
