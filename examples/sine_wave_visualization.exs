alias AudioPlayground.Oscillators.SineWave
alias AudioPlayground.Visualization.AsciiBarMeter

w = %SineWave{frequency: 20}

meter_width=20

defmodule Util do
  def time_secs do
    {_, secs, microsecs} = :erlang.now
    secs + (microsecs / 1_000_000)
  end
end

original_time = Util.time_secs

for tick <- 1..100000 do
  elapsed_time = Util.time_secs - original_time
  IO.puts AsciiBarMeter.output(meter_width, SineWave.value_at(w, elapsed_time / 10))
  :timer.sleep 10
end
