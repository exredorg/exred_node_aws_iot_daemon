defmodule Exred.Node.AwsIotDaemon.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exred_node_aws_iot_daemon,
      version: "0.1.4",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:exred_library, git: "git@bitbucket.org:zsolt001/exred_library.git"},
      {:gen_mqtt, "~> 0.4.0"},
      {:conform, "~> 2.2"}
    ]
  end
end
