class Admin::DashboardController < AdminController

  def home
    @posts = Post.last(4)
    @author = Author.last
  end

end
