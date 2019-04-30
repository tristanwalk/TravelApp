class CreateBudgetApprovers < ActiveRecord::Migration[5.2]
  def change
    create_table :budget_approvers do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :email, null: false
      t.integer :empID, null: true
      t.integer :deptNum, null: true

      t.timestamps
    end
  end
end
