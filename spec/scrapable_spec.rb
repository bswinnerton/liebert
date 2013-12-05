require 'spec_helper'

describe Scrapable do
  it 'tells the user they forgot to enter a URI' do
    ac = AirConditioner.new
    expect { ac.temperature }.to raise_error
  end
end
