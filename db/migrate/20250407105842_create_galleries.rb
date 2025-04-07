class CreateGalleries < ActiveRecord::Migration[8.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
