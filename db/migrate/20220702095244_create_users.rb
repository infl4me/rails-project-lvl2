class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.email :string
      t.first_name :string
      t.last_name :string

      t.timestamps
    end
  end
end
