class GraphNode
    attr_accessor :val, :neighbors
    # @@nil = self.new(nil)
    # @@testedList = []
    def initialize(val)
      @val = val
      @neighbors = []
      @testedList = []
    end

    def bfs(target_value, anchors)
        return self if self.val == target_value
        while !anchors.empty?
            anchors.each do |val|
                if !@testedList.include?(val)
                    tempTarg = _bfs(val, target_value)
                    return tempTarg if tempTarg != nil
                end
            end
        end
        nil
    end

    def _bfs(start_val, target_value)
        queue = [start_val]
        while !queue.empty?
            firstEle = queue.shift
            return firstEle if firstEle.val == target_value
            firstEle.neighbors.each do |neighbor|
                if !@testedList.include?(neighbor)
                    queue << neighbor
                    @testedList << neighbor
                end
            end
        end
        nil
    end

  end


  a = GraphNode.new('a')
  b = GraphNode.new('b')
  c = GraphNode.new('c')
  d = GraphNode.new('d')
  e = GraphNode.new('e')
  f = GraphNode.new('f')
  a.neighbors = [b, c, e]
  c.neighbors = [b, d]
  e.neighbors = [a]
  f.neighbors = [e]

  anchors = [a, b, c, d, e, f]

  ans = a.bfs("f", anchors)
  p ans.val