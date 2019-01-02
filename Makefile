.PHONY: build pre folder clean variables dockerCompose apacheConf createImportDb createSwitchToLocal db info addHost post up macNfsSetup down restartDocker

build: pre variables folder dockerCompose apacheConf createImportDb createSwitchToLocal addHost post

pre:
	@./scripts/pre.sh

clean:
	@sudo ./scripts/clean.sh

variables:
	@./scripts/variables.sh

folder:
	@./scripts/folder.sh

dockerCompose:
	@./scripts/dockerCompose.sh

apacheConf:
	@./scripts/apacheConf.sh

createImportDb:
	@./scripts/createImportDb.sh

createSwitchToLocal:
	@./scripts/createSwitchToLocal.sh

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

down:
	@./scripts/down.sh

bashDb:
	@./scripts/bashDb.sh

bashWeb:
	@./scripts/bashWeb.sh

macNfsSetup:
	@./scripts/macNfsSetup.sh

restartDocker:
	@./scripts/restartDocker.sh
	@./scripts/up.sh



