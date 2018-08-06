defmodule FileSearch do
  def search_file(file_list) do
    Enum.each(file_list, fn(x) -> search(x) end)
  end

  defp search(path) do
    path
    |> valid_file
    |> IO.puts  
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
  
  defp config([one,_]) do
    one
  end
  defp config([_,two,_]) do
    two
  end
  defp config([_,_,env,_]) do
    env
  end

  defp search_file_with_path("") do
    nil
  end

  defp search_file_with_path(path) do
    File.stream!(path)
    |> Stream.map(&replace(&1,path))
    |> Stream.run()
  end

  defp replace(line, path) do
    if String.contains?(line,"\\UTSDOC") do
      IO.puts(path)
      IO.puts(line)
      String.replace(line, "\\UTSDOC","\\UTSDocumentBeta")
    end
    if String.contains?(line,"\\UTSFILE") do
      IO.puts(path)
      IO.puts(line)
      String.replace(line, "\\UTSFILE","\\UTSDocumentBeta")
    end
    if String.contains?(line,"\\UTSFile") do
      IO.puts(path)
      IO.puts(line)
      String.replace(line, "\\UTSFile","\\UTSDocumentBeta")
    end
  end
end
