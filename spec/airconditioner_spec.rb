require 'spec_helper'

describe AirConditioner do
  before :all do
    VCR.use_cassette 'airconditioner' do
      @ac = AirConditioner.new(ENV['LIEBERT_AIRCONDITIONER_URI'])
    end
  end

  it 'responds to temperature' do
    expect(@ac.temperature).to eq "Temperature\t65.0"
  end

  it 'responds to humidity' do
    expect(@ac.humidity).to eq "Humidity\t48.0"
  end

  it 'responds to all' do
    expect(@ac.all).to eq "Temperature\t65.0\nHumidity\t48.0\n"
  end
end
