class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :entry
      t.integer :user_id

      t.timestamps
    end
  end
end
