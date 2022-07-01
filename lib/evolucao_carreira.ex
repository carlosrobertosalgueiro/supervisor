defmodule EvolucaoCarreira do
  use GenServer
  # server
  def init({idade, salario}) do
    IO.inspect("inicando carreiras")
    {:ok, {idade, salario}}
  end
  def start_link({nome, idade, salario}) do
    GenServer.start_link(__MODULE__, {idade, salario}, name: nome)
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast(:aposenta, state) do
    raise "Aposentando #{state}"
    {:noreply, state}
  end

  def handle_cast({:upgrade, idade, aumento}, state) do
    {_, salario} = state
    {:noreply, {idade, salario + aumento}}
  end

  def terminate(_reason, _state) do
    IO.inspect("não trabalha mais")
    :error
  end

  # client

  def buscar_pessoa(nome), do: GenServer.call(nome, :get)
  def promocao(nome, idade, salario), do: GenServer.cast(nome, {:upgrade, idade, salario})
  def aposenta(nome), do: GenServer.cast(nome, :aposenta)
end
