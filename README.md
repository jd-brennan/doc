# Overview

Playing around with writing docs in Markdown.

https://github.com/kovetskiy/mark turns markdown into html and uploads to confluence.

Can view HTML of the pages and save them and then use pandoc to convert back to markdown.

```
pandoc -f html -o playground.md playground.html
```

Converting back to markdown doesn't really work because of Confluence macros.

# Notes

To get mermaid to work, I built this fork or mark: https://github.com/dreampuf/mark

# Setup

If you want push changes to Confluence:

1. Create a Jira/Confluence API token

Goto https://id.atlassian.com/manage-profile/security/api-tokens and click the Create API Token button

2. Put the token in your $HOME/.netrc

Create $HOME/.netrc if needed.

Add an entry for jira with your token:

```
machine invitae.jira.com
  login (NOT USED - but you can put your email address here)
  password (YOUR TOKEN HERE)
```

## Usage

To push the latest changes from the current directory to Confluence:

```make publish```

To check if there are any differences in Confluence created manually by a Confluence user:

```make diff```
