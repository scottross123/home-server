# Servarr Network

All my Arr's

## References

- [WikiArr](https://wiki.servarr.com)
- [WikiArr Docker Guide](https://wiki.servarr.com/en/docker-guide)

## Todo

- i should use multiple users for each container and do other things to harden docker security
    - run rootless please
- set permissions of data folder in radarr back to drwxr-xr-x 
- maybe remove calibre?

## Migration to Swarm

Turns out trying to do something as simple a route a container's traffic through a vpn is really fucking hard in swarm. Everything else about swarm was nice but this was the major gotcha I ran into. Swarm services do not have `NET_CAP` capbailities so gluetun doesn't work, I tried using `swarm-launcher` as wrapper for gluetun which gives it access to options availabile to docker compose services but not docker swarm, but then it doesn't work with docker swarm secrets. There is little help online for this specific use-case other than using a .env file which I really did not want to do since Ijust moved all secrets off of .env files and into a proper secret manager. So fuck it, I give up, I'm just keeping the VPN clients off of swarm.

I had no plans to switch over to Kubernetes if Docker Swarm worked well enoug but it turns out no it's not going to work well enough, so I will try Kubernetes in the future.
reverse proxy is not working with calibre right now. calibre has two different exposed ports, one for http and one for https, neither is working with the reverse proxy. ill figure this out later maybe but rn i dont care
