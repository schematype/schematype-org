export PATH := $(PATH)
export PWD := $(PWD)

JEKYLL_LOCAL_HOST ?= 127.0.0.1
JEKYLL_LOCAL_PORT ?= 4000
DESTINATION := www.schematype.org

build: $(DESTINATION) $(DESTINATION)/.git try
	jekyll $@

$(DESTINATION):
	git clone --branch=gh-pages \
	    git@github.com:schematype/schematype-org $(DESTINATION)

$(DESTINATION)/.git:
	@echo 'You are in a bad state'
	@echo "Delete $(DESTINATION); run 'make stop' and try again"
	@exit 1

open:
	open http://127.0.0.1:4000/

restart: stop start

start:
	@[ ! -f .server.pid ] || { echo 'already running'; exit 1; }
	jekyll serve \
		--host=$(JEKYLL_LOCAL_HOST) \
		--port=$(JEKYLL_LOCAL_PORT) \
		--watch \
			2>&1 > .server.log & \
	    echo $$! > .server.pid

stop:
	@[ -f .server.pid ] || exit 1
	kill -9 `cat .server.pid`
	rm .server.pid

show:
	@[ ! -f .server.pid ] || echo "Running pid $$(cat .server.pid)"
	@ps aux | grep jekyll | grep -v grep || true

try:
	make -C ./editor dist-dir
	rm -fr $@
	mv ./editor/schematype-editor $@

publish: build
	( \
	    cd $(DESTINATION); \
	    git add -A .; \
	    git commit --amend --no-edit; \
	    git push --force origin gh-pages; \
	)
