class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # _id will be appended to the provided model name, here "post_id"
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
