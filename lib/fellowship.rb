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

    def self.find_route(start_id,end_id,segments,endpoint1, endpoint2)
      possible_routes = []
      directions = []
      starts = segments.select{ | segment | segment[endpoint1] == start_id || segment[endpoint2] == start_id }
      starts.each do |start|
        if start[endpoint1] == start_id
          first_tail = start[endpoint2]
        else
          first_tail = start[endpoint1]
        end
        if first_tail == end_id
          return {route: [start.id], tail: first_tail}
        end
        possible_routes << {route: [start.id], tail: first_tail}
      end
      route_achieved = false
      while possible_routes != []
        new_possible_routes = []
        possible_routes.each do |curr_route|
          nexts = segments.select{ | segment | segment[endpoint1] == curr_route[:tail] || segment[endpoint2] == curr_route[:tail] }
          nexts.each do |next_step|
            if next_step[endpoint1] === curr_route[:tail]
              next_tail = next_step[endpoint2]
            else
              next_tail = next_step[endpoint1]
            end
            if next_tail == end_id
              route_achieved = true
            end
            if !curr_route[:route].index(next_step.id) || curr_route[:route].index(next_step.id) < 0
              updated_route = {route: curr_route[:route] << next_step.id, tail: next_tail}
              if route_achieved == true
                return updated_route
              else
                new_possible_routes << updated_route
                curr_route[:route] = curr_route[:route][0..-2]
              end
            end
          end
        end
        possible_routes = new_possible_routes
      end
      return "No route found."
    end
  end
end