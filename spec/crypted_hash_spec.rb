require "spec_helper"
require "fileutils"
require "tempfile"

RSpec.describe CryptedHash do
  let(:secret) { "secret" }

  it "can be instantiated" do
    expect(CryptedHash.new(secret)).to be_instance_of(CryptedHash)
  end

  it "stores the secret" do
    hash = CryptedHash.new(secret)

    expect(hash.secret).to eq(secret)
  end

  it "can be prepopulated" do
    hash = CryptedHash.new(secret, foo: :bar)

    expect(hash[:foo]).to eq(:bar)
  end

  it "stores values" do
    hash = CryptedHash.new(secret)

    hash[:github] = "password"

    expect(hash[:github]).to eq("password")
  end

  context "when persisting data to disk" do
    before :each do
      @tempfile = Tempfile.create
    end

    after :each do
      File.unlink(@tempfile.path)
    end

    it "saves hash data to a file" do
      hash = CryptedHash.new("secret")

      hash.save!(@tempfile.path)

      expect(File.empty?(@tempfile.path)).to be false
    end

    it "loads hash data from a file" do
      hash = CryptedHash.new("secret")
      hash[:github] = "password"
      hash.save!(@tempfile.path)

      crypted_hash = CryptedHash.load(@tempfile.path, "secret")

      expect(crypted_hash[:github]).to eq("password")
      expect(crypted_hash).to be_instance_of(CryptedHash)
    end

    it "saves encrypted data in file" do
      hash = CryptedHash.new("secret")
      hash[:github] = "password"

      hash.save!(@tempfile.path)
      saved_file_content = File.read(@tempfile.path)

      expect(saved_file_content).not_to include("github")
      expect(saved_file_content).not_to include("password")
    end
  end
end
