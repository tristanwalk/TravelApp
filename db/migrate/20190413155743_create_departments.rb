class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.integer :currentBudget
      t.integer :totalBudget
      t.string :name
      t.integer :deptNum


      t.timestamps
    end
  end
end
