defmodule AudioPlayground.Visualization.AsciiBarMeterTest do
  use ExUnit.Case
  alias AudioPlayground.Visualization.AsciiBarMeter

  test "it places the x in the center for a value of 0" do
    assert AsciiBarMeter.output(2, 0) == "[  x  ]"
  end

  test "it places the x on the right for a value of 1" do
    assert AsciiBarMeter.output(2, 1) == "[    x]"
  end

  test "it places the x on the left for a value of -1" do
    assert AsciiBarMeter.output(2, -1) == "[x    ]"
  end
end
