class GroupsConfigsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_configs_users do |t|
      t.references :groups_config, :user
    end
  end
end
