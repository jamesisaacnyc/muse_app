class AddPostsInfo < ActiveRecord::Migration
  def change
  	create_table :posts do |t|

      t.timestamps null: false
  end
end
