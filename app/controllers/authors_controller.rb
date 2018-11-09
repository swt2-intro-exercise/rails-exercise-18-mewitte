class AuthorsController < ApplicationController

  def new

  end

  def create
    @author = Author.new(article_params)

    @author.save
    # redirect_to @author
  end

  def show
    @author = Author.find(params[:id])
  end

  private

  def article_params
    params.require(:author).permit(:first_name, :last_name, :homepage)
  end
end
