class Article < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 5 } #validates that there is a title in the post.
end
