require "spec_helper"

RSpec.describe CryptedHash::Cipher do
  it "encrypts strings" do
    encryptor = CryptedHash::Cipher.new("secret")

    encrypted_sring = encryptor.encrypt("test")

    expect(encrypted_sring).not_to include("test")
  end

  it "decrypts strings" do
    encryptor = CryptedHash::Cipher.new("secret")
    encrypted_sring = encryptor.encrypt("test")
    decryptor = CryptedHash::Cipher.new("secret")

    decrypted_string = decryptor.decrypt(encrypted_sring)

    expect(decrypted_string).to eq("test")
  end
end
