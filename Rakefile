task :default do
  %w(common master agent).each do |dir|
    sh "cd #{dir} && rake"
  end
end
