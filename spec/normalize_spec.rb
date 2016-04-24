require 'spec_helper'

describe Normalize do
  context 'normalizes hashes' do
    before :each do
      @hsh_normal = { a: 1, b: 2, c: 3 }
      @hsh_nest = { a: 1, b: 2, c: 3, d: { e: 4 } }
      @hsh_nest_n = { a: 1, b: 2, c: 3, d: { e: 4, f: { g: 5 } } }
    end

    it "with 0 nest level" do
      @hsh_normal.extend(Normalize)
      expect(@hsh_normal.a).to eql(1)
      expect(@hsh_normal.b).to eql(2)
      expect(@hsh_normal.c).to eql(3)
    end

    it "with 1 nest level" do
      @hsh_nest.extend(Normalize)
      expect(@hsh_nest.d.e).to eql(4)
    end

    it "with n nest level" do
      @hsh_nest_n.extend(Normalize)
      expect(@hsh_nest_n.d.e).to eql(4)
      expect(@hsh_nest_n.d.f).to eql({ g: 5 })
      expect(@hsh_nest_n.d.f.g).to eql(5)
    end
  end
end
