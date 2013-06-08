class Rumbambar::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def add_engine_route
    route("mount Rumbambar::Engine => '/rumba'")
  end

  def add_initializer
    generate('devise:install')
    rake('rumbambar:install:migrations')
    copy_file 'rumba_user.rb', 'app/models/rumba_user.rb'
    copy_file 'rumbambar.js', 'app/assets/javascripts/rumbambar.js'
    copy_file 'rumbambar.css', 'app/assets/stylesheets/rumbambar.css'
  end

  def create_first_user
    email = ask('Please, provider first user email [user@example.com]:', color: 'green')
    pass = ask('Provide password for this user (minimum is 8 characters):')
    open(File.join(Rails.root, 'db', 'seeds.rb'), 'a') do |f|
      f.puts "RumbaUser.create(email: '#{email}', password: '#{pass}')"
    end
    say 'Please, review changes, migrate and seed DB'
  end
end
