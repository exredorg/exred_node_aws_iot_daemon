defmodule Exred.Node.AwsIotDaemon do
  @moduledoc """
  This is a daemon node that sets up a connection to the AWS IoT service.

  ####Setup in AWS IoT Cloud

  It needs a device (thing) set up in the AWS cloud per instruction.
  see:[AWS IOT Getting Started](https://docs.aws.amazon.com/iot/latest/developerguide/iot-gs.html)

  Proper certificates need to be generate and attached to the Thing and policies
  set up so that this node can access the Thing Shadow using the certs and private key.

  The cert, private key and CA cert needs to be downloaded from AWS and placed somewhere in the
  local file system where the Elixir runtime can access it.

  Configure these locations in the application config file.

  Example:

  ```elixir
  # ssl options for the MQTT client
  # these get passed to the Erlang ssl module
  # see ssl_option() here: http://erlang.org/doc/man/ssl.html
  config :exred_node_aws_iot_daemon, :ssl,
    keyfile: "/exred_data/certs/private.pem.key",
    certfile: "/exred_data/certs/certificate.pem.crt",
    cacertfile: "/exred_data/certs/symantec_ca_root.pem"
  ```

  ####Node Configuration

  __host__: aws iot endpoint for MQTT connections; see:[AWS IoT](https://docs.aws.amazon.com/general/latest/gr/rande.html#iot_region)

  __port__: MQTT connection port

  __client\_id__: client id provided to the MQTT client (can be any string identifying this client)
  """

  @name "AWS IoT Daemon"
  @category "daemon"
  @info @moduledoc
  @config %{
    host: %{type: "string", value: "<prefix>.iot.<region>.amazonaws.com", attrs: %{max: 50}},
    port: %{type: "number", value: 8883, attrs: %{min: 0, max: 65535}},
    client_id: %{type: "string", value: "myClientId"}
  }
  @ui_attributes %{right_icon: "loop"}

  use Exred.NodePrototype
  require Logger

  @impl true
  def daemon_child_specs(config) do
    ssl_options = Application.get_env(:exred_node_aws_iot_daemon, :ssl)
    Logger.debug("SSL: #{inspect(ssl_options)}")

    gen_mqtt_options = [
      host: config.host.value,
      port: config.port.value,
      client: config.client_id.value,
      transport: {:ssl, ssl_options}
    ]

    [Supervisor.child_spec({AwsIotClient, gen_mqtt_options}, [])]
  end

  # @impl true
  # def node_init(state) do
  #   ssl_options = Application.get_env(:exred_node_aws_iot_daemon, :ssl)
  #   Logger.debug("SSL: #{inspect(ssl_options)}")

  #   gen_mqtt_options = [
  #     host: state.config.host.value,
  #     port: state.config.port.value,
  #     client: state.config.client_id.value,
  #     transport: {:ssl, ssl_options}
  #   ]

  #   iot_client_child_spec = Supervisor.child_spec({AwsIotClient, gen_mqtt_options}, [])

  #   case DaemonNodeSupervisor.start_child(iot_client_child_spec) do
  #     {:ok, _pid} ->
  #       :ok

  #     {:error, {:already_started, _pid}} ->
  #       :ok

  #     {:error, other} ->
  #       event = "notification"
  #       debug_data = %{msg: "Could not initialize " <> @name}
  #       event_msg = %{node_id: state.node_id, node_name: @name, debug_data: debug_data}
  #       EventChannelClient.broadcast(event, event_msg)
  #   end

  #   state
  # end
end
