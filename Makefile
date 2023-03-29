EMAIL=$(USER)@invitae.com

playground.html : playground.md
	mark --compile-only -f playground.md > playground.html
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	mark -u $(EMAIL) -p $$PASS -b https://invitae.jira.com/wiki -f playground.md

diff:
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	curl -u $(EMAIL):$$PASS https://invitae.jira.com/wiki/rest/api/content/36812657343\?expand=body.storage | jq -r .body.storage.value > /tmp/playground.html
	diff -w /tmp/playground.html .
	pandoc -f html -o /tmp/playground.md /tmp/playground.html
