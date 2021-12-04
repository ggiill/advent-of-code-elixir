defmodule AdventOfCode.Day02 do
  alias AdventOfCode.Helpers

  def part1(input) do
    input
    |> get_and_parse_command_tuples_from_input()
    |> Enum.reduce({0, 0}, fn {dx, dy}, {x, y} ->
      {x + dx, y + dy}
    end)
    |> (fn {x, y} -> x * y end).()
  end

  def part2(input) do
    input
    |> get_and_parse_command_tuples_from_input()
    |> Enum.reduce({0, {0, 0}}, fn {dx, dy}, {aim, {x, y}} ->
      apply_delta_w_aim(aim, {x, y}, {dx, dy})
    end)
    |> (fn {_aim, {x, y}} -> x * y end).()
  end

  defp get_and_parse_command_tuples_from_input(input) do
    input
    |> Helpers.parse_input()
    |> Enum.map(&get_command_tuple/1)
    |> Enum.map(&parse_command_tuple/1)
  end

  defp get_command_tuple(command_line) do
    [command, amount_str] = String.split(command_line, " ")
    {amount, _} = Integer.parse(amount_str)
    {command, amount}
  end

  defp parse_command_tuple({"up", amount}), do: {0, -amount}
  defp parse_command_tuple({"down", amount}), do: {0, amount}
  defp parse_command_tuple({"forward", amount}), do: {amount, 0}

  defp apply_delta_w_aim(aim, {x, y}, {0, dy}),
    do: {aim + dy, {x, y}}

  defp apply_delta_w_aim(aim, {x, y}, {dx, 0}), do: {aim, {x + dx, y + dx * aim}}
end
