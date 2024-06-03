defmodule ExTwitter.ProxyTest do
  use ExUnit.Case

  alias ExTwitter.Ssl

  test "get_proxy_option with port number in binary" do
    env = [{verify: :verify_none}]
    option = Ssl.get_ssl_option(env)

    assert option == [{:ssl, {:verify, :verify_none}}]
  end
end