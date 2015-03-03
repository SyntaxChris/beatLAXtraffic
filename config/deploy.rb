require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :repository, 'git@github.com:dopa/lawa.git'

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'log']

# Optional settings:
set :user, 'deploy'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
set :forward_agent, true     # SSH forward_agent.
set :term_mode, nil

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.1.5@lawa]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'."]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/secrets.yml'."]
end

# mina staging deploy
task :staging do
  set :rails_env, 'staging'
  set :deploy_to, '/var/www/lawa_staging'
  set :domain, 'staging.dopa.mn'
  set :port, '22'
  set :branch, 'staging'
  set :deployed_string, "curl -X POST --data-urlencode 'payload={\"channel\": \"#lawa\", \"username\": \"Disapproving Deploy Bot\", \"text\": \"Lawa Staging deployed.\", \"icon_emoji\": \":monocle:\"}' https://hooks.slack.com/services/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"
end

# mina production deploy
task :production do
  set :rails_env, 'production'
  set :deploy_to, '/var/www/lawa_production'
  set :domain, 'beatlaxtraffic.com'
  set :branch, 'production'
  set :deployed_string, "curl -X POST --data-urlencode 'payload={\"channel\": \"#lawa\", \"username\": \"Disapproving Deploy Bot\", \"text\": \"Lawa Production deployed.\", \"icon_emoji\": \":monocle:\"}' https://hooks.slack.com/services/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"
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    # queue %[cd #{deploy_to}/current; bundle exec rake cache:clear]

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      queue "#{deployed_string}"
    end
  end
end

task :populate => :environment do
  populate do
    queue %[cd #{deploy_to}/current; bundle exec rake populate:create_nodes]
    queue %[cd #{deploy_to}/current; bundle exec rake cache:clear]
  end
end

task :clear_cache => :environment do
  clear_cache do
    queue %[cd #{deploy_to}/current; bundle exec rake cache:clear]
  end
end



set :ports, %w[40801 40802 40803 40804]

desc "Sets up multiple servers."
task :multi_setup do
  isolate do
    ports.each do |p|
      set :port, p
      invoke :setup
      run!
    end
  end
end

desc "Deploys to multiple servers."
task :multi_deploy do
  isolate do
    ports.each do |p|
      set :port, p
      invoke :deploy
      run!
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

