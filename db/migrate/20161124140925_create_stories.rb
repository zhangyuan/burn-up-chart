class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer :number
      t.string :title
      t.date :planned_on
      t.integer :estimated_points
      t.integer :real_points
      t.date :dev_done_on

      t.timestamps
    end
  end
end
