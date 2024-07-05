module PostsHelper
  def post_author(email)
    user = User.find_by(email: email)
    user.username
  end
end
