defmodule Aquario.Tanks.Tank do
  use Ecto.Schema  
  use Arc.Ecto.Schema
  import Ecto.Changeset

  alias AquarioWeb.PhotoUploader

  schema "tanks" do
    many_to_many :species, Aquario.Species.Specy,
      join_through: "species_tanks",
      on_delete: :delete_all,
      on_replace: :delete

    field :description_en_us, :string
    field :description_es_es, :string
    field :description_pt_br, :string
    field :image, PhotoUploader.Type
    field :link_audio, :string
    field :link_libras, :string
    field :name_en_us, :string
    field :name_es_es, :string
    field :name_pt_br, :string
    field :order, :integer
    field :title_en_us, :string
    field :title_es_es, :string
    field :title_pt_br, :string

    timestamps()
  end

  @doc false
  def changeset(tank, attrs) do
    tank
    |> cast(attrs, [:name_pt_br, :name_en_us, :name_es_es, :order, :image, :description_pt_br, :description_en_us, :description_es_es, :title_pt_br, :title_en_us, :title_es_es, :link_libras, :link_audio])
    |> put_change(:image_token, Ecto.UUID.generate())
    |> cast_attachments(attrs, [:image])
    |> validate_required([:name_pt_br, :name_en_us, :name_es_es, :order, :image, :description_pt_br, :description_en_us, :description_es_es, :title_pt_br, :title_en_us, :title_es_es, :link_libras, :link_audio])
  end
end
