class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.jsonb :headers
      t.jsonb :body
      t.string :method

      t.timestamps null: false
    end
  end
end
