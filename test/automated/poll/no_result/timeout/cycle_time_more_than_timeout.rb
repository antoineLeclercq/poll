require_relative '../../../automated_init'

context "Poll" do
  context "Action Got No Result" do
    context "Timeout" do
      context "Cycle Time Is More than the Timeout Time" do
        timeout_milliseconds = 1
        cycle = Poll.build(timeout_milliseconds: timeout_milliseconds)

        cycle_milliseconds = timeout_milliseconds + 1
        cycles = nil
        cycle.() do |i|
          cycles = i + 1
          sleep cycle_milliseconds / 1000.0
          nil
        end

        test "Cycle executes once (Timeout Time: #{timeout_milliseconds}, Cycles: #{cycles})" do
          assert(cycles == 1)
        end
      end
    end
  end
end
