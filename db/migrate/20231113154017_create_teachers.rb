class CreateTeachers < ActiveRecord::Migration[7.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :age
      t.text :address

      t.timestamps
    end
  end
end
