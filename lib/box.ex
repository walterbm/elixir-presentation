defmodule Fuzzional.Box do
  @doc """
  Starts a box with the given `color`.

  The color is given as a name so we can identify
  the door by color name instead of using a PID.
  """
  def start_link(color) do
    Agent.start_link(fn -> [] end, name: color)
  end

  @doc """
  Get the data currently in the `box`.
  """
  def get(box) do
    Agent.get(box, fn list -> list end)
  end

  @doc """
  Pushes `value` into the box.
  """
  def push(box, value) do
    Agent.update(box, fn list -> [value|list] end)
  end

  @doc """
  Pops a value from the `box`.

  Returns `{:ok, value}` if there is a value
  or `:error` if the hole is currently empty.
  """
  def pop(box) do
    Agent.get_and_update(box, fn
      []    -> {:error, []}
      [head | tail] -> {{:ok, head}, tail}
    end)
  end
end
