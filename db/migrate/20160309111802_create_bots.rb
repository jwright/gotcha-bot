class CreateBots < ActiveRecord::Migration
  def self.up
    create_table :bots do |t|
      t.string :bot_id
      t.string :access_token
      t.string :name
      t.references :team, index: true

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :bots
  end
end
