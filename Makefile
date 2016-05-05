PROJECT_DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

all:
	@rebar3 compile

clean:
	@rebar3 clean
	@find $(PROJECT_DIR)/. -name "erl_crash\.dump" | xargs rm -f

dialyze:
	@rebar3 dialyzer

tests: all
	ct_run -dir $(PROJECT_DIR)/test -logdir $(PROJECT_DIR)/test/results \
	-pa `rebar3 path`
