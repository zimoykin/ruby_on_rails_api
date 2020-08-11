class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :title
      t.integer :people

      t.timestamps
    end
  end
end
