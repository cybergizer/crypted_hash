require "openssl"
require "digest/sha1"

class CryptedHash
  class Cipher
    def initialize(secret)
      @secret = secret
    end

    def encrypt(message)
      cipher = OpenSSL::Cipher.new("aes-256-cbc").encrypt
      cipher.key = cipher_key

      cipher.update(message) + cipher.final
    end

    def decrypt(message)
      cipher = OpenSSL::Cipher.new("aes-256-cbc").decrypt
      cipher.key = cipher_key

      cipher.update(message) + cipher.final
    end

    private

    attr_reader :secret

    def cipher_key
      Digest::SHA256.digest(secret)
    end
  end
end
