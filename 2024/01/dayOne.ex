defmodule DayOne do
  def partOne do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
    |> then(fn {a, b} -> [Enum.sort(a), Enum.sort(b)] end)
    |> Enum.zip()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
    |> IO.puts()
  end

  def partTwo do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
    |> then(fn {a, b} -> Enum.map(Enum.uniq(a), fn x -> Map.get(Enum.frequencies(b), x, 0) * x end) end)
    |> Enum.sum()
    |> IO.puts()
  end

end

DayOne.partOne()
DayOne.partTwo()
