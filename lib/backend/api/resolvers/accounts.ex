defmodule Backend.API.Resolvers.Accounts do
  def find_user(_parent, _args = %{id: id}, _resolution) do
    case id do
      "1" -> {:ok, %{type: "user", name: "alice"}}
      _ -> {:error, "not found"}
    end
  end
end
