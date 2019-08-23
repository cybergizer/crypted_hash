require "spec_helper"

RSpec.describe CryptedHash do
  it "can be instantiated" do
    expect(CryptedHash.new).to be_instance_of(CryptedHash)
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
