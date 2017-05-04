defmodule Example.Test do
  use ExUnit.Case, async: true
  doctest Example.Functional

  test "can mutiply the elements in an array by two" do
    assert Example.Functional.mutiply_by_two([10,11,12,13]) == [20,22,24,26]
  end

  test "argument pattern matching" do
    assert Example.PatternMatching.matching_on_args("Is it weakness?") == "Avoid the blind woman"
    assert Example.PatternMatching.matching_on_args("Is it wickedness?") == "You've lost...your life."
    assert Example.PatternMatching.matching_on_args("syrup sandwiches") == "You decide. Are we gonna live or die?"
  end

  test "deconstruction with pattern matching" do
    assert Example.PatternMatching.deconstruction() == "left"
  end

  test "conditional pattern matching" do
    assert Example.PatternMatching.conditional() == "My left stroke just went viral"
  end

  test "can use the pipe to chain methods" do
    assert Example.Pipe.chain() == "Mr. One through Five, that's the only logic Fake my death, go to Cuba, that's the only option"
  end

  test "can use also chain methods the old boring way" do
    assert Example.Pipe.traditional() == "Mr. One through Five, that's the only logic Fake my death, go to Cuba, that's the only option"
  end

  test "echo from basic process" do
    pid_echo = spawn(Example.Process, :yah_yah, [])
    send(pid_echo, {self(), "Zeroes to flip, temptation is"})
    assert_receive {:ok, "Zeroes to flip, temptation is, yah, yah"}
  end

  test "send mutiple messages to a basic process" do
    pid_echo = spawn(Example.Process, :yah_yah, [])
    send(pid_echo, {self(), "Zeroes to flip, temptation is"})
    assert_receive {:ok, "Zeroes to flip, temptation is, yah, yah"}
    send(pid_echo, {self(), "Buzzin', radars is buzzin'"})
    assert_receive {:ok, "Buzzin', radars is buzzin', yah, yah"}
  end

end
