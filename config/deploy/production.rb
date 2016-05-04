set :deploy_to, "/sites/capistrano_example"

server 'carve.io', user: 'davzie', roles: %w{web app db}