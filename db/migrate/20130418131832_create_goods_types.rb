class CreateGoodsTypes < ActiveRecord::Migration
  def self.up
    create_table :goods_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :goods_types
  end
end
