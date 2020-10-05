defmodule Backend.MixProject do
  use Mix.Project

  def project do
    [
      app: :backend,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Backend.Application, []}
    ]
  end

  defp deps do
    [
      {:absinthe_plug, "~> 1.5"},
      {:absinthe, "~> 1.5"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
