class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:@product_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to product_path(@product)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
