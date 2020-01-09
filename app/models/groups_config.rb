class GroupsConfig < ApplicationRecord
  belongs_to :tfs_config
  has_and_belongs_to_many :users
  has_and_belongs_to_many :bugs
end
