alias AudioPlayground.Oscillators.SineWave
alias AudioPlayground.Visualization.AsciiBarMeter

w = %SineWave{}

meter_width=20

for tick <- 1..100000 do
  IO.puts AsciiBarMeter.output(meter_width, SineWave.value_at(w, tick/10000))
end
