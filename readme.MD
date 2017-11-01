Personalized Universal Recommender as a Docker container

Consist of:
vendor recommender

Copy file env.list.sample to env.list, fill it, and run docker, e.g to train vendor

```
sudo docker pull hksitorus/ur:latest
sudo docker run -it --rm --network="host" --name="ur" --env-file env.list hksitorus/ur:latest /ur/run vendor train
```
then check your elasticsearch host for newly trained data