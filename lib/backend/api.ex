defmodule Backend.API do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  forward("/api",
    to: Backend.API.GQL
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Backend.API.Schema]
  )

  match _ do
    send_resp(conn, 404, "oops")
  end
end
