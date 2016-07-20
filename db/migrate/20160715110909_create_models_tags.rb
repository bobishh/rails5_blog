class CreateModelsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :models_tags do |t|
      t.integer :tag_id
      t.integer :model_id
      t.string :model_type
      t.string :string

      t.timestamps
    end
  end
end
