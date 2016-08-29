defmodule Oxygen.Mixfile do
  use Mix.Project

  def project do
    [app: :oxygen,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :gproc]]
  end

  defp deps do
    [{:gproc, "~> 0.5.0"},
    {:ex_doc, ">= 0.0.0", only: :dev},
    {:dogma, "~> 0.1", only: :dev},
    {:credo, "~> 0.4", only: [:dev, :test]}]
  end

  defp description do
    """
    Simple API for spawn RabbitMQ Producers and Consumers.
    """
  end

  defp package do
    [
     name: :oxygen,
     files: ["lib", "mix.exs", "README.md", "LICENSE.md"],
     maintainers: ["Pavel Vesnin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/Nebo15/oxygen"}]
  end
end
