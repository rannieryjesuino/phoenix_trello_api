defmodule PhoenixTrelloApiWeb.ListResolver do

  alias PhoenixTrelloApi.{Trello, Repo}


  def all_lists(_root, _args, _info) do
    lists = Trello.list_lists()
    lists = Repo.preload(lists, :board)
    {:ok, lists}
  end

  def create_list(_root, args, _info) do
    case Trello.create_list(args) do
      {:ok, list} ->
        {:ok, list}
      _error ->
        {:error, "could not create list"}
    end
  end

  def update_list(_root, args, _info) do
    case Trello.update_list(args) do
      {:ok, list} ->
        {:ok, list}
      _error ->
        {:error, "could not update list"}
    end
  end

  def delete_list(_root, args, _info) do
    Trello.delete_list(args)
  end

end