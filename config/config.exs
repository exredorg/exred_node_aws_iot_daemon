# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :exred_node_aws_iot_daemon, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:exred_node_aws_iot_daemon, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

config :aws_iot, Aws.Iot.ThingShadow.Client,
  host: "a198unk2hf0hqn.iot.us-east-1.amazonaws.com",
  port: 8883,
  client_id: "home",
  ca_cert: "/Users/zkeszthelyi/src/exred/certs/symantec_ca_root.pem",
  client_cert: "/Users/zkeszthelyi/src/exred/certs/ff925dd2f1-certificate.pem.crt",
  private_key: "/Users/zkeszthelyi/src/exred/certs/ff925dd2f1-private.pem.key",
  mqttc_opts: []







# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
