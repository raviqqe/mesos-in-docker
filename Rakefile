  %i(build push).each do |target|
    task target do
      %w(common master agent).each do |dir|
        sh "cd #{dir} && rake #{target}"
      end
    end
  end
