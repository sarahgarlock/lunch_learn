class FavoriteSerializer
  include JSONAPI::Serializer
  set_type :favorite
  attributes :country, :recipe_link, :recipe_title, :created_at

end