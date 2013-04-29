require "spec_helper.rb"
require "./basic/life.rb"

describe "Life" do
  subject{Life}

  it "should be" do
    subject.should be
  end

  describe "initialize" do
    before :each do
      @dummy = subject.new
    end

    it "should be" do
      subject.instance_method(:initialize).should be
    end

    it "should set the rules attribute to the default rules" do
      @dummy.rules.should eq(Life::DEFAULT_RULES)
    end

    it "should set the width attribute to the default width" do
      @dummy.width.should eq(Life::DEFAULT_WIDTH)
    end

    it "should set the height attribute to the default height" do
      @dummy.height.should eq(Life::DEFAULT_HEIGHT)
    end

    it "should set the seed attribute to the default seed" do
      @dummy.seed.should eq(Life::DEFAULT_SEED)
    end

    it "should set the grid attribute to a default size matrix" do
      @dummy.grid.length.should eq(Life::DEFAULT_WIDTH)
      @dummy.grid.each{ |col| col.length.should eq(Life::DEFAULT_HEIGHT) }
    end

    it "should have identical grid columns" do
      @dummy.grid[0].should eq(@dummy.grid[1])
    end

    it "should have different object IDs on each of the grid's columns" do
      @dummy.grid[0].should_not be(@dummy.grid[1])
      @dummy.grid[1].should_not be(@dummy.grid[2])
    end
  end

  describe "read_seed" do
    before :each do
      @dummy = subject.new
    end

    it "should be" do
      subject.instance_method(:read_seed).should be
      @dummy.method(:read_seed).should be
    end
  end

  describe "neighbours" do
    before :each do
      @dummy = subject.new
      @dummy.grid.each_index do |x|
        @dummy.grid[x].each_index{|y| @dummy.grid[x][y] = 0}
      end
    end

    it "should be" do
      subject.instance_method(:neighbours).should be
      @dummy.method(:neighbours).should be
    end

    it "should return 1 when there's only one neighbour" do
      @dummy.grid[0][0] = 1
      @dummy.grid[0][0].should eq(1)
      @dummy.neighbours(0,1).should eq(1)
    end
  end
end
