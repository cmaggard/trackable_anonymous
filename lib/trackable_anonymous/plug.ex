defmodule TrackableAnonymous.Plug do
  import Plug.Conn, only: []
  alias Plug.Conn

  def init(opts) do
    Keyword.get(opts, :session_key, :trackable_id)
  end

  def call(conn, session_key) do
    conn
    |> get_unique_id(session_key)
    |> set_unique_id(session_key)
  end

  def get_unique_id(conn, session_key) do
    case Conn.get_session(conn, session_key) do
      nil -> {conn, generate_id()}
      val -> {conn, val}
    end
  end

  def set_unique_id({conn, key_value}, session_key) do
    conn
    |> Conn.put_session(session_key, key_value)
    |> Conn.assign(session_key, key_value)
  end

  def generate_id do
    binary =
      <<System.system_time(:nanosecond)::64, :erlang.phash2({node(), self()}, 16_777_216)::24,
        :erlang.unique_integer()::32>>

    :crypto.hash(:sha3_384, binary)
    |> Base.hex_encode32(case: :lower)
  end
end
