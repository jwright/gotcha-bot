class GotchaBotCore < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :access_token
      t.string :domain
      t.string :team_id
      t.string :status

      t.timestamps null: false
    end

    create_table :bots do |t|
      t.string :bot_id
      t.string :access_token
      t.string :name
      t.references :team, index: true

      t.timestamps null: false
    end
  end
end
