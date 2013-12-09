require 'spec_helper'

describe Scrapable do
  it 'tells the user they forgot to enter a hostname' do
    ac = AirConditioner.new
    expect { ac.temperature }.to raise_error(RuntimeError, 'You forgot to set the hostname to your Liebert unit. More information can be found here: https://github.com/bswinnerton/liebert/blob/master/README.md')
  end

  it 'gracefully fails when it cannot contact the liebert unit' do
    liebert_hostname = 'notaliebertunit.bobst.nyu.edu'
    ac = AirConditioner.new(liebert_hostname)
    expect { ac.temperature }.to raise_error(RuntimeError, "Unable to contact liebert unit at #{ac.endpoint_uri}")
  end
end
