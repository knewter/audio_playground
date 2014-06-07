defmodule AudioPlayground.Visualization.AsciiBarMeter do
  # Expects a half-width and a value between -1 and 1
  # FIXME: Typespecs
  def output(half_width, value) do
    inner = for x <- 1..width(half_width), into: "" do
              cond do
                x == string_position(half_width, value) -> "x"
                true -> " "
              end
            end
    "[#{inner}]"
  end

  def width(half_width), do: (half_width * 2) + 1

  def string_position(half_width, value) do
    position = :erlang.round(value * half_width)
    half_width + position + 1
  end
end
