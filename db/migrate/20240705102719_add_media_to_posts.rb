class AddMediaToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :media, :jsonb, default: []
  end
end
