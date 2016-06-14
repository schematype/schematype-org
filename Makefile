build:
	jekyll $@

start:
	@[[ ! -f .server.pid ]] || { echo 'already running'; exit 1; }
	jekyll serve --watch &> .server.log & \
	    echo $$! > .server.pid

stop:
	@[[ -f .server.pid ]] || exit 1
	kill `cat .server.pid`
	rm .server.pid

publish: build
	( \
	    cd _site; \
	    git add -A .; \
	    git commit --amend --no-edit; \
	    git push --force origin gh-pages; \
	)

open:
	open http://127.0.0.1:4000/
