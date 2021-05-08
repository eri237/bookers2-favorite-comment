class SearchController < ApplicationController
  def search
    @model = params[:model]
    content = params[:content]
    search = params[:search]
    if @model == 'user'
      @user = User.search(search, content)
    else
      @book = Book.search(search, content)
    end
  end
end
