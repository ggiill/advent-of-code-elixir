defmodule AdventOfCode.Helpers do
  def parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
  end
end
