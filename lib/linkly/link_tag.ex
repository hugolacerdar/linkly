defmodule Linkly.LinkTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Linkly.{Link, LinkTag, Tag, User}

  schema "link_tags" do
    belongs_to(:link, Link)
    belongs_to(:tag, Tag)
    belongs_to(:user, User)

    timestamps()
  end

  def changeset(%LinkTag{} = link_tag, attrs) do
    link_tag
    |> cast(attrs, [:link_id, :tag_id, :user_id])
    |> validate_required([:link_id, :tag_id, :user_id])
    |> unique_constraint([:link_id, :tag_id, :user_id])
  end
end
