![img](https://ci.appveyor.com/api/projects/status/gmu6b3ltc80hr3k9?svg=true)
[![Discord](https://discordapp.com/api/guilds/117523346618318850/widget.png)](https://discord.gg/nadekobot)
[![Documentation Status](https://readthedocs.org/projects/nadekobot/badge/?version=latest)](http://nadekobot.readthedocs.io/en/latest/?badge=latest)
[![nadeko0](https://cdn.discordapp.com/attachments/266240393639755778/281920716809699328/part1.png)](http://nadekobot.xyz)
[![nadeko1](https://cdn.discordapp.com/attachments/266240393639755778/281920134967328768/part2.png)](https://discordapp.com/oauth2/authorize?client_id=170254782546575360&scope=bot&permissions=66186303)
[![nadeko2](https://cdn.discordapp.com/attachments/266240393639755778/281920161311883264/part3.png)](http://nadekobot.readthedocs.io/en/latest/Commands%20List/)

## For Update, Help and Guidelines

| [![twitter](https://cdn.discordapp.com/attachments/155726317222887425/252192520094613504/twiter_banner.JPG)](https://twitter.com/TheNadekoBot) | [![discord](https://cdn.discordapp.com/attachments/266240393639755778/281920766490968064/discord.png)](https://discord.gg/nadekobot) | [![Wiki](https://cdn.discordapp.com/attachments/266240393639755778/281920793330581506/datcord.png)](http://nadekobot.readthedocs.io/en/latest/)
| --- | --- | --- |
| Follow me on Twitter for updates. | Join my Discord server if you need help. | Read the Docs for hosting guides. |

## Setting Up NadekoBot on Heroku
Clone the repository

`git clone -b master --recursive --depth 1 --progress https://github.com/ScarletKuro/NadekoBot.git`

### Setting up the Database
- Open the Microsoft SQL Server Managment Studio.
- Connect to your SqlServer databse, i have already did that.
- Create a new database, for example db_Nadekobot.
- Execute the SqlServer.sql script that locates in scheme folder.

### Setting up the nadeko_run.sh
- Edit the nadeko_run.sh file in script folder.
Change the variables below
	<br />
    ```
    clientid=""
	```
	<br />
	```
    botid=""
	```
	<br />
	```
    token=""
	```
	<br />
	```
    ownerid=""
	```
	<br />
	```
    googleapi=""
	```
	<br />
	```
    lolapikey=""
	```
	<br />
	```
    mashapekey=""
	```
	<br />
	```
    osu=""
	```
	<br />
	```
    scid=""
	```
	<br />
	```
    connection="Data Source=;Initial Catalog=;User ID=;Password="
    ```
	<br />
- Move the nadeko_run.sh and Procfile to the root folder.

### Setting up the Heroku
- Log in your heroku account
- Create a new app
- Add the buildpacks
	<br />
    ```
    https://github.com/ScarletKuro/nadeko-dotnetcore-buildpack
    ```
	<br />
    ```
    https://ingmferrer@bitbucket.org/ingmferrer/opus-buildpack.git
    ```
	<br />
    ```
    https://github.com/challengee/heroku-buildpack-libsodium.git
    ```
	<br />
    ```
    https://github.com/jonathanong/heroku-buildpack-ffmpeg-latest.git
    ```
- Deploy now the Nadeko using DropBox, Heroku CLI or Github
- Turn the Dyno on after the build is complete
- Enjoy!

### Video How to Setup
[![ScreenShot](http://i.imgur.com/PaplNYc.png)](https://www.youtube.com/watch?v=GBi3_s2NujA)