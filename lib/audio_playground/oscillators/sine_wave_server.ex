defmodule AudioPlayground.Oscillators.SineWaveServer do
  use GenServer
  alias AudioPlayground.Oscillators.SineWave

  def start(frequency) do
    GenServer.start(__MODULE__, %SineWave{frequency: frequency})
  end

  def handle_call(:get, _from, oscillator) do
    {:reply, oscillator, oscillator}
  end

  def handle_cast({:update_frequency, new_frequency}, oscillator) do
    {:noreply, %SineWave{oscillator | frequency: new_frequency}}
  end
end
