class CreatePelanggans < ActiveRecord::Migration[5.2]
  def change
    create_table :pelanggans do |t|
      t.string :name
      t.string :jenis
      t.integer :count
      t.integer :price
      t.integer :total

    end
  end
end
