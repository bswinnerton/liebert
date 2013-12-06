require 'spec_helper'

describe 'Command Line' do
  it 'should respond when no parameters are passed' do
    command_line = %x( liebert ac )
    expect(command_line).to include "Temperature\t"
  end

  it 'should respond when parameters are passed' do
    command_line = %x( liebert ups --charge )
    expect(command_line).to include "Charge\t"
  end
end
