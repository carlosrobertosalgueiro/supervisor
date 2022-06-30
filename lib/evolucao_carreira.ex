defmodule EvolucaoCarreira do
  use GenServer
  # server
  def init({idade, salario}) do
    {:ok, {idade, salario}}
  end

  def start_link({nome, idade, salario}) do
    GenServer.start_link(__MODULE__, {idade, salario}, name: nome)
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  # client

  def buscar_pessoa(nome), do: GenServer.call(nome, :get)
end
