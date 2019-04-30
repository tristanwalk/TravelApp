class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :image_url
      t.belongs_to :expense, foreign_key: true

      t.timestamps
    end
  end
end
