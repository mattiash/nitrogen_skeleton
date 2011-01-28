-module (web_page1).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       common:assert_path( #template { file="./templates/grid.html" } ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    #container_12 { body=[
        #grid_12 { class=header, body=common:header(page1) },
        #grid_clear {},

        #grid_12 { body="Page 1" },
        #grid_clear {},

        #grid_12 { body=common:footer() }
    ]}.
