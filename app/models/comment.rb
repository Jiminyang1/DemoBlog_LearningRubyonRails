class Comment < ApplicationRecord
  include Visible # include the Visible module from app/models/concerns/visible.rb
  belongs_to :article # a comment belongs to an article
end
