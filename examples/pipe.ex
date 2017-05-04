defmodule Example.Pipe do

  def traditional() do
    String.reverse(
      :zlib.uncompress(
        Base.decode64!(
          "eJzLy88sKchXqMzJy1dIzShRKFYvSQRSOolJpc4K+SUK+ekKOhkliakpCpW5CqnZiW4KyZnp+TmYGlLLMt0UMtJL84uAvNQ8fwW9Il8A+UsgGQ=="
        )
      )
    )
  end

  def chain() do
    "eJzLy88sKchXqMzJy1dIzShRKFYvSQRSOolJpc4K+SUK+ekKOhkliakpCpW5CqnZiW4KyZnp+TmYGlLLMt0UMtJL84uAvNQ8fwW9Il8A+UsgGQ=="
    |> Base.decode64!
    |> :zlib.uncompress
    |> String.reverse
  end

end
