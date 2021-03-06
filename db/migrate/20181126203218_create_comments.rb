class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :part, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
