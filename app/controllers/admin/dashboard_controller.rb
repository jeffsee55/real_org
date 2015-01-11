class Admin::DashboardController < AdminController

  def home
    @posts = Post.all
  end

end
