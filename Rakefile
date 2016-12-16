%i(build push).each do |target|
  task target do
    sh "cd docker_images && rake #{target}"
  end
end


task :deploy do
  sh 'cd ansible && rake'
end


task :default => [:push, :deploy]
