class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :status
      t.string :author
      t.datetime :creation_date
      t.datetime :published_date

      t.timestamps
    end
  end
end
