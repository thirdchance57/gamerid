class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  field :date, type: DateTime

  belongs_to :user
  has_mongoid_attached_file :image, 

    :styles => {
      :thumbnail => ['15x15#', :jpg],
      :small =>     ['20x20#', :jpg],
      :medium    => ['100x100#', :jpg],
      :large => ['200x200#', :jpg]
    }

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end