module Mutations
  class CreateArtist < BaseMutation
    # TODO: define return fields
    field :artist, Types::ArtistType, null: false
    field :errors, [String], null: false

    # define arguments
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    # define resolve method
    def resolve(first_name:, last_name:, email:)
      artist = Artist.new(first_name: first_name, last_name: last_name, email: email)
      if artist.save
        {
          artist: artist,
          errors: []
        }
      else
        {
          artist: nil,
          errors: artist.errors.full_messages
        }
      end
    end
  end
end

# example
#
# mutation CreateArtist($input: CreateArtistInput!) {
#   createArtist(input: $input){
#     artist {
#       id
#       firstName
#     }
#   }
# }
#
# query variables
#
# {
#   "input": {
#     "firstName": "Hasan",
#     "lastName": "Tanbir",
#     "email": "f@g.com"
#   }
# }
