# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}


# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/user_name/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }
set :application, 'diamond'
set :stage, :production
set :repo_url, 'git@github.com:chany229/diamondver1.git'
set :branch, 'master'

set :rails_env, 'production'

set :rvm_type, :system
set :rvm_ruby_version, '2.7.0'
set :rvm_roles, [:app, :web, :db]

set :keep_releases, 5


set :full_app_name, "#{fetch(:application)}"
set :server_name, "103.146.230.196"

set :deploy_user, "root"
set :deploy_to, "/www/diamond"

server "#{fetch(:server_name)}", user: "#{fetch(:deploy_user)}", roles: [:app, :web, :db]

set :ssh_options, {
    forward_agent: true, #
    auth_methods: %w(publickey password)
}

# set :whenever_command, [:bundle, :exec, :whenever]
# set :whenever_environment, :ms

set :linked_files, %w{config/database.yml config/master.key puma.rb}
set :linked_dirs, %w{tmp/pids tmp/sockets log storage}

set :nginx_server_name, "shifangliushi.site 103.146.230.196 toyotomi60.site sixt60.site chany229.site"