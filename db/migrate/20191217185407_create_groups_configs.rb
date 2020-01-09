class CreateGroupsConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_configs do |t|
      t.text :tfs_query
      t.string :name
      t.references :tfs_config, foreign_key: true

      t.timestamps
    end
  end
end
