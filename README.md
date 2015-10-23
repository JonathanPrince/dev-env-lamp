# LAMP Development Environment

Starting point for quickly setting up a basic LAMP dev environment. Uses Vagrant and Puppet to setup the LAMP stack.

## Setup

1. Clone this repo, rename containing folder with project name, delete .git folder.
2. Create `./www` folder, the contents of this folder will be synced with the apache document root.
3. Database setup sql in `./db.sql`
4. Run `vagrant up`
