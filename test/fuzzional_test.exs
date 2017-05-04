defmodule FuzzionalTest do
  use ExUnit.Case

  alias Fuzzional.{
    Box,
    Portal,
    Application
  }

  test "Box accepts items" do
    Box.start_link(:pink)
    assert Box.get(:pink) == []
    Box.push(:pink, 42)
    assert Box.get(:pink) == [42]
    assert Box.pop(:pink) == {:ok, 42}
    assert Box.get(:pink) == []
  end

  test "Portals can communicate" do
    Box.start_link(:orange)
    Box.start_link(:blue)
    portal = Portal.transfer(:orange, :blue, [1,2,3])
    assert portal == %Portal{left: :orange, right: :blue}
    assert Box.get(:orange) == [3,2,1]
    assert Box.get(:blue) == []
    Portal.push_right(portal)
    assert Box.get(:orange) == [2,1]
    assert Box.get(:blue) == [3]
  end

  test "supervised Boxes are faul-tolerant" do
    Box.start_link(:orange)
    Supervisor.start_child(Fuzzional.Supervisor, [:blue])

    portal = Portal.transfer(:orange, :blue, [1,2,3])

    Process.unlink(Process.whereis(:blue))
    Process.exit(Process.whereis(:blue), :shutdown)

    Portal.push_right(portal)
    assert Box.get(:orange) # => [2,1]
    assert Box.get(:blue) # => [3]
  end
end

{:blue, "node@aws"}
{:orange, "node@azure"}
