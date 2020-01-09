class CreateTfsConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :tfs_configs do |t|
      t.string :connection_string
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
