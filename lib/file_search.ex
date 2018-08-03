defmodule FileSearch do
  def search_file(file_list) do
    Enum.each(file_list, fn(x) -> search(x) end)
  end

  defp search(path) do
    path
    |> valid_file
  end

  defp valid_file(path) do
    case Path.extname(path) do
      ".vb" -> path
      ".config" -> valid_config_file(path)
      _ -> ""
    end
  end

  defp valid_config_file(path) do
    file = List.last(String.split(path, "/"))

    case config(String.split(file,".")) do
      "development" -> path
      "test" -> path
      _ -> ""
    end
  end
  
  defp config([one,two]) do
    one
  end
  defp config([one,two,three]) do
    two
  end
  defp config([one,two,env,four]) do
    env
  end
end
