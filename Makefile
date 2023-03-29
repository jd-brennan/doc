confu:
	export PASS=`grep -A 2 jira ~/.netrc | awk '/password/ {print $$2}'` && \
	mark --debug -u $(USER)@invitae.com -p $$PASS -b https://invitae.jira.com/wiki -f playground.md
