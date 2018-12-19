require 'graphql'

module SpeakerMutations
  Create = GraphQL::Relay::Mutation.define do
    name 'CreateSpeaker'
    description 'Creates a speaker'

    input_field :name, types.String
    input_field :bio, types.String
    input_field :twitterHandle, types.String
    input_field :talkTitle, types.String

    return_field :success, !types.Boolean
    return_field :errors, !types[types.String]

    resolve lambda { |_obj, inputs, _ctx|
      speaker = Speaker.new(
        name: inputs[:name],
        bio: inputs[:bio],
        twitter_handle: inputs[:twitterHandle],
        talk_title: inputs[:talkTitle]
      )

      if speaker.save
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: speaker.errors.full_messages
        }
      end
    }
  end
end

