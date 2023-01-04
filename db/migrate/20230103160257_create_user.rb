class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :role, null: false, default: 'user'

      t.timestamps
    end
  end
end
