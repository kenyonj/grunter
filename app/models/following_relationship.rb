class FollowingRelationship < ActiveRecord::Base
  belongs_to :followed_user,
    class_name: "User"

  belongs_to :follower,
    class_name: "User"

  validates :followed_user_id,
    uniqueness: { scope: :follower_id }

  validate :cannot_follow_yourself

  private

  def cannot_follow_yourself
    if followed_user_id == follower_id
      errors.add(:base, "You cannot follow yourself.")
    end
  end

end
