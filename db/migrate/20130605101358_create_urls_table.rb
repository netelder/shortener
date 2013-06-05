class CreateUrlsTable < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text     :original
      t.string   :short
      t.integer  :click_count

      t.timestamps
    end
  end
end
