class BugsGroupsConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs_groups_configs do |t|
      t.references :bug, :groups_config
    end
  end
end
