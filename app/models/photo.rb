class Photo < ActiveRecord::Base
  PRICE = 1500

  belongs_to :user

  mount_uploader :upload, UploadUploader

  scoped_search on: [:title, :description]
end
