class CreateExchangeMembers < ActiveRecord::Migration
  def change
    create_table :exchange_members do |t|
      t.string :gifter
      t.string :giftee

      t.timestamps
    end
  end
end
