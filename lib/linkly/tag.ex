defmodule Linkly.Tag do
  use Ecto.Schema

  schema "tags" do
    field(:title)

    timestamps()
  end
end
