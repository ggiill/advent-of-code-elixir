defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  alias AdventOfCode.Day02

  test "part 1" do
    input = get_input()
    assert Day02.part1(input) == 1_868_935
  end

  test "part 2" do
    input = get_input()
    assert Day02.part2(input) == 1_965_970_888
  end

  defp get_input() do
    {:ok, input} = File.read("test/advent_of_code/inputs/day02.txt")
    input
  end
end
