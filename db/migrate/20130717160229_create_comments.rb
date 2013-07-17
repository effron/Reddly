class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :link_id
      t.integer :parent_comment_id

      t.timestamps
    end
  end
end
