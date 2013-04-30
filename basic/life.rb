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

    @grid = Array.new(height){ |i| Array.new(width, 0) }
  end

  def read_seed
    lines = File.open(seed, "r").read.split("\n")
    lines.each_index do |i|
      cells = lines[i].split("")
      cells.each_index{ |j| grid[i][j] and grid[i][j] = cells[j].to_i }
    end
  end

  def evolve
    y, x = (0...height), (0...width)
    @grid = y.map{ |i| x.map{ |j| rules[ grid[i][j] ][ neighbours(i, j) ] } }
  end

  def neighbours i, j
    region = (i-1..i+1).to_a.product (j-1..j+1).to_a
    region.map{ |h, w| grid[h % height][w % width] }.reduce(0, &:+) - grid[i][j]
  end

  def print
    puts grid.map{ |row| row.join(" ")}.join("\n").gsub("0", " ")
  end
end

if __FILE__ == $0
  life = Life.new
  life.read_seed
  while 1
    system("clear")
    life.print
    sleep(1)
    life.evolve
  end
end
