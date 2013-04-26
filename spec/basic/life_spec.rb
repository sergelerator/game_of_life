require "spec_helper.rb"
require "./basic/life.rb"

describe "Life" do
  subject{Life}

  it "should be" do
    subject.should be
  end

  describe "initialize" do
    before :each do
      subject.stub(:read_seed)
    end

    it "should be" do
      subject.instance_method(:initialize).should be
    end

    it "should set the rules attribute to the default rules" do
      dummy = subject.new
      dummy.
    end
  end
end
