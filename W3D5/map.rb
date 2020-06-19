class Map

    def initialize(map)
        @map = map
    end

    def set(key, value)
        @map.each.with_index do |pair, i|
            if pair[0] == key
                @map[i] = [key, value]
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            if pair[0] == key
                return pair
            end
        end
        return nil
    end

    def delete(key)
        @map.each.with_index do |pair, i|
            if pair[0] == key
                @map.delete_at(i)
                return
            end
        end
    end

    def show
        puts '[' + @map[0]
        (1...@map.length - 1).each do |i|
            puts @map[i]
        end
        puts @map[-1] + ']'
    end

end