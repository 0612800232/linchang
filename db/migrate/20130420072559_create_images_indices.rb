class CreateImagesIndices < ActiveRecord::Migration
  def self.up
    create_table :images_indices do |t|
      t.string :title
      t.string :small_img
      t.string :img
      t.string :link
      t.string :target

      t.timestamps
    end
  end

  def self.down
    drop_table :images_indices
  end
end
