# Salstack
A virtualized Saltstack fleet

Add the number of Salt minions desired in docker-compose.yml (add a new object for each new node), then save and deploy:

```bash
$ docker-compose up -d                                                                            
```

After allowing some time for the minions to connect to the master, and the script to accept their keys, you can access the fleet:

```bash
$ docker exec saltstack_salt-master_1 salt "*" test.ping                                          
```
