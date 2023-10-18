class Article < ApplicationRecord
    include Visible # include the Visible module from app/models/concerns/visible.rb
    #has_many is a Rails method that indicates an Article can have many Comments. 
    #The dependent: :destroy option tells Rails to delete all the comments associated with the article if the article itself is ever destroyed:
    has_many :comments, dependent: :destroy 
   
    validates :title, presence: true # validates that the title attribute is present
    validates :body, presence: true, length: { minimum: 10 } # validates that the body attribute is present and has a minimum length of 10 characters


    
    
   

end
  
