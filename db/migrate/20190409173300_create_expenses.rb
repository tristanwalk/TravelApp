class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :expenseName, null: false
      t.integer :expectedAmount, null: false
      t.integer :actualAmount
      t.string :approval, default: "Pending", null: false
      t.belongs_to :travel_authorization, foreign_key: true
	    t.belongs_to :expense_report, foreign_key: true

      t.timestamps
    end
  end
end
