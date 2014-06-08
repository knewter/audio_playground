alias AudioPlayground.PcmSampler
alias AudioPlayground.Oscillators.SineWave

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
  data = PcmSampler.file(w, duration)

  File.mkdir_p "examples/samples"
  filename = "examples/samples/#{frequency}_#{duration}.au"
  File.write!(filename, data)

  System.cmd("paplay #{filename}")

  File.rm(filename)
end
