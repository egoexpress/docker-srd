# docker-srk

This Docker image contains the required files and dependencies for running [sifttter-redux-known](https://github.com/egoexpress/sifttter-redux-known), a client to push your 'daily social journey' to your [Known](https://www.withknown.com) instance.

It also configures a cron job that will be run at 2AM every day. This job creates a journal entry for the previous day and post it on your Known site.
