class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.decimal :salary
      t.integer :shifts
      t.integer :years

      t.timestamps
    end
  end
end
