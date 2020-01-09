class CreateBugsHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs_histories do |t|
      t.string :name, limit: 200
      t.string :title, limit: 150
      t.string :url, limit: 200
      t.datetime :dt_created
      t.datetime :dt_resolution
      t.string :subproject, limit: 250
      t.string :environment, limit: 150
      t.integer :id_groups_configs
      t.string :name_groups_configs, limit: 150

      t.timestamps
    end
  end
end
