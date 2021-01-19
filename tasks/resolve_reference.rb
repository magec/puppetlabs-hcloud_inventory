require_relative '../../ruby_task_helper/files/task_helper.rb'
require_relative '../../ruby_plugin_helper/lib/plugin_helper.rb'
require 'json'
require 'hcloud'

class HetznerInventory < TaskHelper
  include RubyPluginHelper

  attr_reader :gateway

  def resolve_reference(opts)
    Hcloud::Client.new(
      token: opts.fetch(:api_token),
      auto_pagination: true
    ).servers.map do |s|
      s.public_net['ipv4']['ip']
    end
  end

  def task(opts = {})
    { value: resolve_reference(opts) }
  end
end

HetznerInventory.run if $PROGRAM_NAME == __FILE__
