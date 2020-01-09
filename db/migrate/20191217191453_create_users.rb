class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login, limit: 100
      t.string :password, limit: 40
      t.string :name, limit: 100
      t.string :emails, limit: 100

      t.timestamps
    end
  end
end
