defmodule EctoBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, size: 100
      add :content, :text

      timestamps
    end
  end
end
