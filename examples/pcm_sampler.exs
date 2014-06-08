alias AudioPlayground.PcmSampler
alias AudioPlayground.Oscillators.SineWave

w = %SineWave{frequency: 440}
data = PcmSampler.file(w, 1)

File.mkdir_p "examples/samples"
filename = "examples/samples/440_1.au"
File.write!(filename, data)

System.cmd("paplay #{filename}")
