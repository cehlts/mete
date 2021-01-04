defmodule Mete.Adapter do
  use Task

  require Logger

  def start_link(config) do
    Task.start_link(__MODULE__, :run, [config])
  end

  def run(_config) do
    Registry.register(
      Mete.Registry,
      :adapters,
      "#TODO figure out from config which adapter group we are"
    )

    stream()
    # TODO get the functions from database specific implementations
    # |> Stream.map(fn x -> IO.inspect([x, " || ", self()]) end)
    |> Stream.run()

    :ok
  end

  defp stream() do
    Stream.resource(
      &start_fun/0,
      &next_fun/1,
      &after_fun/1
    )
  end

  defp start_fun() do
    Logger.debug(["Starting stream for ", inspect(self())])
  end

  defp next_fun(_) do
    receive do
      {:measurement, measurement} ->
        {[measurement], []}

      {:todo_handle_shutdown, _message} ->
        # TODO handle shutdown
        {:halt, []}

      msg ->
        Logger.debug(["Dropping message '", inspect(msg), "'"])
        next_fun([])
    end
  end

  defp after_fun(_) do
    Logger.debug(["Closing stream for ", inspect(self())])
  end
end
