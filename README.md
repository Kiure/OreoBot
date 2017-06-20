![img](https://ci.appveyor.com/api/projects/status/gmu6b3ltc80hr3k9?svg=true)
[![Discord](https://discordapp.com/api/guilds/117523346618318850/widget.png)](https://discord.gg/nadekobot)
[![Documentation Status](https://readthedocs.org/projects/nadekobot/badge/?version=latest)](http://nadekobot.readthedocs.io/en/latest/?badge=latest)
[![nadeko0](https://cdn.discordapp.com/attachments/266240393639755778/281920716809699328/part1.png)](http://nadekobot.me)
[![nadeko1](https://cdn.discordapp.com/attachments/266240393639755778/281920134967328768/part2.png)](https://discordapp.com/oauth2/authorize?client_id=170254782546575360&scope=bot&permissions=66186303)
[![nadeko2](https://cdn.discordapp.com/attachments/266240393639755778/281920161311883264/part3.png)](http://nadekobot.readthedocs.io/en/latest/Commands%20List/)

## For Update, Help and Guidelines

| [![twitter](https://cdn.discordapp.com/attachments/155726317222887425/252192520094613504/twiter_banner.JPG)](https://twitter.com/TheNadekoBot) | [![discord](https://cdn.discordapp.com/attachments/266240393639755778/281920766490968064/discord.png)](https://discord.gg/nadekobot) | [![Wiki](https://cdn.discordapp.com/attachments/266240393639755778/281920793330581506/datcord.png)](http://nadekobot.readthedocs.io/en/latest/)
| --- | --- | --- |
| Follow Kwoth on Twitter for updates. | Join Kwoth's Discord server if you need help. | Read the Docs for hosting guides. |

## Explanation
Before you continue, notice that this nadeko uses **Microsoft SQL Server** and you need to have your **own** SQL Server since heroku doesn't provide any.
Why it uses MSSQL instead of the built-in SQLite? The answer is because of heroku's [**ephemeral filesystem.**](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem)

## Setting Up NadekoBot on Heroku
Clone the repository

`git clone -b master --recursive --depth 1 --progress https://github.com/ScarletKuro/NadekoBot.git`

**NB!** Before you proceed, remove the .git folder from NadekoBot folded after u clone the repository.

### Setting up the Database
- If you don't have any SQL Server, you can temporary use [gearhost](https://www.gearhost.com/). Remember that it has *limited data-size*.
- Open the Microsoft SQL Server Managment Studio.
- Connect to your SqlServer databse.
- Create a new database, for example db_Nadekobot.
- Execute the SqlServer.sql script that locates in scheme folder.

### Setting up the nadeko_run.sh
- Edit the nadeko_run.sh file in script folder.
Change the variables below
	<br />
    `
    clientid=""
	`
	<br />
	`
    botid=""
	`
	<br />
	`
    token=""
	`
	<br />
	`
    ownerid=""
	`
	<br />
	`
    googleapi=""
	`
	<br />
	`
    lolapikey=""
	`
	<br />
	`
    mashapekey=""
	`
	<br />
	`
    osu=""
	`
	<br />
	`
    scid=""
	`
	<br />
	`
    connection="Data Source=;Initial Catalog=;User ID=;Password="
    `
    **NB!** If you are using a domain name to connect to database take a note that some domain names may require a **www** prefix and some doesn't to connect to the database.
	For example my college SQL Server needs a *www* before the domain name and the gearhost's doesn't.
- Move the nadeko_run.sh and Procfile to the root folder.(they are in the script folder)<br />
![ScreenShot](http://i.imgur.com/RxQ6QtH.png)

### Setting up the Heroku
- Log in your heroku account
- Create a new app
- **NOW IT'S IMPORTANT that you download the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli), because
  heroku now creating a heroku-16 stack app by default, and the dotnetcore doesn't work proper on it.
  After you installed the application and created app on herokus webpage, open the cmd
  and enter<br />
  ```heroku login``` #enter your heroku credentials, after that use<br />
  ```heroku stack:set cedar-14 -a your_application_name``` #it will rollback the heroku-16 back to cedar-14 stack.**<br />
  Now we should be fine.
  
- Add the buildpacks on heroku website in your application settings
	<br />
    `
    https://github.com/ScarletKuro/nadeko-dotnetcore-buildpack
    `
	<br />
    `
    https://ingmferrer@bitbucket.org/ingmferrer/opus-buildpack.git
    `
	<br />
    `
    https://github.com/challengee/heroku-buildpack-libsodium.git
    `
	<br />
    `
    https://github.com/ScarletKuro/heroku-buildpack-ffmpeg-static
    `
- Deploy now the Nadeko using DropBox, Heroku CLI or Github
- Turn the Dyno(in the overview tab click Configure Dyno) on after the build is complete
- Enjoy!

### Video How to Setup
[![ScreenShot](http://i.imgur.com/PaplNYc.png)](https://www.youtube.com/watch?v=GBi3_s2NujA)
