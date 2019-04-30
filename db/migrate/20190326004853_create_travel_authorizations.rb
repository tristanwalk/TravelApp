class CreateTravelAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_authorizations do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.integer :empID, null: false
      t.integer :tripNum, null: false
      t.integer :deptNum, null: false
      t.integer :formNum, null: false
      t.date :departDate, null: false
      t.date :returnDate, null: false
      t.text :destination, null: false
      t.string :purpose, null: false
      t.string :status, default: "Pending", null: false
      t.string :comment, default: "", null: true

      t.timestamps
    end
  end
end
