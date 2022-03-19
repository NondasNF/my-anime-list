# About the project

A challenge of developing a system that registers several anime titles and gives the user the option to follow and favorite as many animes as the user wants.

User management is separated into two roles, normal user (most of the code just called user) and an admin user, the different roles have different access levels throughout the application

When you enter the site you can see the complete anime catalog, but you must be registered to follow and favorite the anime

The different levels or accesses consist of:

Admin:

    - Manage all users, it can delete or give a user admin privilege
    - Manage animes, he can create, read, update and delete any anime
User:

    - Follow and favorite animes, when he favorite an unfollowed anime, he follows automatically
    - Unfollow and Unfavorite animes, when he unfollows an anime he is automatically unfavorited
    - See all followed
    - View all favorites

### My opinion:
I found it incredibly interesting, I spent a lot of time planning my starting point and my initial steps for the best development. While I was doing it I discovered several things I didn't know about Rails and trying to apply them

# Dependencies

Ruby v"3.0.0" 

Rails v"6.1.5"

# Installation

To download all dependencies type in a terminal root project directory type the command:
~~~
$ bundle install
~~~
Sometimes webpacker may crash after bundle install, in these cases it is recommended to use this command:
~~~
$ bundle exec rake webpacker:install
~~~
Next step, to set migrations from the currently configured migrations directory, use:
~~~
$ rails db:migrate
~~~
Finilly to excetute the server on your browser at http://localhost:3000/, use:
~~~
$ rails s
~~~
# Configuration
Now you need to register on the site, go to the "Sign Up" option in the navigation bar or http://localhost:3000/users/sign_up

Create your account with your email and password

Back to your terminal and type:
~~~
$ rails c
~~~
The console command lets you interact with your Rails application from the command line

We need to make your account an admin user to add anime to the app

~~~
> user = User.first
> user.admin = true
> user.save
~~~
With these commands you used the account that was created by you before is now an administrator of the application

Now go to your browser in http://localhost:3000/animes/new
And add as many animes you want to add

Finally, after all this the app is ready, you can create other normal users and use the features of my-anime-list

### __Working on:__
Unit tests to improve the future development

Implementation of a gem to manage users roles, like Cancan or Pundit

Improve bootstrap o all pages
