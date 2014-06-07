defmodule AudioPlayground.Oscillators.SineWaveTest do
  use ExUnit.Case
  alias AudioPlayground.Oscillators.SineWave

  @c %SineWave{frequency: 16.35}

  test "at t=0, its output is 0" do
    assert SineWave.value_at(@c, 0) == 0
  end

  ## LOL NO CLUE HOW TO TEST THIS STUFF
  """
  test "at t=16.35, its output is 0" do
    assert_in_delta SineWave.value_at(@c, 16.35), 0, 0.0001
  end

  test "at t=8.175, its output is 1" do
    assert_in_delta SineWave.value_at(@c, 8.175), 0, 0.0001
  end
  """
end
