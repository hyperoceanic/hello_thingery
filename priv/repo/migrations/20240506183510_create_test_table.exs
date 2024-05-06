defmodule HelloThingery.Repo.Migrations.CreateTestTable do
  use Ecto.Migration

  def change do

    create table("test") do
        add :city,    :string, size: 40
        add :temp_lo, :integer
        add :temp_hi, :integer
        add :prcp,    :float

        timestamps()
      end

  end
end
