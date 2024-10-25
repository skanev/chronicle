class CreateDailyLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.references :user,     null: false, foreign_key: true
      t.date       :date,     null: false
      t.decimal    :weight,   null: true,  scale: 2, precision: 5
      t.boolean    :complete, null: false, default: false
      t.timestamps
      t.index [:user_id, :date], unique: true
    end

    create_table :entry_meals do |t|
      t.references :entry,    null: false, foreign_key: true
      t.string     :name,     null: false
      t.integer    :calories, null: false
      t.timestamps
    end
  end
end
