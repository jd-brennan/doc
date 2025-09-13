EMAIL=$(USER)@invitae.com
URL=https://invitae.jira.com/wiki
MARK=$(shell which mark)

.PHONY: publish diff mark

# Push the current markdown version to Confluence
publish : tdd.md mark
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	mark --mermaid-provider mermaid-go -u $(EMAIL) -p $$PASS -b $(URL) -f tdd.md

# Diff the current Confluence version with the current markdown version (check for manual changes)
diff: tdd.md mark
	mark --compile-only -f tdd.md > tdd.html
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	curl -u $(EMAIL):$$PASS $(URL)/rest/api/content/37862309892\?expand=body.storage | jq -r .body.storage.value > /tmp/tdd.html
	diff /tmp/tdd.html .

mark:
ifeq ($(MARK),)
	@echo Installing mark...
	brew tap kovetskiy/mark
	brew install mark
endif
	@echo Using mark $(shell mark -v)

# nvm use default
# npm install -g @mermaid-js/mermaid-cli
diagrams:
	mmdc -i tdd.md -o tdd.png -H 1024 -w 768 
