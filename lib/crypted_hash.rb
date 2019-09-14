class CryptedHash
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
    file = File.open(path, 'w+')
    file.puts(Marshal.dump(hash))
    file.close
  end

  def self.load(path, secret)
    file = File.read(path)
    hash = Marshal.load(file)
    self.new(secret, hash)
  end
end
