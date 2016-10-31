class DropPins < ActiveRecord::Migration[5.0]
  def change
  	drop_table :pins
  end
end
