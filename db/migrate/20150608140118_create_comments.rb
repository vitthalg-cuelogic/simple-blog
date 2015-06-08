class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.string :commented_by_name
      t.string :commented_by_email
      t.references :blog, index: true

      t.timestamps
    end
  end
end
