class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true
  has_many :shouts, dependent: :destroy
  has_many :likes
  has_many :liked_shout, through: :likes, source: :shout

  has_many :followed_user_relationships, 
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships, foreign_key: :followed_user_id


  has_many :follower_relationships, 
    foreign_key: :followed_user_id, 
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followers, through: :follower_relationships

  def following?(user)
    followed_user_ids.include? user.id
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def follow(user)
    followed_users << user
  end

  def like(shout)
    liked_shout << shout
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def unlike(shout)
    liked_shout.destroy(shout)
  end

  def to_param
    username
  end


end
