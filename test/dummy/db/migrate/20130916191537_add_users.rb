class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :website, :null => false
      t.string :facebook
      t.string :stem
      t.timestamps
    end
  end
end
