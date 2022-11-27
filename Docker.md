# How to run the bot inside a docker container

## Motivation

Docker is a service that helps in creating isolation in the local environment. For example, if your machine runs on Windows with Python 2, you won't have to worry about running the bot that has been developed on Linux with Python 3.7 or 3.8.

The introduced `Dockerfile` uses `Python 3.9.15` to run the bot in an isolated environment.

### Setting up Environment Variables

- Create folder `TLE` then navigate to it and Create a new file `environment`.

```bash
touch environment
```

Fill in appropriate variables in new "environment" file.

- Open the file `environment`.

```bash
export BOT_TOKEN="XXXXXXXXXXXXXXXXXXXXXXXX.XXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXX"
export LOGGING_COG_CHANNEL_ID="XXXXXXXXXXXXXXXXXX"
export ALLOW_DUEL_SELF_REGISTER="false"
export CLIST_API_TOKEN="username=xxxxxxxxx&api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

- Change the value of `BOT_TOKEN` with the token of the bot you created from [this step](https://github.com/reactiflux/discord-irc/wiki/Creating-a-discord-bot-&-getting-a-token).

- Replace the value of `LOGGING_COG_CHANNEL_ID` with discord [channel id](https://support.discord.com/hc/en-us/articles/206346498-Where-can-I-find-my-User-Server-Message-ID-) that you want to use as a logging channel.

### Running the container

```bash
docker run -v ${PWD}/environment:/TLE/environment -v ${PWD}/data:/TLE/data -it --name tle --net host zydhanlinnar11/tle:latest
```

PS: use `-d` flag to run in backgroud. Then to kill background container, run `docker kill tle`

### Debugging/Running Commands inside the container

To Run Commands inside the container

```bash
docker exec -it tle bash
```
