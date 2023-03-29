Playing around with writing docs in Markdown.

https://github.com/kovetskiy/mark turns markdown into html and uploads to confluence.

Can view HTML of the pages and save them and then use pandoc to convert back to markdown.

```
pandoc -f html -o playground.md playground.html
```
