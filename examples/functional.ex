defmodule Dog do
   defstruct name: nil

   def bark(name) do
      "#{name} barks WOOF!"
   end
end


defmodule Example.Functional do

  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> Example.Functional.mutiply_by_two([1,2,3,4])
      [2,4,6,8]

  """
  def mutiply_by_two([]) do
    []
  end
  def mutiply_by_two(array) do
    [head | tail] = array
    [head * 2] ++ mutiply_by_two(tail)
  end


  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> Example.Functional.fib()
      [0,1,1,2,3,5,8,13,21]

  """
  def fib() do
    fib = [0,1,1,2,3,5,8,13]
    Enum.count(fib)
    fib ++ [21]
  end

  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

      iex> Example.Functional.structs()
      "scooby barks WOOF!"

  """
  def structs() do
    scooby = %Dog{name: "scooby"}
    Dog.bark(scooby.name)
  end
end
