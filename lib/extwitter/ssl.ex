defmodule ExTwitter.Ssl do
  @moduledoc """
  Provide helper functions for proxy setting.
  """

  @doc """
  Initialize proxy settings based on definition in config.exs.
  """
  def initialize do
    if ssl() != nil do
      :httpc.set_options(get_ssl_option())
    end
  end

  @doc """
  Get proxy settings for sending request based on definition in config.exs.
  """
  def options do
    if ssl() != nil do
      get_ssl_option()
    else
      []
    end
  end

  def get_ssl_option() do

    [{:ssl, [{:verify, :verify_none}]}]
  end

  defp ssl do
    Application.get_env(:extwitter, :ssl, nil)
  end
end
