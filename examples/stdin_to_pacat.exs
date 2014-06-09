alias AudioPlayground.PcmSampler
alias AudioPlayground.Oscillators.SineWave

port = Port.open({:spawn, "pacat -p --channels=1 --rate=16000 --format=s16be"}, [:binary])

notes = [
  a: 440,
  b: 493.88,
  c: 523.25,
  d: 587.33
]

duration = 1

for {note_name, frequency} <- notes do
  IO.puts "playing #{note_name}"
  w = %SineWave{frequency: frequency}
  data = PcmSampler.sample(w, duration)

  send(port, {self, {:command, data}})
end
