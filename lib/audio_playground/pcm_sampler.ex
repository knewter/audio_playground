defmodule AudioPlayground.PcmSampler do
  alias AudioPlayground.Oscillators.SineWave
  @sample_rate 16_000
  @channels 1
  @max_amplitude 32_767

  def sample(oscillator=%SineWave{}, duration) do
    num_samples = trunc(@sample_rate * duration)
    pre_data = for sample_number <- 1..num_samples do
      value = @max_amplitude * SineWave.value_at(oscillator, sample_number/@sample_rate)
              |> :erlang.trunc
      <<value :: [big, signed, integer, size(16)]>>
    end

    iodata_to_binary(pre_data)
  end

  def file(oscillator=%SineWave{}, duration) do
    data = sample(oscillator, duration)
    size = size(data)

    # From
    <<
      ".snd",                                        # Magic number
      0024 :: [unsigned, integer, size(32)],         # Data offset
      size :: [unsigned, integer, size(32)],         # Data size
      0003 :: [unsigned, integer, size(32)],         # 16-bit linear PCM
      @sample_rate :: [unsigned, integer, size(32)], # sample rate
      @channels :: [unsigned, integer, size(32)],    # channels
      data :: binary
    >>
  end
end
