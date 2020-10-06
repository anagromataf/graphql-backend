defmodule Backend.API.Schema do
  use Absinthe.Schema

  # Make `naive_datetime` available.
  import_types(Absinthe.Type.Custom)

  import_types(Backend.API.Schema.AccountTypes)
  import_types(Backend.API.Schema.ContentTypes)

  alias Backend.API.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Content.list_posts/3)
    end

    @desc "Get a user of the blog"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    field :nodes, list_of(:node) do
      arg(:offset, :integer)
      arg(:limit, :integer)
      resolve(&Resolvers.Node.list/3)
    end
  end
end
