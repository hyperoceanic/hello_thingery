defmodule HelloThingery.Repo do
  use Ecto.Repo,
    otp_app: :hello_thingery,
    adapter: Ecto.Adapters.Postgres
end
