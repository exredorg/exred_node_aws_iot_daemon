defmodule Exred.Node.AwsIotDaemon.Mixfile do
  use Mix.Project

  @description "Maintaines a connection pool to the AWS IOT service in Exred flows."
  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :exred_node_aws_iot_daemon,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      description: @description,
      package: package(),
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
      {:exred_nodeprototype, "~> 0.2"},
      {:gen_mqtt, "~> 0.4.0"},
      {:conform, "~> 2.2"},
      {:exred_nodetest, "~> 0.1.0", only: :test},
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Zsolt Keszthelyi"],
      links: %{
        "GitHub" => "https://github.com/exredorg/exred_node_aws_iot_daemon.git",
        "Exred" => "http://exred.org"
      },
      files: ["lib", "mix.exs", "README.md", "LICENSE", "VERSION"]
    }
  end
end
