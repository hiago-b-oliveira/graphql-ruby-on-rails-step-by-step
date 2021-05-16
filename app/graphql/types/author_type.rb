class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"

  description "All the attributes for creating an author"

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :yob, Int, required: false
  argument :is_alive, Boolean, required: false

end

class Types::AuthorType < Types::BaseObject
  description "An author"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true

  field :full_name, String, null: true
  field :profile_description, String, null: true

  # A custom field defined at type level
  def profile_description
    "#{object.first_name} was born in #{object.yob}"
  end

  field :errors, [Types::ErrorType], null: true

  def errors
    object.errors.map { |e| { field_name: e, errors: object.errors[e] }}
  end

end
