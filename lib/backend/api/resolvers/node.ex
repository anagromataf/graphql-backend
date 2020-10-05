defmodule Backend.API.Resolvers.Node do
  def list(parent, args, _resolution) do
    IO.inspect(parent, label: "PARENT")
    IO.inspect(args, label: "ARGS")

    offset = Map.get(args, :offset, 0)
    limit = Map.get(args, :limit, 3)

    {:ok,
     for(
       index <- offset..(offset + limit - 1),
       do: %{id: Path.join(Map.get(parent, :id, ""), to_string(index))}
     )}
  end
end
