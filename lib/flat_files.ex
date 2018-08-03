defmodule FlatFiles do
  def list_all(filepath) do
    _list_all(filepath)
  end

 defp _list_all(filepath) do
   cond do
     String.contains?(filepath, ".svn") -> []
     String.contains?(filepath, ".vs") -> []
     String.contains?(filepath, "Documentation") -> []
     String.contains?(filepath, "Library") -> []
     String.contains?(filepath, "Build") -> []
     String.contains?(filepath, "packages") -> []
     String.contains?(filepath, "DotNetLauncher") -> []
     String.contains?(filepath, "Tools") -> []
     true -> expand(File.ls(filepath), filepath)
   end
 end

 defp expand({:ok, files}, path) do
   files
   |> Enum.flat_map(&_list_all("#{path}/#{&1}"))
 end

  defp expand({:error, _}, path) do
   [path]
 end

end
