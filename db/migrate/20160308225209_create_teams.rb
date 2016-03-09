class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :access_token
      t.string :domain
      t.string :team_id
      t.string :status

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :teams
  end
end
