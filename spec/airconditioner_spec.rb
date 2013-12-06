require 'spec_helper'

vcr_options = { cassette_name: 'airconditioner' }

describe AirConditioner, vcr: vcr_options do
  before :all do
    @ac = AirConditioner.new(ENV['LIEBERT_AIRCONDITIONER_HOSTNAME'])
  end

  it 'responds to temperature' do
    expect(@ac.temperature).to eq 65.0
  end

  it 'responds to humidity' do
    expect(@ac.humidity).to eq 38.0
  end

  it 'responds to all' do
    expect(@ac.all).to eq "Temperature\t65.0\nHumidity\t38.0\n"
  end
end
