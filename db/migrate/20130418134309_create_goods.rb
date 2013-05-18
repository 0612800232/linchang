class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.string :name
      t.string :amount
      t.text :desc
      t.integer :goods_type_id
      t.boolean :is_new
      t.integer :read_num
      t.string  :goods_url
       t.string  :goods_index_url
      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
