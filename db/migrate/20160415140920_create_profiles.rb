class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

			t.integer :user_id #ties user and profile table together
			t.string :first_name
			t.string :last_name
			t.string :job_title
			t.string :phone_number
			t.string :contact_email
			t.text :desciption

			t.timestamps
    end
  end
end
