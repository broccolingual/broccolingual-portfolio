class HomesController < ApplicationController
  def top
    @blogs = Blog.all.order(created_at: :desc)
  end
end
