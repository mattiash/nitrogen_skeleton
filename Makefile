all: get-deps compile

get-deps:
	./rebar get-deps

compile:
	./rebar compile
	(cd apps/web/priv/static; rm -rf nitrogen; mkdir nitrogen; cp -r ../../../../deps/nitrogen_core/www/* nitrogen)

clean:
	./rebar clean
	(cd apps/web/priv/static; rm -rf nitrogen)

# web depends on myapp in web.src, but apparently this doesn't
# mean that myapp is started. Maybe this works if we do a proper release?
run:
	erl -pa apps/*/ebin ./deps/*/ebin ./deps/*/include \
	-name nitrogen@127.0.0.1 \
	-eval "application:start(myapp), application:start(web)."
