defmodule Backend.API.GQL do
  use Plug.Builder

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(Absinthe.Plug,
    schema: Backend.API.Schema
  )
end
