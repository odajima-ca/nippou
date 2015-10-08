class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :category, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description
      t.string :status, null: false
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
