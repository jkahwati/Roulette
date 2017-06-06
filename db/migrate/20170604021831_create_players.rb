class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :nombre
      t.float :cantidad

      t.timestamps
    end
  end
end
