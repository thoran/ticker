class Ticker < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :volume_24h
      t.decimal :volume
      t.datetime :transition_time
      t.string :status
      t.integer :session
      t.decimal :prev_close
      t.decimal :last
      t.datetime :current_time
      t.decimal :bid
      t.decimal :ask
      t.timestamps
    end
  end
end
