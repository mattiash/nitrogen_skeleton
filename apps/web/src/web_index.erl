-module (web_index).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       common:assert_path( #template { file=code:priv_dir(web) ++ "/templates/grid.html" } ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    #container_12 { body=[
        #grid_12 { class=header, body=common:header(index) },
        #grid_clear {},

        #grid_12 { body="Welcome to Nitrogen" },
        #grid_clear {},

        #grid_12 { body=common:footer() }
    ] }.
