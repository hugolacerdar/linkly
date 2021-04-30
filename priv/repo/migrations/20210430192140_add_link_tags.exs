defmodule Linkly.Repo.Migrations.AddLinkTags do
  use Ecto.Migration

  def change do
    create table(:link_tags) do
      add :link_id, references(:links, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:link_tags, [:link_id, :tag_id, :user_id])
  end
end
