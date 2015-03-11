class Subscriber < ActiveRecord::Base
  def self.to_hash_list
  end

  def access_token
    Subscriber.create_access_token(self)
  end
    # Verifier based on our application secret
  def self.verifier
    ActiveSupport::MessageVerifier.new('test')
  end

  # Get a user from a token
  def self.read_access_token(signature)
    id = verifier.verify(signature)
    Subscriber.find_by_id id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  # Class method for token generation
  def self.create_access_token(subscriber)
    verifier.generate(subscriber.id)
  end
end
