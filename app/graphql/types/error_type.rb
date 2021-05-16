class Types::ErrorType < Types::BaseObject
  description "An ActiveRecord error"

  field :field_name, String, null: false
  field :errors, [String], null: false
end
