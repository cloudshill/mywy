# coding: utf-8
require "bundler/capistrano"
require 'puma/capistrano'

set :application, 'mywy'
set :repo_url, 'git://github.com/85636682/mywy.git'
set :branch, "master"
set :scm, :git
set :user, "stephen"

set :deploy_to, '/www/#{application}'

set :pty, true

set :git_shallow_clone, 1
set :puma_role, :app
set :puma_config_file, "config/puma.rb"

role :web, "106.186.17.79"                          # Your HTTP server, Apache/etc
role :app, "106.186.17.79"                          # This may be the same as your `Web` server
role :db,  "106.186.17.79", :primary => true # This is where Rails migrations will run

set :password do Capistrano::CLI.password_prompt('SSH Password:') end

task :migrate_database, :roles => :web do
  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:migrate"
end

after "deploy:finalize_update","deploy:symlink", :migrate_database