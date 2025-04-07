class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :icon
      t.string :image
      t.string :schedule

      t.timestamps
    end
  end
end
