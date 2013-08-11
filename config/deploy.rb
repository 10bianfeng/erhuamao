
require "rvm/capistrano"
require "bundler/capistrano"

set :application, "erhuamao"
set :repository,  "git@github.com:cmingxu/erhuamao.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "42.96.184.101"                          # Your HTTP server, Apache/etc
role :app, "42.96.184.101"                          # This may be the same as your `Web` server
role :db,  "42.96.184.101", :primary => true # This is where Rails migrations will run
role :db,  "42.96.184.101"

set :user, "deploy"
set :password, "erhuamao8"

set :use_sudo, false

set :deploy_to, "/home/deploy/code/#{application}"

default_run_options[:pty] = true
set :rvm_ruby_string,  "ruby-1.9.2-p320"
#set :rvm_type, :user
set :rvm_bin_path, "/home/deploy/.rvm/bin"



namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end


  task :start do
    sudo "/opt/nginx/sbin/nginx"
  end

  task :stop do
    sudo "/opt/nginx/sbin/nginx -s stop"
  end

  task :update_bundle do
    run "cd #{release_path} && bundle install"
  end
end

after "deploy:symlink" do
  run "chmod -R 0666 #{current_path}/log"
end

namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "cp -f #{release_path}/config/database.template #{release_path}/config/database.yml"
    run "cat #{release_path}/config/database.yml"
  end
end

after "deploy:update_code", "db:db_config", "deploy:update_bundle", "deploy:migrate"


before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'


