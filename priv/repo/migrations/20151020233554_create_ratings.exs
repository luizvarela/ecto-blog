defmodule EctoBlog.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :post_id, :integer
      add :value, :integer

      timestamps
    end

    alter table(:posts) do
      add :average_rating, :decimal
    end
  end
end
