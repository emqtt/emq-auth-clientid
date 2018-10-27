PROJECT = emqx_auth_clientid
PROJECT_DESCRIPTION = EMQ X Authentication with ClientId/Password
PROJECT_VERSION = 3.0

BUILD_DEPS = emqx cuttlefish
dep_emqx = git https://github.com/emqtt/emqttd emqx30
dep_cuttlefish = git https://github.com/emqx/cuttlefish emqx30

NO_AUTOPATCH = cuttlefish

ERLC_OPTS += +debug_info

TEST_ERLC_OPTS += +debug_info

COVER = true

include erlang.mk

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_auth_clientid.conf -i priv/emqx_auth_clientid.schema -d data

