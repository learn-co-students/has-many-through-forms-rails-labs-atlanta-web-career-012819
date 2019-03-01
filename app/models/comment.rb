class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attr)
    if !attr[:username].empty?
      self.user = User.create(username: attr[:username])
    end
  end

end
