class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.bushido_authenticatable :null => false
      t.trackable

      t.timestamps
    end

    add_index :users, :ido_id,                :unique => true
  end

end
