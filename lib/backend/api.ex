defmodule Backend.API do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  forward("/api",
    to: Absinthe.Plug,
    init_opts: [schema: Backend.API.Schema]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Backend.API.Schema]
  )

  match _ do
    send_resp(conn, 404, "oops")
  end
end
