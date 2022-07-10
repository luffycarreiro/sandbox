defmodule Sandbox.TimeMock do
  @moduledoc """
  mocks time functions
  """
  @spec time_mock :: tuple
  def time_mock do
    {Sandbox.MyDateTime, [:passthrough],
     [
      utc_now: fn -> ~U[2022-07-07 19:52:51.442374Z] end
     ]}
  end
end
