class CreateAllotedPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :alloted_phone_numbers do |t|
      t.string :alloted_number

      t.timestamps
    end
  end
end
