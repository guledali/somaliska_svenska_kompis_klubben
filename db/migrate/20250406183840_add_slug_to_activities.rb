class AddSlugToActivities < ActiveRecord::Migration[8.0]
  def change
    add_column :activities, :slug, :string
    add_index :activities, :slug, unique: true
  end
end
