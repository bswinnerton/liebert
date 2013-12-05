VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<AIRCONDITIONER_URI>') { ENV['LIEBERT_AIRCONDITIONER_URI'] }
  c.filter_sensitive_data('<UPS_URI>') { ENV['LIEBERT_UPS_URI'] }
  c.configure_rspec_metadata!
end
