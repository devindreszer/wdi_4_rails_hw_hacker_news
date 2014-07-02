class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :voteable, polymorphic: true, index: true
      t.boolean :is_up
    end
  end
end