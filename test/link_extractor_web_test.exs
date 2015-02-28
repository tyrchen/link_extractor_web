defmodule LinkExtractorWebTest do
  use ExUnit.Case
  alias LinkExtractor.Link
  @base "http://localhost:4001"
  @message """
  Augie,

  Ctrl-p: https://github.com/kien/ctrlp.vim

  That is probably my absolute favorite vim plugin
  """

  @expected_link %Link{
    url: "https://github.com/kien/ctrlp.vim",
    title: "kien/ctrlp.vim · GitHub",
  }

  test "when text is injected into the system, those links are stored" do
    response = post "/messages", @message
    assert response.status_code == 200
    assert LinkExtractor.get_links == [@expected_link]
    response = get "/links"
    assert response.body =~ ~r/crlp.vim/
  end

  defp post path, body do
    HTTPoison.post "#{@base}#{path}", body
  end

  defp get(path) do
    HTTPoison.get "#{@base}#{path}"
  end
end
