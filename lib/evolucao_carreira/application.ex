defmodule EvolucaoCarreira.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.inspect("Iniciando salario dos profissionais")

    children = [
      # Varios starts
      %{id: :gustavo, start: {EvolucaoCarreira, :start_link, [{:gustavo, 18, 1000}]}},
      %{id: :bruce, start: {EvolucaoCarreira, :start_link, [{:bruce, 0, 0}]}}
      # Um start
      # {EvolucaoCarreira, {:carlos, 0, 0}}
      # Starts a worker by calling: EvolucaoCarreira.Worker.start_link(arg)
      # {EvolucaoCarreira.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EvolucaoCarreira.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
