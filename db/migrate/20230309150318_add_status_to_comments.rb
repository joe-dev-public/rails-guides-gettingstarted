class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    # Add a column to the :table, with this :name, and this :type (I guess)
    # After doing this, don't forget you may need to update various things:
    # - ~strong params~ in controllers,
    # - models,
    add_column :comments, :status, :string
  end
end
