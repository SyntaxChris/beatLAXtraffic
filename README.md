[experience flow map](http://gxle8i.axshare.com/#p=web_user_flow_with_updated_visuals)

creating an admin user from the Ruby console:

`Admin.new({email: "addresss@domain.tld", password: "password", password_confirmation: "password"}).save(validate: false)`

Version
----
Version.Goes Here

----
[Postgres.app](http://www.postgresql.org/download/macosx/)

[rvm - ruby version manager](http://railsapps.github.io/installrubyonrails-mac.html)
* Also linked below (Installation (Mac OS)

Installation (Mac OS)
---

[Click here for detailed and up to date steps on preparing your computer and installing Ruby and Rails](http://railsapps.github.io/installrubyonrails-mac.html)
* This site runs you through installing XCode, XCode command line tools, and how to configure Git prior to installing Rubby and Rails
* Some steps from this site are also included below (Install Ruby 2.1.3 and Set up Rubygems and Rails)
* Also linked above (rvm)


NOTE: It is advisable to copy and paste commands into the command lines to help avoid errors

### Install Ruby 2.1.1
```sh
rvm get stable --autolibs=enable
CC=clang rvm install 2.1.1 --disable-binary
rvm install ruby
rvm --default use ruby-2.1.1
```

### Set up Rubygems and Rails
```sh
gem update --system
echo "gem: --no-document" >> ~/.gemrc
rvm gemset use global
gem update
gem install nokogiri
```

### Create a Workspace

If you are using the gitHub app then simply click the '+' in the upper right hand corner, then clone, then lawa. Then select where you want to save the workspace and it will be created and the project will be cloned into it. By doing this you can skip "Clone the repo" segment below.

If not using the gitHub app:
```sh
Create a directory (ex:lawa) to clone the repositorty to
* Advisable to save it in a place such as Sites (the /local/path would be ~/Sites/lawa - the same applies where /local/path appears below)
```

### Clone the repo
and do basic setup

```sh
cd /local/path
git clone https://github.com/dopa/lawa.git
cd lawa
rvm use ruby-2.1.1@myapp --ruby-version --create
mkdir tmp
touch tmp/restart.txt
bundle
```

**NOTE:** Potential error - if not copied correctly your .ruby-gemset, and .ruby-version file in /local/path/ will be incorrect and may have duplicates (with a number appended to the file name). Here is a fix for this issue:

Copy into .ruby-gemset
```sh
lawa
```
Copy into .ruby-version
```sh
ruby-2.1.1
```
The above to be copied may also exist in the duplicate files

### Install Redis and Memcached
```sh
brew install redis
brew install memcached
```

### Set up the Database
```sh
psql
CREATE USER lawa WITH PASSWORD 'my_password';
ALTER USER lawa CREATEDB;
ALTER ROLE lawa SUPERUSER;
CREATE EXTENSION hstore;
\q
```
```sh
rake db:create
```
Prep to run lawa
---

Start rails server
```sh
cd /local/path
bin/rails server
```

Fire it up
---

Visit localhost:3000

---

When it's time to upgrade Ruby / Rails
---
```sh
update Gemfile to new versions of ruby and rails
rvm get stable --autolibs=enable
rvm install ruby
rvm use --default (latest verion)
cd /path/to/lawa
```
or if already there, cd .. and then cd livecube to pick up new ruby version
```sh
update .ruby-version to new version number
rvm gemset use lawa
gem install rake
bundle update rails
bundle
brew upgrade memcached 
```
Follow instructions to reload it

```sh
brew upgrade redis
touch tmp/restart.txt
```
Follow instructions to reload it


[@justinschier]:http://twitter.com/justinschier

