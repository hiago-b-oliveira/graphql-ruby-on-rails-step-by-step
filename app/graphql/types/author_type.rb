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

end
