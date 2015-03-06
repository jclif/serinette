require_relative '../spec_helper.rb'

describe Serinette::CLI do
  let(:argument_error) { Thor::RequiredArgumentMissingError }

  it 'should throw error when invalid command is given' do
    expect { Seshat::CLI.new.invoke :not_valid }.to raise_error(argument_error)
  end

  it 'should run valid command' do
    expect { Seshat::CLI.new.invoke :generate }.not_to raise_error
  end
end
