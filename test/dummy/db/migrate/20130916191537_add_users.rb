class AddEmails < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :website, :null => false
      t.string :facebook
      t.timestamps
    end
  end
end
