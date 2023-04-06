REMOTEUSER ?= clyde
HOST ?= crunch.stat.duke.edu
DIR ?= /web/isds/docs/courses/Spring23/sta790.03
REMOTE ?= $(REMOTEUSER)@$(HOST):$(DIR)

.PHONY: clean
clean:
	rm -rf docs/*

404:
	cp .htaccess docs/.htaccess

remote: 404
#	cp config.toml-remote config.toml

push: remote
# cp favicon.ico docs/
	rsync -azv --delete  --exclude='.DS_Store'  docs/ $(REMOTE)

unbind:
	lsof -wni tcp:4000

serve:
	hugo server --watch
