# require "fellowship/version"

module Fellowship
  class Fellowship
    def self.deep_copy(item)
      Marshal.load(Marshal.dump(item))
    end

    def self.factorial(n)
      if n == 0
        return 1
      end
      (1..n).inject(:*)
    end

    def self.prime?(n)
      n = Integer(n)
      if n < 2 || n % 1 != 0
        return false
      elsif n == 2
        return true
      end
      i = 2
      Math.sqrt(n).floor.times do
        if n % i == 0
          return false
        end
        i += 1
      end
      return true
    end

    def self.int_digit(integer,digit)
      if digit >= integer.to_s.length
        return nil
      end
      integer.to_s[digit].to_i
    end

    def self.sort_hashes_by(array_of_hashes, *keys)
      key_index = keys.length - 1
      keys.length.times do
        key = keys[key_index]
        i = 0
        array_of_hashes.each do |hash|
          less = 1
          i.times do
            if hash[key] < array_of_hashes[i - less][key]
              array_of_hashes[i + 1 - less], array_of_hashes[i - less] = array_of_hashes[i - less], array_of_hashes[i + 1 - less]
            end
            less += 1
          end
          i += 1
        end
        key_index -= 1
      end
      return array_of_hashes
    end
  end
end