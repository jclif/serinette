require_relative '../spec_helper.rb'

describe Serinette::CLI do
  it 'should run valid command' do
    expect { Serinette::CLI.new.invoke :generate }.not_to raise_error
  end
end
