class Bug < ApplicationRecord
  has_and_belongs_to_many :groups_config
end
