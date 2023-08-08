class LearningResourceSerializer
  include JSONAPI::Serializer
  attributes :id, :country, :photo, :video
end
