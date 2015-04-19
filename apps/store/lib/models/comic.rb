class Comic
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :cover_image, type: String
  field :published_at, type: Date

end