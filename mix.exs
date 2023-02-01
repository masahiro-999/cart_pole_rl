defmodule CartPoleRl.MixProject do
  use Mix.Project

  def project do
    [
      app: :cart_pole_rl,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:nx, "~> 0.3.0"},
      {:rl_lib, git: "git@github.com:masahiro-999/rl_lib.git", ref: "d5696092861051de3eccdd8459ac9e2593ec4c1a"},
      {:gyx, git: "git@github.com:masahiro-999/gyx.git", ref: "3c913e58e913826e67e12d960e5bc0c14f22c177"},
    ]
  end
end
