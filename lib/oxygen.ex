defmodule Oxygen do
  @moduledoc """
  Named GenServer
  """

  @doc """
    Cast name to tuple for GenServer
  """
  def via_tuple(name) do
    {:via, :gproc, {:n, :l, {:queue, name}}}
  end

  @doc """
    Find GenServer process by name via gproc
  """
  def get_server(name) do
    server = via_tuple(name)
    case GenServer.whereis(server) do
      nil -> {:error, "process with name '#{name}' does not exists"}
      _   -> {:ok, server}
    end
  end

  @doc """
    Wrapper for GenServer.call method
  """
  def server_call({:error, reason}, _, _), do: {:error, reason}
  def server_call({:ok, server}, request, timeout \\ 5000) do
    GenServer.call(server, request, timeout)
  end

  @doc """
    Wrapper for GenServer.cast method
  """
  def server_cast({:error, reason}, _), do: {:error, reason}
  def server_cast({:ok, server}, request) do
    GenServer.cast(server, request)
  end
end
