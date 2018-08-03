defmodule MyHelper do
  @moduledoc """
  Documentation for MyHelper.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyHelper.hello
      :world

  """
  def hello do
     "../../../Working/65753_TestDocumentServer/"
     |> FlatFiles.list_all
     |> FileSearch.search_file
  end

end

