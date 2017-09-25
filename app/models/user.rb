class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true
  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shout, through: :likes, source: :shout

  def like(shout)
    liked_shout << shout
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def unlike(shout)
    liked_shout.destroy(shout)
  end
      
   
end
