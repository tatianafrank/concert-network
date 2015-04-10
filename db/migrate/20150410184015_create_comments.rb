class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :author
    	t.text :content
    	t.datetime :date

      t.timestamps null: false
    end
  end
end
