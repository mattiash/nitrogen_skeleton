% Copyright 2010, Scatterbit, Inc. & Jayson Vantuyl <jvantuyl@scatterbit.com>
%
% Support module for starting application with erlctl.
% See https://github.com/jvantuyl/erlctl
-module (myapp_cli).
-import(erlctl,[format/1,format/2,exit_with_code/1,server_exit/0]).
-compile(export_all).

%% @doc Helper Function for Usage Information
usage() ->
  Opts =   erlctl:get_opts(),
  App =    proplists:get_value(app,Opts),
  Script = proplists:get_value(script,Opts),
  [
    {"Usage for ~s:",[App]},
    {"  ~s <command> ...",[Script]},
     "",
     "Commands:",
    {"  start             start the ~s daemon",[App]},
    {"  stop              stop the ~s daemon",[App]},
    {"  restart           restart the ~s daemon",[App]},
     "  version [remote]  display version info (remote runs in server)"
  ].

%% @doc Prints out help for the application
help(always,[]) ->
  lists:foreach(
    fun
      ({E,D}) ->
        format(E ++ "~n",D);
      (E) ->
        format(E ++ "~n",[])
    end,
    usage()
  ),
  ok.

%% @doc Prints out the installed version of the ctl_ex server.
version(not_running,["remote"]) ->
  {error,1,"Not running."};
version(running,["remote"]) ->
  {ok,"Version: ~p (~s) @ ~p",[0.1,erlang:system_info(otp_release),node()]};
version(always,[]) ->
  {ok,"Version: ~p (~s) @ ~p",[0.1,erlang:system_info(otp_release),node()]}.

%% @doc Start the ctl_ex application.
start(running,_) ->
  {error,1,"Already running."};
start(not_running,[]) ->
  {start,[],"Starting."};
start(started,[]) ->
  ok = application:start(myapp),
  ok = application:start(web),
  erlctl:format("Started!~n",[]),
  ok.

%% @doc Stop the ctl_ex application.
stop(not_running,[]) ->
  {ok,"Not running."};
stop(running,[]) ->
  application:stop(web),
  application:stop(myapp),
  format("Stopping.~n"),
  server_exit(),
  ok.

%% @doc Restart the ctl_ex application
restart(not_running,X) ->
  start(not_running,X);
restart(running,X) ->
  stop(running,X),
  {restart,[],"Restarting..."};
restart(started,X) ->
  start(started,X).
