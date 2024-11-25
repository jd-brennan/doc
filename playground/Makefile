EMAIL=$(USER)@invitae.com
URL=https://invitae.jira.com/wiki
MARK=$(shell which mark)

.PHONY: publish diff mark

# Push the current markdown version to Confluence
publish : playground.md mark
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	mark --mermaid-provider mermaid-go -u $(EMAIL) -p $$PASS -b $(URL) -f playground.md

# Diff the current Confluence version with the current markdown version (check for manual changes)
diff: playground.md mark
	mark --compile-only -f playground.md > playground.html
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	curl -u $(EMAIL):$$PASS $(URL)/rest/api/content/36812657343\?expand=body.storage | jq -r .body.storage.value > /tmp/playground.html
	diff /tmp/playground.html .

mark:
ifeq ($(MARK),)
	@echo Installing mark...
	brew tap kovetskiy/mark
	brew install mark
endif
	@echo Using mark $(shell mark -v)
