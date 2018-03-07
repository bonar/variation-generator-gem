require 'pp'

RSpec.describe VariationGenerator do

  describe "generate variations" do

    let(:generator) {
      VariationGenerator.new
    }

    let(:sample1) {
      [
        ["a", "b"],
        ["1", "2"]
      ]
    }

    it "generates 2 entries variation" do
      results = generator.generate(sample1)
      expect(results.length).to eq 4
      expect(results[0]).to eq "a1"
      expect(results[1]).to eq "a2"
      expect(results[2]).to eq "b1"
      expect(results[3]).to eq "b2"
    end

    let(:sample2) {
      [
        ["A"],
        ["X", "Y"],
        ["1", "2", "3"]
      ]
    }

    it "generates 3 entries variation" do
      results = generator.generate(sample2)
      expect(results.length).to eq 6
      expect(results[0]).to eq "AX1"
      expect(results[1]).to eq "AX2"
      expect(results[2]).to eq "AX3"
      expect(results[3]).to eq "AY1"
      expect(results[4]).to eq "AY2"
      expect(results[5]).to eq "AY3"
    end

    let(:sample3) {
      [
        ["A", "B"],
        ["X"],
        ["1", "2"]
      ]
    }

    it "generates 3 entries variation with one element array" do
      results = generator.generate(sample3)
      expect(results.length).to eq 4
      expect(results[0]).to eq "AX1"
      expect(results[1]).to eq "AX2"
      expect(results[2]).to eq "BX1"
      expect(results[3]).to eq "BX2"
    end

    let(:sample4) {
      [
        ["one"]
      ]
    }

    it "generates one element variation" do
      results = generator.generate(sample4)
      expect(results.length).to eq 1
      expect(results[0]).to eq "one"
    end

    let(:sample5) {
      [
        ["A", "B"],
        ["", "1", "2"]
      ]
    }

    it "generates variation with empty string" do
      results = generator.generate(sample5)
      expect(results.length).to eq 6
      expect(results[0]).to eq "A"
      expect(results[1]).to eq "A1"
      expect(results[2]).to eq "A2"
      expect(results[3]).to eq "B"
      expect(results[4]).to eq "B1"
      expect(results[5]).to eq "B2"
    end

  end

end
