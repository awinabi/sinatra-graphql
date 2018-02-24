require 'graphql'
require_relative 'types/speaker_type'

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :speakers, types[Types::SpeakerType] do
    description "Get a list of speakers"
    resolve ->(_obj, _args, _ctx) {
      Speaker.all
    }
  end
end
