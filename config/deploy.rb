# config valid only for Capistrano 3.1
# require 'capistrano/ext/multistage'
lock '3.11.0'

set :stages, ["production"]
set :default_stage, "production"
#set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'git@github.com:tarurata/capistrano-example.git'
set :user, "wata"

# Put files which you do not want it to be overwritten when deploy.
# When deploy, make symbolic link to directries under this directory.
# In Capistrano2 this var is called shared_children. In Capistrano3 this var is called linked_dirs.
set :linked_dirs, %w(my_shared_directory)

namespace :deploy do


    desc 'Print The Server Name'
    task :print_server_name do
      on roles(:app), in: :groups, limit:1 do
        execute "hostname"
        execute "echo Thisistest"
      end
    end

end

after "deploy:updated", "deploy:print_server_name"
