require 'spec_helper'

module Codebreaker
  describe Marker do
    describe "#exact_match_count" do
      context "with no matches" do
        it "should return 0" do
          marker = Marker.new('1234', '4321', :digits => 4)
          marker.exact_match_count.should == 0
        end
      end

      context "with 1 exact match" do
        it "should return 1" do
          marker = Marker.new('1234', '1342', :digits => 4)
          marker.exact_match_count.should == 1
        end
      end

      context "with 2 exact match" do
        it "should return 2" do
          marker = Marker.new('1234', '1243', :digits => 4)
          marker.exact_match_count.should == 2
        end
      end

      context "with 3 exact match" do
        it "should return 3" do
          marker = Marker.new('1234', '1235', :digits => 4)
          marker.exact_match_count.should == 3
        end
      end

      context "with 4 exact match" do
        it "should return 4" do
          marker = Marker.new('1234', '1234', :digits => 4)
          marker.exact_match_count.should == 4
        end
      end
    end

    describe "#number_match_count" do
      context "with no matches" do
        it "should return 0" do
          marker = Marker.new('1234', '5555', :digits => 4)
          marker.number_match_count.should == 0
        end
      end

      context "with 1 number matches" do
        it "should return 1" do
          marker = Marker.new('1234', '5515', :digits => 4)
          marker.number_match_count.should == 1
        end
      end

      context "with 2 number matches" do
        it "should return 2" do
          marker = Marker.new('1234', '5125', :digits => 4)
          marker.number_match_count.should == 2
        end
      end

      context "with 3 number matches" do
        it "should return 3" do
          marker = Marker.new('1234', '5123', :digits => 4)
          marker.number_match_count.should == 3
        end
      end

      context "with 4 number matches" do
        it "should return 4" do
          marker = Marker.new('1234', '4123', :digits => 4)
          marker.number_match_count.should == 4
        end
      end

      context "with 1 exact match duplicated in guess" do
        it "returns 0" do
          marker = Marker.new('1234', '1155', :digits => 4)
          marker.number_match_count.should == 0 
        end
      end
    end

    describe "#total_match_count" do
      context "when 0 matches" do
        it "should return 0" do
          marker = Marker.new('1234', '5555')
          marker.total_match_count.should == 0
        end
      end

      context "when 1 matches" do
        it "should return 1" do
          marker = Marker.new('1234', '5515')
          marker.total_match_count.should == 1
        end
      end

      context "when 2 matches" do
        it "should return 2" do
          marker = Marker.new('1234', '5215')
          marker.total_match_count.should == 2
        end
      end

      context "when 3 total matches" do
        it "should return 3" do
          marker = Marker.new('1234', '1235')
          marker.total_match_count.should == 3
        end
      end

      context "when 4 total matches" do
        it "should return 4" do
          marker = Marker.new('1234', '1243')
          marker.total_match_count.should == 4
        end
      end
    end
  end
end