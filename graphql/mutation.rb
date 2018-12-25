require 'graphql'
require_relative 'mutations/create_speaker'

class MutationType < GraphQL::Schema::Object
  description "The mutation root of this schema"

  field :createSpeaker, mutation: Mutations::CreateSpeaker
end
