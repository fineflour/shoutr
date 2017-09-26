class CreateFollowingRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :following_relationships do |t|
      t.belongs_to :follower
      t.belongs_to :followed_user
      t.timestamps
    end
  end
end
