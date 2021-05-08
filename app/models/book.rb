class Book < ApplicationRecord
 belongs_to :user
 has_many :favorites, dependent: :destroy
 has_many :book_comments, dependent: :destroy

 def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
 end
 
 def self.search(search, content) 
      if search == "forward_match"
        @book = Book.where("title LIKE?","#{content}%")
      elsif search == "backward_match"
        @book = Book.where("title LIKE?","%#{content}")
      elsif search == "perfect_match"
        @book = Book.where(title: "#{content}")
      elsif search == "partial_match"
        @book = Book.where("title LIKE?","%#{content}%")
      else
        @book = Book.all
      end
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
