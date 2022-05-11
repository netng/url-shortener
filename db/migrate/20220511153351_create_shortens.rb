class CreateShortens < ActiveRecord::Migration[7.0]
  def change
    create_table :shortens do |t|

      t.timestamps
    end
  end
end
