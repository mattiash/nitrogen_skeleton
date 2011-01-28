all: get-deps compile

get-deps:
	./rebar get-deps

compile:
	./rebar compile
	(cd static; rm -rf nitrogen; mkdir nitrogen; cp -r ../deps/nitrogen_core/www/* nitrogen)

clean:
	./rebar clean
	(cd static; rm -rf nitrogen)

run:
	erl -pa apps/*/ebin ./deps/*/ebin ./deps/*/include \
	-name nitrogen@127.0.0.1 \
	-eval "application:start(myapp), application:start(nitrogen_website)."
