defmodule Fuzzional.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [ worker(Fuzzional.Box, []) ]

    opts = [strategy: :simple_one_for_one, name: Fuzzional.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
