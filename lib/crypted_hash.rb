require "crypted_hash/cipher"

class CryptedHash
  class DecryptionError < Exception; end

  attr_reader :secret, :hash

  def initialize(secret, prepopulate_hash = {})
    @secret = secret
    @hash = prepopulate_hash
  end

  def [](key)
    hash[key]
  end

  def []=(key, value)
    hash[key] = value
  end

  def save!(path)
    serialized_hash = Marshal.dump(hash)
    File.write(path, Cipher.new(secret).encrypt(serialized_hash))
  end

  def self.load(path, secret)
    encrypted_serialized_hash = File.read(path)
    serialized_hash = Cipher.new(secret).decrypt(encrypted_serialized_hash)
    hash = Marshal.load(serialized_hash)
    self.new(secret, hash)
  rescue OpenSSL::Cipher::CipherError
    raise DecryptionError.new("Wrong file content or secret")
  end
end
