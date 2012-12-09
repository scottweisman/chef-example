# Chef example

## This is an example of a simple chef setup based on http://railscasts.com/episodes/339-chef-solo-basics.

Log in to your server

    $ ssh root@0.0.0.0

Run this script from rbates

    $ curl -L https://raw.github.com/gist/4242008/4c47ed1d4cd6919a6dcaa702571c09b30499c348/chef_solo_bootstrap.sh | bash

Create directory for chef

    $ mkdir /var/chef
    $ cd /var/chef

create directory for recipes

    $ mkdir -p cookbooks/main/recipes

create default recipe

    $ nano cookbooks/main/recipes/default.rb

Add paths to solo.rb

    $ nano solo.rb

    cookbook_path File.expand_path("../cookbooks", __FILE__)
    json_attribs File.expand_path("../node.json", __FILE__)


    $ nano node.json

    {
      "run_list": ["recipe[main]"]
    }


    $ chef-solo -c solo.rb

Move chef files to local machine

    $ scp -r root@208.68.38.41:/var/chef .


Rsync changes back to server

    $ rsync -r . root@208.68.38.41:/var/chef

Run chef on server

    $ ssh root@0.0.0.0 "chef-solo -c /var/chef/solo.rb"

Download latest version of nginx
http://community.opscode.com/cookbooks/nginx

Look at metadata.rb

Download any software that have "depends"
Add them to your cookbooks
