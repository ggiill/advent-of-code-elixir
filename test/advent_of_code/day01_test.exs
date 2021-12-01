defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  alias AdventOfCode.Day01

  test "part 1" do
    assert get_input() |> Day01.part1() == 1154
  end

  test "part 2" do
    assert get_input() |> Day01.part2() == 1127
  end

  defp get_input() do
    {:ok, input} = File.read("test/advent_of_code/inputs/day01.txt")
    input
  end
end
