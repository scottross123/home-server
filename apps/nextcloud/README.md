# Nextcloud AIO

**NOTE** this only works on https, so go to **https://**server.ipv4.address:8080 to set everything up.

I needed to add  `SKIP_DOMAIN_VALIDATION=true` as an environment variable to skip domain evalidation so I could get this working with a domaining pointing at my server's local ip address. If your setup is like mine this will be necessary.

## Collabora / Nextcloud Office 

For the life of me I could not get the Collabora container that come with Nextcloud AIO to work. I followed the documentation for a reverse proxy setup with Nginx Proxy Manager, enabled websockets, followed the reccommendations in [this](https://github.com/nextcloud/all-in-one/discussions/1358) GitHub discussion from the lead developer, but still got the same sockets error trying to open any office documen tin Nextcloud.

After hours trying to figure this out the solution ended up being to give up on the collabora container that comes with Nextcloud AIO and setup a separate collabora/code container in the same stack. I disabled Collabora in the Nextcloud AIO interface, added the collabora/code container to my compose file, setup a proxy host in NPM for Collabora with websockets enabled, installed the Nextcloud Office app on my Nextcloud instance and configured it to use the Collabora container I setup outside of Nextcloud AIO. Then everything worked perfectly.

I am confident I had setup everything correctly with Nextcloud AIO but can not be certain this is due to a bug or me just being an idiot user. However, if you are having issues with Nextcloud Office and Collabora I reccomend not wasting as much time as me and just disabling the Nextcloud AIO Collabora container and setting up a Collabora container outside of AIO and using that instead.

There might be similar issues with Nextcloud Talk since that also relies on websockets, but I have not tested it. I have bothered to setup Nextcloud Talk because I do not need it.
