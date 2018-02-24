require 'graphql'

module Types
  SpeakerType = GraphQL::ObjectType.define do
    name 'Speaker'
    description 'Resembles a Speaker Object Type'

    field :id, !types.ID
    field :name, types.String
    field :twitterHandle, types.String, property: :twitter_handle
    field :bio, types.String
    field :talkTitle, types.String, property: :talk_title
  end
end
