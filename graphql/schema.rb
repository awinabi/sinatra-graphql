require 'graphql'
require_relative 'query'
require_relative 'mutation'

class ConferenceAppSchema < GraphQL::Schema
  query QueryType
  mutation MutationType
end
