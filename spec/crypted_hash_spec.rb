require "spec_helper"
require 'fileutils'

RSpec.describe CryptedHash do
  it "can be instantiated" do
    expect(CryptedHash.new("test")).to be_instance_of(CryptedHash)
  end

  it "stores the secret" do
    hash = CryptedHash.new("test")

    expect(hash.secret).to eq('test')
  end

  it "can be prepopulated" do
    hash = CryptedHash.new("test", foo: :bar)

    expect(hash[:foo]).to eq(:bar)
  end

  it 'saves values' do
    hash = CryptedHash.new('test')

    hash[:vk] = 'vkcom'

    expect(hash[:vk]).to eq('vkcom')
  end

  it 'saves file' do
    hash = CryptedHash.new('test')

    FileUtils.rm('./tmp/test')
    hash.save!('./tmp/test')

    expect(File.exists?('./tmp/test')).to eq(true)
  end

  it 'loads file' do
    hash = CryptedHash.new('test')
    hash[:vkontakte] = 'vkcom'

    FileUtils.rm('./tmp/test')
    hash.save!('./tmp/test')
    crypted_hash = CryptedHash.load('./tmp/test', 'test')

    expect(crypted_hash[:vkontakte]).to eq('vkcom')
    expect(crypted_hash).to be_instance_of(CryptedHash)
  end

  it "saves encrypted data in file" do
    hash = CryptedHash.new("secret")
    hash[:github] = "password"

    FileUtils.rm("./tmp/test")
    hash.save!("./tmp/test")
    saved_file_content = File.read("./tmp/test")

    expect(saved_file_content).not_to include("github")
    expect(saved_file_content).not_to include("password")
  end
end
