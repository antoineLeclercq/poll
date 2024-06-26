require_relative 'automated_init'

context "Substitute" do
  poll = Poll::Substitute.build

  test "Timeout time is 0" do
    assert(poll.timeout_milliseconds == 0)
  end

  test "Telemetry sink is activated" do
    refute(poll.telemetry_sink.nil?)
  end
end
