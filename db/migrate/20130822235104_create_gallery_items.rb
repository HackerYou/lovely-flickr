class CreateGalleryItems < ActiveRecord::Migration
  def change
    create_table :gallery_items do |t|
      t.references :gallery, index: true
      t.references :photo, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
