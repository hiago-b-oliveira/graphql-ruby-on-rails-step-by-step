module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :hello_world, String, null: false,
          description: "A hello world field" do
      argument :name, String, required: true
      argument :nickname, String, required: true
    end
    def hello_world(name:, nickname:)
      "Hello #{name}, also know as #{nickname}!"
    end

    field :author, Types::AuthorType, null: true, description: "One author" do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.where(id: id).first
    end

  end
end
