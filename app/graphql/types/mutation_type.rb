module Types
  class MutationType < Types::BaseObject
    field :create_artist, mutation: Mutations::CreateArtist
  end
end
