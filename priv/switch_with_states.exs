defmodule SwitchWithStates do

  @doc """
  implements a light switch as a state server.  In data, it keeps a count of
  how many times the state of the light switch has changed.
  """

  use StateServer, off: [flip: :on],
                   on:  [flip: :off]

  @type data :: non_neg_integer

  def start_link, do: StateServer.start_link(__MODULE__, :ok)

  @impl true
  def init(:ok), do: {:ok, 0}

  def flip(srv), do: StateServer.call(srv, :flip)
  def query(srv), do: StateServer.call(srv, :query)

  @impl true
  def handle_call(:flip, _from, _state, _count) do
    {:reply, :ok, transition: :flip}
  end
  defer handle_call

  defstate Off, for: :off do
    @impl true
    def handle_transition(:flip, count) do
      IO.puts(:stderr, "switch #{inspect self()} flipped on, #{count} times turned on")
      {:noreply, update: count + 1}
    end

    @impl true
    def handle_call(:query, _from, _count) do
      {:reply, "state is off"}
    end
  end

  defstate On, for: :on do
    @impl true
    def handle_transition(:flip, count) do
      IO.puts(:stderr, "switch #{inspect self()} flipped off, #{count} times turned on")
      :noreply
    end

    @impl true
    def handle_call(:query, _from, _count) do
      {:reply, "state is on"}
    end
  end

end
