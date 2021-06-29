class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :text
      t.integer :length
      t.integer :from
      t.integer :to
      t.references :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
