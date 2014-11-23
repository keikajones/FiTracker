class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body
      t.string :timeline
      t.references :user, index: true

      t.timestamps
    end
  end
end
