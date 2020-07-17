class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def unique_posts_commented
    # binding.pry
    self.comments.collect { |c| c.post }.uniq
  end
end

# <% @user.comments.each do |c| %>
#   <li><%= link_to c.post.title, post_path(c.post) %></li>
# <% end %>
