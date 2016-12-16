require_relative './config'



TMP_DIR = 'tmp'


def hostnames_to_ansible_lines hostnames
  hostnames.map do |hostname|
    "#{hostname} ansible_user=#{ANSIBLE_USER}"
  end
end


%i(build push).each do |target|
  task target do
    sh "cd docker_images && rake #{target}"
  end
end


task :deploy do
  mkdir_p TMP_DIR
  hosts_file = File.join TMP_DIR, 'hosts'

  File.write hosts_file, [
    '[master]',
    *hostnames_to_ansible_lines(MASTERS),
    '[agent]',
    *hostnames_to_ansible_lines(AGENTS),
  ].join("\n")

  sh "ansible-playbook --ask-become-pass -i #{hosts_file} main.yml"
end


task :default => [:push, :deploy]
