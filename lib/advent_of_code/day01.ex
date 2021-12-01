defmodule AdventOfCode.Day01 do
  def part1(input), do: get_increases(input)

  def part2(input), do: get_increases_sliding_window(input, 3)

  defp get_increases(input) do
    input |> parse_input() |> process(0)
  end

  defp get_increases_sliding_window(input, sliding_window) do
    input |> parse_input() |> process_n(sliding_window, 0)
  end

  defp parse_input(input) do
    input
    |> String.split("\n")
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(fn n ->
      {int, _rem} = Integer.parse(n)
      int
    end)
  end

  defp process([current | [next | _next_tail] = tail], increases) do
    if next > current do
      process(tail, increases + 1)
    else
      process(tail, increases)
    end
  end

  defp process([_head | []], increases), do: increases

  defp process_n([head | tail], n, increases) when n > 1 and length(tail) >= n do
    current = head + (tail |> Enum.take(n - 1) |> Enum.sum())
    next = tail |> Enum.take(n) |> Enum.sum()

    if next > current do
      process_n(tail, n, increases + 1)
    else
      process_n(tail, n, increases)
    end
  end

  defp process_n(_list, _n, increases), do: increases
end
