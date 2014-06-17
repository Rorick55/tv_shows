class AddActorIdToCharacters < ActiveRecord::Migration
  def up
    add_column :characters, :actor_id, :integer
  end

  def down
    remove_column :characters, :actor_id
  end
end
