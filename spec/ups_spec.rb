require 'spec_helper'

describe UPS do
  before :all do
    VCR.use_cassette 'ups' do
      @ups = UPS.new(ENV['LIEBERT_UPS_URI'])
    end
  end

  it 'responds to input_amps' do
    expect(@ups.input_amps).to eq "Input_amps\t16.5"
  end

  it 'responds to output_amps' do
    expect(@ups.output_amps).to eq "Output_amps\t33.5"
  end

  it 'responds to battery_voltage' do
    expect(@ups.battery_voltage).to eq "Battery_voltage\t548.0"
  end

  it 'responds to charge' do
    expect(@ups.charge).to eq "Charge\t100.0"
  end

  it 'responds to all' do
    expect(@ups.all).to eq "Input_amps\t16.5\nOutput_amps\t33.5\nBattery_voltage\t548.0\nCharge\t100.0\n"
  end
end
