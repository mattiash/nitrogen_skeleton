nitrogen_skeleton
=================

This is a skeleton for a nitrogen project.

You can clone this and run it locally to have a starting-point for
your own nitrogen projects.

The skeleton was derived from 

https://github.com/nitrogen/NitrogenProject.com

Look there for more extensive examples.

The skeleton includes two simple webpages and an extra application
to show how to integrate other erlang applications with nitrogen.
The skeleton uses rebar for dependency handling and compilation.

Getting started
---------------

To get started, simply clone this repository and then:

    make
    make run

    open http://localhost:8000

Extending
---------

To create a new page, you need to 

1. create a file src/web_<pagename>.erl file (copy web_page1.erl)
2. edit src/common.erl (add it to the menu)
3. edit src/nitrogen_website_sup.erl (add it to routes()).

To add a new application

1. Copy apps/myapp to apps/mynewapp and edit the files accordingly.
2. Edit rebar.config and add apps/mynewapp to sub_dirs
3. Start the application from the Makefile (Is this the "proper" way
   of starting the application?).

Have fun!

Mattias Holmlund