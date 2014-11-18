class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :type
      t.references :user

      t.timestamps
    end
  end
end
