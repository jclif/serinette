require 'spec_helper'
require 'reverb_effect'

describe Descendents do
  let(:klass) { Class.new { include Descendents } }

  it "should grant classes a method called descendents" do
    klass.should respond_to :descendents
  end

end
