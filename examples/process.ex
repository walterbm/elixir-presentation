defmodule Example.Process do
  def yah do
    receive do
      :yah -> IO.inspect("yah, yah")
    end
  end

  def yah_yah do
    receive do
      {sender , msg} -> send(sender, {:ok, "#{msg}, yah, yah"})
      yah_yah()
    end
  end

  def client do
    receive do
      {:ok, msg} -> IO.inspect(msg)
      client()
    end
  end
end
