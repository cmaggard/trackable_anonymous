defmodule TrackableAnonymous.MixProject do
  use Mix.Project

  def project do
    [
      app: :trackable_anonymous,
      version: "0.2.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.5"}
    ]
  end

  defp package do
    [
      description: "Set a unique trackable ID a la request_id",
      licenses: ["WTFPL"],
      links: %{},
      maintainers: ["cmaggard"]
    ]
  end
end
