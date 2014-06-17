class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name, null: false
      t.string :description, limit: 1000
    end
  end
end
