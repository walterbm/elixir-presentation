defmodule Fuzzional.Portal do
  defstruct [:left, :right]

  alias Fuzzional.Box

  @doc """
  Starts transfering `data` from `left` to `right`.
  """
  def transfer(left, right, data) do
    # First add all data to the portal on the left
    data
    |> Enum.each(fn item -> Box.push(left, item) end)

    # Returns a portal struct we will use next
    %Fuzzional.Portal{left: left, right: right}
  end

  @doc """
  Pushes data to the right in the given `portal`.
  """
  def push_right(portal) do
    # See if we can pop data from left. If so, push the
    # popped data to the right. Otherwise, do nothing.
    case Box.pop(portal.left) do
      :error   -> :ok
      {:ok, h} -> Box.push(portal.right, h)
    end

    # Let's return the portal itself
    portal
  end

  @doc """
  Shoots a new box with the given `color`.
  """
  def shoot(color) do
    Supervisor.start_child(Fuzzional.Supervisor, [color])
  end

end
