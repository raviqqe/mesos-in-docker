require 'resolv'

require_relative 'docker-rake-tasks/docker'
require_relative '../config'


def docker_tasks name, run_options='', &block
  DockerTasks.new('raviqqe', 'Yota Toyama <raviqqe@gmail.com>', 'ubuntu')
      .create name, run_options, &block
end

def hostname_to_ip hostname
  Resolv::Hosts.new().getaddress hostname
end

def hostname_to_pair hostname
  [hostname, hostname_to_ip(hostname)]
end

DOCKER_HOSTS_OPTION = [*MASTERS, *AGENTS].map(&method(:hostname_to_pair))
                                         .map do |h, ip|
  "--add-host #{h}:#{ip}"
end.join ' '
