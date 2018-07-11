defmodule PhoenixTrelloApiWeb.BoardResolver do

  alias PhoenixTrelloApi.Trello

  def all_boards(_root, _args, _info) do
    boards = Trello.list_boards()
    {:ok, boards}
  end

  def create_board(_root, args, _info) do
    case Trello.create_board(args) do
      {:ok, board} ->
        {:ok, board}
      _error ->
        {:error, "could not create board"}
    end
  end

  def update_board(_root, args, _info) do
    board = Trello.get_board!(args.id)
    case Trello.update_board(board, args) do
      {:ok, board} ->
        {:ok, board}
      _error ->
        {:error, "could not update board"}
    end
  end

  def delete_board(_root, args, _info) do
    Trello.delete_board(args)
  end

end
