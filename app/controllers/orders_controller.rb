class ArticlesController < ApplicationController
  def new
    @order = Order.new
  end
  def create
    @order = Article.new(order_params)
    @article.save
    redirect_to article_path(@order)
  end
  private
  def order_params
    params.require(:order).permit(:recipe)
  end
end
