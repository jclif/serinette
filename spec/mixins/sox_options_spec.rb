require 'spec_helper'

describe SoxOptions do
  let(:klass) { Class.new { include SoxOptions } }

  context 'a method #randomize_effect_options' do
    it 'should exist in classes which include the module' do
      expect(klass.new).to respond_to(:randomize_effect_options)
    end
  end
end
