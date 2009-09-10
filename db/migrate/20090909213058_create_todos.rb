class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :todo_id
      t.string :body
      t.boolean :complete, :default => false
      
      t.timestamps
    end
    create_table :todos do |t|
      t.string :ip
      t.string :agent
      t.string :token
      
      t.timestamps
    end
  
  end
  
  def self.down
    drop_table :items
    drop_table :todos
  end
end