class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :body
      t.text :rendered_body
      t.integer :user_id
      t.string :uuid

      t.timestamps
    end
  end
end
