class Life
  DEFAULT_WIDTH = 40
  DEFAULT_HEIGHT = 40
  DEFAULT_RULES = [[0,0,0,1,0,0,0,0,0],[0,0,1,1,0,0,0,0,0]]
  DEFAULT_SEED = "default_seed.txt"

  attr_reader :rules, :width, :height, :grid, :seed

  def initialize options = {}
    @rules = options[:rules] || DEFAULT_RULES
    @width = options[:width] || DEFAULT_WIDTH
    @height = options[:height] || DEFAULT_HEIGHT
    @seed = options[:seed] || DEFAULT_SEED

    @grid = Array.new(width){ |i| Array.new(height) }
  end

  def read_seed
    lines = File.open(seed, "r").read.split("\n")
    lines.each_index do |i|
      cells = lines[i].split("")
      cells.each_index{ |j| grid[i][j] && grid[i][j] = cells[j] }
    end
  end

  def evolve
    next_gen = grid.dup
    grid.each_index do |i|
      grid[i].each_index do |j|
        next_gen[i][j] = rules[ grid[i][j] ][ neighbours(i, j) ]
      end
    end
  end

  def neighbours i, j
    x, y = (i-1..i+1), (j-1..j+1)
    x.map{ |w| y.map{ |h| grid[i][j] }.reduce(0, &:+) }.reduce(0, &:+) - grid[i, j]
  end
end
