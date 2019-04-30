class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.integer :department, null: false
      t.integer :amount, null: false
      t.string :approval, default: "Pending", null: false
      t.belongs_to :travel_authorization, foreign_key: true
	  t.belongs_to :expense_report, foreign_key: true
	  t.belongs_to :expense, foreign_key: true
      t.timestamps
    end
  end
end
