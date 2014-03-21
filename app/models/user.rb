class User < ActiveRecord::Base
  include Clearance::User

  has_many :grunts

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"

  has_many :followers,
    through: :follower_relationships

  has_many :followed_users_grunts,
    through: :followed_users, source: :grunts

  def is_following?(user)
    followed_user_ids.include? user.id
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def grunt_feed
    feed_user_ids = followed_user_ids + [self.id]
    Grunt.where(user_id: feed_user_ids).recent
  end
end
