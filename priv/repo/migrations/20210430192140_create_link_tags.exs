defmodule Linkly.Repo.Migrations.CreateLinkTags do
  use Ecto.Migration

  def change do
    create table(:link_tags) do
      add :link_id, references(:links, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:link_tags, [:link_id, :tag_id])
  end
end
