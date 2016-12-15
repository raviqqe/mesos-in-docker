%i(build push).each do |target|
  task target do
    sh "cd docker_images && rake #{target}"
  end
end
