class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :bugs_history
end
