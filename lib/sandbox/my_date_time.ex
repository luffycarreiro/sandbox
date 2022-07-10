defmodule Sandbox.MyDateTime do
  @moduledoc """
  Module that wrapps DateTime so I can mock it easily. (for testing porpouses)
  """
  @spec utc_now :: DateTime.t()
  def utc_now do
    DateTime.utc_now()
  end
end
