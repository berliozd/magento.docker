.PHONY: build pre clean variables dockerCompose apacheConf createImportDb db info addHost post up

build: pre clean variables dockerCompose apacheConf createImportDb addHost post

pre:
	@./scripts/pre.sh

clean:
	@sudo ./scripts/clean.sh

variables:
	@./scripts/variables.sh

dockerCompose:
	@./scripts/dockerCompose.sh

apacheConf:
	@./scripts/apacheConf.sh

createImportDb:
	@./scripts/createImportDb.sh

db:
	@./scripts/db.sh

info:
	@./scripts/info.sh

addHost:
	@sudo ./scripts/addHost.sh

post:
	@./scripts/post.sh

up:
	@./scripts/up.sh

bashDb:
	@./scripts/bashDb.sh

bashWeb:
	@./scripts/bashWeb.sh


