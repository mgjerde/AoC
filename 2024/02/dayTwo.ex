defmodule DayTwo do
  def partOne do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn a -> Enum.map(a, &String.to_integer/1) end)
    |> Enum.filter(fn list ->
      (Enum.chunk_every(list, 2, 1, :discard) |> Enum.all?(fn [a, b] -> a < b end) or
         Enum.chunk_every(list, 2, 1, :discard) |> Enum.all?(fn [a, b] -> a > b end)) and
        Enum.chunk_every(list, 2, 1, :discard) |> Enum.all?(fn [a, b] -> abs(a - b) in 1..3 end)
    end)
    |> length()
    |> IO.puts()
  end

  def partTwo do
    File.read!("input.txt")
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(fn a -> Enum.map(a, &String.to_integer/1) end)
    |> Enum.map(fn list ->
      [list | Enum.map(0..(length(list) - 1), fn i -> List.delete_at(list, i) end)]
    end)
    |> then(fn a ->
      Enum.map(a, fn list ->
      Enum.map(list, fn sublist ->
        Enum.chunk_every(sublist, 2, 1, :discard)
      end)
      end)
    end)
    |> Enum.filter(fn sublists ->
      Enum.any?(sublists, fn sublist_chunks ->
      (Enum.all?(sublist_chunks, fn [a, b] -> a < b end) or
       Enum.all?(sublist_chunks, fn [a, b] -> a > b end)) and
      Enum.all?(sublist_chunks, fn [a, b] -> abs(a - b) in 1..3 end)
      end)
    end)
    |> length()
    |> IO.puts()
  end
end

DayTwo.partOne()
DayTwo.partTwo()
