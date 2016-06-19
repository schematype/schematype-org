JEKYLL_LOCAL_HOST ?= 127.0.0.1
JEKYLL_LOCAL_PORT ?= 4000
DESTINATION := www.schematype.org

build: $(DESTINATION)
	jekyll $@

$(DESTINATION):
	git clone --branch=gh-pages \
	    git@github.com:schematype/schematype-org $(DESTINATION)

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
	kill `cat .server.pid`
	rm .server.pid

publish: build
	( \
	    cd $(DESTINATION); \
	    git add -A .; \
	    git commit --amend --no-edit; \
	    git push --force origin gh-pages; \
	)

open:
	open http://127.0.0.1:4000/
