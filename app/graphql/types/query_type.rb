module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :items, [Types::ItemType], null: false, description: 'Return a list of items'
    field :artists, [Types::ArtistType], null: false, description: 'Return a list of artist'
    field :artist, Types::ArtistType, null: false do
      argument :id, ID, required: true
    end

    def items
      Item.all
    end

    def artists
      Artist.all
    end

    def artist(id:)
      Artist.find_by(id: id)
    end
  end
end
