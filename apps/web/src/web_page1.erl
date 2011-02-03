-module (web_page1).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).
            
main() ->
       web_common:assert_path( "grid.html" ).

title() -> "Nitrogen Web Framework for Erlang".

layout() ->
    #container_12 { body=[
        #grid_12 { class=header, body=web_common:header(page1) },
        #grid_clear {},

        #grid_12 { body="Page 1" },
        #grid_clear {},

        #grid_12 { body=web_common:footer() }
    ]}.
