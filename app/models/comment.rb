class Comment < ApplicationRecord
  include Visible

  belongs_to :post

  # Now factored out by including concern above:
  # VALID_STATUSES = ['public', 'private', 'archived']

  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #   status == 'archived'
  # end
end
