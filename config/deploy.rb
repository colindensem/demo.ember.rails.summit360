# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'summit360_api'
set :repo_url, 'git@bitbucket.org:summit360/summit360-api.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :bundle_flags, '--deployment --quiet'

set :rbenv_ruby, '2.1.2'
set :rbenv_type, :user
set :rbenv_custom_path, '/home/colind/.rbenv'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value



# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{.rbenv-vars config/database.yml}

set :unicorn_config_path, "config/unicorn.rb"

set :linked_dirs, %w{tmp/pids}

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

