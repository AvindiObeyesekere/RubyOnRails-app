class User < ApplicationRecord
    has_secure_password
  
    # Confirm the user by setting the confirmed_at timestamp
    def confirm!
      update_columns(confirmed_at: Time.current)
    end
  
    # Check if the user is confirmed
    def confirmed?
      confirmed_at.present?
    end
  
    # Check if the user is unconfirmed
    def unconfirmed?
      !confirmed?
    end
  
    # Generate a unique confirmation token
    def generate_confirmation_token
      signed_id(expires_in: 15.minutes)
    end
  
    # Send confirmation email to the user
    def send_confirmation_email!
      confirmation_token = generate_confirmation_token
      UserMailer.confirmation(self, confirmation_token).deliver_now
    end
  end
  