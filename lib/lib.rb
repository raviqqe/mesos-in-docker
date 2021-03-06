require 'resolv'

require_relative 'docker-rake-tasks/docker'
require_relative '../config'


def docker_tasks name, run_options='', &block
  DockerTasks.new(DOCKER_USER, MAINTAINER, 'ubuntu')
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


def ports_to_option ports
  ports.map{ |port| "-p #{port}:#{port}" }.join ' '
end


def yum_install *packages
  'yum -y update && yum -y upgrade && yum -y install ' + packages.join(' ') + ' && yum -y clean all'
end
