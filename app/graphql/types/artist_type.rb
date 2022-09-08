# frozen_string_literal: true

module Types
  # graphql type for artist
  class ArtistType < Types::BaseObject
    description 'An artist details'
    field :id, ID, null: false, description: 'Return ID of artist'
    field :first_name, String
    field :last_name, String
    field :email, String
    field :full_name, String
    field :items, [Types::ItemType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def full_name
      "#{object.first_name} #{object.last_name}"
    end
  end
end
