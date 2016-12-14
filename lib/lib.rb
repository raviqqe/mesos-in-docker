require_relative "docker-rake-tasks/docker"


def docker_tasks name, run_options='', &block
  DockerTasks.new("raviqqe", "Yota Toyama <raviqqe@gmail.com>", "ubuntu")
      .create name, run_options, &block
end
