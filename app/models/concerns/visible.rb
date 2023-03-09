module Visible
  extend ActiveSupport::Concern

  # ruby-rubocop VS Code extension autocorrect changed
  # ['public', 'private', 'archived'] to this, fair enough:
  VALID_STATUSES = %w[public private archived]

  # Note how the syntax changes here slightly from the code we factored out of
  # the two models: is "included" general ruby stuff, or specific to
  # ActiveSupport::Concern?
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # class methods are ruby basics.
  class_methods do
    def public_count
      # This looks like model language to me:
      where(status: 'public').count
    end
  end

  def archived?
    # Returns this expression evaluation
    status == 'archived'
  end
end
