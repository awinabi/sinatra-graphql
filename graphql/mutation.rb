require 'graphql'
require_relative 'mutations/speaker_mutations'

MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createSpeaker, field: SpeakerMutations::Create.field
end
