module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :items, [Types::ItemType], null: false, description: 'Return a list of items'
    field :item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end

    def items
      Item.all
    end

    def item(id:)
      Item.find_by(id: id)
    end

    # Artist
    field :artists, [Types::ArtistType], null: false, description: 'Return a list of artist'
    field :artist, Types::ArtistType, null: false do
      argument :id, ID, required: true
    end

    def artists
      Artist.all
    end

    def artist(id:)
      Artist.find_by(id: id)
    end
  end
end

# Examples:
# query Artists {
#   artists {
#     firstName
#     lastName
#     fullName
#   }
# }
#
# query Artist($ID: ID!) {
#   artist(id: $ID) {
#     firstName
#     lastName
#     fullName
#   }
# }
#
# query Items {
#   item(id: 1) {
#     id
#     title
#   }
# }

# variables
# {
#   "ID": 1
# }
#
