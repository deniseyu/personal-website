This is the git repo for my personal website, at [deniseyu.io](http://deniseyu.io).

All images are licensed under Creative Commons BY-SA, which means that you may
freely use them for non-commercial purposes, as long as you provide attribution.
I am happy for you to use them in your conference talks, event info pages, open source projects,
etc. - but you *must* put "By Denise Yu" or "by @deniseyu21" somewhere logically
connected to where it is posted!

You do not have to seek my permission for each usage, but if you want, tag me on [Twitter](https://twitter.com/deniseyu21)
because I'm curious about how people are using them :-D

### Notes to myself for running this thing

This isn't really an open source project. The source code is here because there's nothing sensitive, but it's not designed to be forked and run by anyone other than me because the credentials are hard-coded.

Install Ruby and run `rackup`. If need to work on the `/art` page, export the following environment variables (they are in lastpass):

```
export gcloud_credentials=$GCLOUD_CREDENTIALS
export project_id=$PROJECT_ID
export bucket_name=$BUCKET_NAME
```
