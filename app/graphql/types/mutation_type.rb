module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    # Separated file mutation
    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor,
      description: "Create an Author"

    # Inline mutation
    field :update_author, Boolean, null: false, description: "Update and author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def update_author(author:)
      existing = Author.where(id: author[:id]).first
      existing&.update author.to_h
    end
  end
end
