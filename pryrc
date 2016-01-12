require 'rubygems'

=begin
  require 'hirb'
  rescue LoadError
    # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
=end

Pry.config.editor = 'gvim --nofork'
Pry.config.commands.alias_command "lM", "ls -M"

begin
  require 'awesome_print'
  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output)
  end
rescue LoadError # => err
  puts "no awesome_print :("
end

# add the current directories /lib and /spec directories to the path if they exist
Pry.config.hooks.add_hook(:before_session, :set_environment) do
  dir = `pwd`.chomp
  %w(lib spec test).map { |d| "#{dir}/#{d}" }.each do |p|
    $: << p unless !File.exist?(p) || $:.include?(p)
  end

  begin
    require 'require_all'
    # and you can in pry session
    # require_all '*.rb'
  rescue
    puts "no require_all gem present :("
  end
end

=begin
load 'user.rb'
require './user' # .rb is optional

# add to loadpath
$: << `pwd`.chomp
# and then
require 'user'

# or add current dir to loadpath on irb start
irb -I .

# or in irb
require 'require_all'
require './*.rb'

=end

