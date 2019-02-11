defmodule Exred.Node.AwsIotDaemonTest do
  use ExUnit.Case
  doctest Exred.Node.AwsIotDaemon

  @config_overrides %{
    host: %{value: "test.mosquitto.org"},
    port: %{value: 8883}
  }

  use Exred.NodeTest, module: Exred.Node.AwsIotDaemon, config: @config_overrides

  setup_all do
    start_node()
  end

  test "node starts", context do
    assert Process.alive?(context.pid)
  end

  test "mqtt client connected" do
    :timer.sleep(5000)
    st = AwsIotClient.get_state()
    assert st.ready
  end
end
