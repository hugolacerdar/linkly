defmodule Linkly.LinkTag do
  use Ecto.Schema

  schema "link_tags" do
    field(:link_id, :id)
    field(:tag_id, :id)
    field(:user_id, :id)

    timestamps()
  end
end
