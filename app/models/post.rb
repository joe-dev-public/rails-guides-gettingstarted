class Post < ApplicationRecord
  include Visible

  # Delete comments if the post is deleted:
  # https://guides.rubyonrails.org/getting_started.html#deleting-associated-objects
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 3 }

  # included via concern above
  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
