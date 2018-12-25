require 'graphql'
require_relative 'base_mutation'

class Mutations::CreateSpeaker < Mutations::BaseMutation
  description 'Creates a speaker'

  argument :name, String, required: false
  argument :bio, String, required: false
  argument :twitter_handle, String, required: false
  argument :talk_title, String, required: false

  field :success, Boolean, null: false
  field :errors, [String], null: false

  def resolve(name:, bio:, twitter_handle:, talk_title:)

    speaker = Speaker.new(
      name: name,
      bio: bio,
      twitter_handle: twitter_handle,
      talk_title: talk_title
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
  end
end

