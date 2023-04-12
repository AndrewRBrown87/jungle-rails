class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['USER_PASSWORD']

  def show
    @productCount = Product.count
    @categoryCount = Product.distinct.count('category_id')
  end
end
