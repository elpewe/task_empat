class Post < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x300>", medium: "300x300>", thumb:"200x100#" }
  validates_attachment :image, presence: true,
                       content_type: { content_type: /\Aimage\/.*\Z/ },
                       size: { in: 0..200.kilobytes }
end
