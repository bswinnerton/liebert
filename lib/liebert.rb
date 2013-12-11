require 'liebert/version'
require 'liebert/airconditioner'
require 'liebert/ups'

# For each argument passed, see if the object responds to a method of that name
def pass_arguments(object)
  ARGV.each do |arg|
    sanitized_arg = arg.gsub('--', '')
    puts object.send(sanitized_arg.to_sym) if object.respond_to? sanitized_arg
  end
  puts object.all if ARGV[1].nil?
end
