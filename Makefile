# REPO ?= nkdist

.PHONY: release dev

all: compile

compile: ; @rebar3 compile

clean: ; @rebar3 clean

distclean: ; @rebar3 clean -a

tests: eunit

# eunit: export ERL_FLAGS = -config test/app.config -args_file test/vm.args
eunit: ; @rebar3 eunit

# shell:
#	erl -config util/shell_app.config -args_file util/shell_vm.args -s nkdist_app

docs: ; @rebar3 edoc

dev%: export NAME                 = $@@127.0.0.1
dev%: export RELX_REPLACE_OS_VARS = true
dev%: ; @rebar3 as $@ run

dialyzer: ; @rebar3 dialyzer
