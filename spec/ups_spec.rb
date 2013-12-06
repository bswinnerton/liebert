require 'spec_helper'

vcr_options = { cassette_name: 'ups' }

describe UPS, vcr: vcr_options do
  before :all do
    @ups = UPS.new(ENV['LIEBERT_UPS_HOSTNAME'])
  end

  it 'responds to input_amps' do
    expect(@ups.input_amps).to eq 16.4
  end

  it 'responds to output_amps' do
    expect(@ups.output_amps).to eq 33.6
  end

  it 'responds to battery_voltage' do
    expect(@ups.battery_voltage).to eq 547.0
  end

  it 'responds to charge' do
    expect(@ups.charge).to eq 100.0
  end

  it 'responds to all' do
    expect(@ups.all).to eq "Input_amps\t16.4\nOutput_amps\t33.6\nBattery_voltage\t547.0\nCharge\t100.0\n"
  end
end
