class Url < ActiveRecord::Base

  def self.gen_hash
    SecureRandom.urlsafe_base64(6)
  end
end
