# My Docker Compose Setup

Still a WIP

## Servies
- fill in later

## TODO

- better security, stop running services in containers as root
- add more services
- change all 'latest' tags

## Docker Swarm

[Tutorial](https://docs.docker.com/engine/swarm/swarm-tutorial/)

- use `docker swarm join-token worker` to get token for joining manager node
- use `DRAIN` to prevent a node from recieving new tasks
- checkout [sheperd](https://github.com/containrrr/shepherd) for automatically updating swarm services
- if something happens to the leader node in a swarm, a new leader node is elected. the whole swarm does not go down.
- routing mesh
  - enables each node in swarm to accept connections for any service running swarm, even if no task
  - basically access the same service on the same port from any of the ips of the nodes in the swarm
  - you can also bypass this with mode=host
- templates can be used for containers created by service
- [docs on deploying a swarm](https://docs.docker.com/engine/swarm/services/)
- ingress network for routing traffic that comes to any of the nodes
