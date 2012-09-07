require 'bundler/capistrano'
require "rvm/capistrano"
#require 'capistrano/ext/multistage'

load 'deploy/assets'

# set :stages, %w(production staging)
# set :default_stage, :staging

set :rvm_ruby_string, '1.9.3@hm'

set :application, :hm
set :scm, :git

set :deploy_to, "/var/www/apps/#{application}"

set :repository,  "git@github.com:allika/hm.git"

set :deploy_via, :copy
set :copy_strategy, :export

set :use_sudo, false

set :branch, 'master'
set :user, 'rails'

server 'dev.anahoret.com', :app, :web, :db, :primary => true

#before 'deploy:create_symlink', 'deploy:ckeditor:symlink'

namespace :deploy do

  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  # namespace :assets do
  #   task :precompile, :roles => :web, :except => { :no_release => true } do
  #     from = source.next_revision(current_revision)
  #     if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #     else
  #       logger.info "Skipping asset pre-compilation because there were no asset changes"
  #     end
  #   end
  # end

end

