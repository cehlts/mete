defmodule Mete.MixProject do
  use Mix.Project

  @version "0.1.3"

  def project do
    [
      app: :mete,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs()
      # elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # def elixirc_paths(_), do: ["lib"]

  def application do
    [
      mod: {Mete.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :dev}
    ]
  end

  defp description do
    "Basic measuring tool and telemetry writer using InfluxDB."
  end

  defp docs do
    [
      main: "Mete",
      canonical: "http://hexdocs.pm/mete",
      source_url: "https://github.com/elridion/mete"
    ]
  end

  defp package() do
    [
      maintainers: ["Hans Bernhard Gödeke"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE),
      licenses: ["GNU GPLv3"],
      links: %{
        "GitHub" => "https://github.com/elridion/mete"
      }
    ]
  end
end
