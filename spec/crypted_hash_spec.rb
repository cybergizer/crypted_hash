require "spec_helper"
require 'fileutils'

RSpec.describe CryptedHash do
  it "can be instantiated" do
    expect(CryptedHash.new(key: "test")).to be_instance_of(CryptedHash)
  end

  it "stores the key" do
    hash = CryptedHash.new(key: "test")

    expect(hash.key).to eq('test')
  end

  it 'saves values' do
    hash = CryptedHash.new(key: 'test')

    hash[:vk] = 'vkcom'

    expect(hash[:vk]).to eq('vkcom')
  end

  it 'saves file' do
    hash = CryptedHash.new(key: 'test')

    FileUtils.rm('./tmp/test')
    hash.save!('./tmp/test')

    expect(File.exists?('./tmp/test')).to eq(true)
  end

  it 'loads file' do
    hash = CryptedHash.new(key: 'test')
    hash[:vkontakte] = 'vkcom'

    FileUtils.rm('./tmp/test')
    hash.save!('./tmp/test')
    crypted_hash = CryptedHash.load('./tmp/test', 'test')

    expect(crypted_hash[:vkontakte]).to eq('vkcom')
    expect(crypted_hash).to be_instance_of(CryptedHash)
  end
end
