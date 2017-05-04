defmodule Example.PatternMatching do

  @data %{a: "left", b: "right"}

  def matching_on_args("Is it weakness?") do
    "Avoid the blind woman"
  end
  def matching_on_args("Is it wickedness?") do
    "You've lost...your life."
  end
  def matching_on_args(_) do
    "You decide. Are we gonna live or die?"
  end

  def deconstruction() do
    {:ok, direction} =  Map.fetch(@data, :a)
    direction
  end

  def conditional() do
    case Map.fetch(@data, :a) do
      {:ok, "left"} -> "My left stroke just went viral"
      {:ok, _} -> "Right stroke put lil' baby in a spiral"
      {:error} -> "Sit down"
    end
  end

end
