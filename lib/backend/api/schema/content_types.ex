defmodule Backend.API.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  alias Backend.API.Resolvers

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:body, :string)
  end

  object :node do
    field(:id, :id)

    field(:children, list_of(:node)) do
      arg(:offset, :integer)
      arg(:limit, :integer)
      resolve(&Resolvers.Node.list/3)
    end
  end
end
