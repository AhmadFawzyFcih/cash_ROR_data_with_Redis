class TestUpDownChangeMethods < ActiveRecord::Migration[6.0]
  def change
    p "change mehtod"
    create_table :tests do |t|
      t.string :colm_1
      t.string :colm_2

      t.timestamps
    end


    reversible do |change|
      change.up do
        p "up method"
      end
      
      change.down do
        p "down method"
      end
    end 
  end
  
end
