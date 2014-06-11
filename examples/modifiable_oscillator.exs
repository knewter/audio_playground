alias AudioPlayground.PcmSampler
alias AudioPlayground.Oscillators.SineWave
alias AudioPlayground.Oscillators.SineWaveServer

defmodule AudioOutput do
  @duration 1000

  def start(oscillator_server) do
    IO.puts "start: #{inspect oscillator_server}"
    pacat = Port.open({:spawn, "pacat -p --channels=1 --rate=16000 --format=s16be"}, [:binary])
    await(oscillator_server, pacat)
  end

  defp await(oscillator_server, pacat) do
    IO.puts "await: oscillator_server: #{inspect oscillator_server}, pacat: #{inspect pacat}"
    oscillator = GenServer.call(oscillator_server, :get)
    IO.puts "1"
    IO.puts "PcmSampler.sample(#{inspect oscillator}, #{inspect @duration})"
    data = PcmSampler.sample(oscillator, @duration / 1000)
    IO.puts "2: #{inspect data}"
    send(pacat, {self, {:command, data}})
    IO.puts "3"
    :timer.sleep @duration
    await(oscillator_server, pacat)
  end
end

notes = %{
  a: 440,
  b: 493.88,
  c: 523.25,
  d: 587.33
}

{:ok, oscillator_server} = SineWaveServer.start(notes.c)
spawn(AudioOutput, :start, [oscillator_server])
:timer.sleep 1000
GenServer.cast(oscillator_server, {:update_frequency, notes.b})
:timer.sleep 1000
GenServer.cast(oscillator_server, {:update_frequency, notes.a})
:timer.sleep 1000
GenServer.cast(oscillator_server, {:update_frequency, notes.b})
:timer.sleep 1000
GenServer.cast(oscillator_server, {:update_frequency, notes.a})
