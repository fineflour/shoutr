class Like < ApplicationRecord
  belongs_to :user
  belongs_to :shout
  

  validates :user_id, uniqueness: {scope: :shout_id}
end
