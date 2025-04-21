class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :address, type: String
  field :map_url, type: String
  field :date, type: Date
  field :modality, type: String
  field :cancellation_policy, type: String
  field :participant_edition_policy, type: String
  field :ticket_type, type: String
  field :ticket_price, type: Float
  field :ticket_quantity, type: Integer
end
