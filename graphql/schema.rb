require 'graphql'
require_relative 'query'

ConferenceAppSchema = GraphQL::Schema.define do
  query QueryType
end
