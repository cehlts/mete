defmodule Mete.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {Registry, [name: Mete.Registry, keys: :duplicate]}
      # , parse_config()
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp parse_config() do
    # TODO see how much adapters we have to start
  end
end
