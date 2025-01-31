class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""  # email  not null and has a default empty string
      t.string :password_digest, null: false     # password_digest is not null

      t.timestamps
    end

    # Adding a unique index on the email column to enforce uniqueness
    add_index :users, :email, unique: true
  end
end
