class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.string :name, null: false
      t.string :twitter_handle
      t.text :bio
      t.string :talk_title
    end
  end
end
