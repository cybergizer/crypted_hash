class CryptedHash
  attr_reader :key, :hash
  def initialize(key:, default_hash: {})
    @key = key
    @hash = default_hash
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

  def self.load(path, key)
    file = File.read(path)
    hash = Marshal.load(file)
    self.new(key: key, default_hash: hash)
  end
end
