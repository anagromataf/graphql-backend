defmodule Backend.API.Resolvers.Content do
  def list_posts(%{name: "alice"}, _args, _resolution) do
    {:ok,
     [
       %{type: :post, title: "alice's post"}
     ]}
  end

  def list_posts(parent, _args, _resolution) do
    {:ok,
     [
       %{title: "alice's post"},
       %{title: "bob's post"}
     ]}
  end
end
