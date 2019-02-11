use Mix.Config

# ssl options for the MQTT client
# these get passed to the Erlang ssl module
# see ssl_option() here: http://erlang.org/doc/man/ssl.html

# config :exred_node_aws_iot_daemon, :ssl,
#   keyfile: "~/exred_data/private.pem.key",
#   certfile: "~/exred_data/certificate.pem.crt",
#   cacertfile: "~/exred_data/ca_root.pem"

if Mix.env() == :test, do: import_config("test.exs")
