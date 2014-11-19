class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
    	t.references :user, index: true
    	t.references :interest, index: true
    	
      t.timestamps
    end
  end
end
