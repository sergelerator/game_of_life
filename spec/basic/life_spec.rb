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
      @dummy.grid[0][1] = 1
      @dummy.grid[0][1].should eq(1)
      @dummy.neighbours(1,0).should eq(1)
    end

    context "neighbour on each corner" do
      before :each do
        @dummy.grid[0][0] = 1
        @dummy.grid[0][@dummy.width-1] = 1
        @dummy.grid[@dummy.height-1][0] = 1
        @dummy.grid[@dummy.height-1][@dummy.width-1] = 1
      end

      it "should have 3 neighbours at bottom right corner" do
        @dummy.neighbours(@dummy.height-1, @dummy.width-1).should eq(3)
      end

      it "should have 1 neighbour at 1,1" do
        @dummy.neighbours(1, 1).should eq(1)
      end

      it "should have 2 neighbour at 0,1" do
        @dummy.neighbours(0, 1).should eq(2)
      end
    end

    context "everything lives!" do
      before :each do
        @dummy.grid.each_index do |x|
          @dummy.grid[x].each_index{ |y| @dummy.grid[x][y] = 1 }
        end
      end

      it "should have 8 neighbours at 0,0" do
        @dummy.neighbours(0,0).should eq(8)
      end

      it "should have 8 neighbours at 2,2" do
        @dummy.neighbours(2,2).should eq(8)
      end

      it "should have 8 neighbours at 10,5" do
        @dummy.neighbours(10,5).should eq(8)
      end
    end
  end
end
