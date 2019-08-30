class HomeController < ApplicationController
  def top
    redirect_to posts_path
  end
end
