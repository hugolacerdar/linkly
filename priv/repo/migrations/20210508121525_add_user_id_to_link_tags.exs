defmodule Linkly.Repo.Migrations.AddUserIdToLinkTags do
  use Ecto.Migration

  def change do
    alter table(:link_tags) do
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create unique_index(:link_tags, [:link_id, :tag_id, :user_id])
  end
end
