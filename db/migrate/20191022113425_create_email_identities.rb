# frozen_string_literal: true

class CreateEmailIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :email_identities do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    migrate_emails

    reversible do |dir|
      change_table :users do |t|
        dir.up do
          t.remove :email
          t.remove :password_digest
        end

        dir.down do
          t.string :email, null: false
          t.string :password_digest
        end
      end
    end
  end

  private

  def migrate_emails
    User.all.each do |user|
      EmailIdentity.create!(email: user.email, password_digest: user.password_digest, user: user)
    end
  end
end
