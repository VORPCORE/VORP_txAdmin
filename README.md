# TXAdmin RedM Recipe for VorpCore Framework

A full fledge [txAdmin](https://txadm.in/) recipe for [Vorp Core](http://docs.vorpcore.com:3000/)

## Instalation video 
[youtube](https://www.youtube.com/watch?v=ECx70qGzTQI)

## framework
[Discord VORP](https://discord.gg/23MPbQ6)

## Included Features
 - Vorp Core Premade (Most Stable Releases)
	- Jobs
		- Police
		- Postman
		- Hunting
		- Fishing
		- Woodcutter
		- Boss Manager
	- Character Creator
	- Metabolism
	- Economy
		- Dollars, Gold
		- Bank
	- Stores
		- Clothing Stores
		- Shops
		- Weapons (v2)
		- Stables (Horses)
		- Barber Shops
	- Cinema
	- Housing
	- Custom Walk Animations
	- Admin Menu
	- oxmysql
- Fixes
	- Interior fixes

## Dependencies
-   Windows or Linux (Ubuntu/Debian recommended)
-   **Highly Recommended -**  [Git  1.9k](https://git-scm.com/downloads)  for correct installation
-   **Windows only -**  [Visual C++ Redistributable 2019  808](https://aka.ms/vs/16/release/VC_redist.x64.exe)  or newer
- [Cfx.re](https://forum.cfx.re/) Account
- Must have "Latest Recommended" txAdmin build artifact
	- [Windows](http://runtime.fivem.net/artifacts/fivem/build_server_windows/master/) 
	- [Linux](http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)

## Installation Tutorial
**Video Walkthrough** 

### Windows
1.  Create a new base folder (e.g.  `C:\MyRedMServer`)
2. Navigate to [http://runtime.fivem.net/artifacts/fivem/build_server_windows/master](http://runtime.fivem.net/artifacts/fivem/build_server_windows/master/)  and download the  **Latest Recommended**  artifact.
3. Open the downloaded  _server.zip_  file and extract the contents to a new folder called `cfx` within your server folder created in step 1 (e.g.  `C:\MyRedMServer\cfx`)
4. Double Click or execute `FXServer.exe` to initiate setup
5. This site should open in your browser. Make sure a PIN is filled, and click `Link Account`.![enter image description here](https://docs.fivem.net/server-setup/windows-step2-2.png)
6.  Log in to your account on [Cfx.re](https://forum.cfx.re/) in this tab and then click `Yes, Allow`.
7. Set a password to log in to your server's admin page. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-4.png)
8. Click 'Next'. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-5.png)
9. Type a name for your server and click 'Next'
10. Select to use a 'Remote URL Template'. ![enter image description here](https://i.gyazo.com/4022332cac1f6611d325707b27452910.png)
11. Copy and paste the below url into the url field.
    `https://raw.githubusercontent.com/VORPCORE/VORP_txAdmin/main/vorp_recipe.yaml`
12. Click `Next`
13. Keep the default path and click `Next`
14. Click `Go to Recipe Deployer`
15. Click 'Next' once you're sure the recipe looks fine. It should be fine the way it comes.
16. Enter the key you just made on the [Keymaster](https://keymaster.fivem.net/) in the 'Before you begin' ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-12.png)
17. Click the "Show/Hide Database options (advanced)"
18. Change Database Name to `vorpv2`
19. Click 'Run Recipe'
20. Woohoo! Recipe installed correctly, you can click 'Next' again. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-13.png)
21. Click "Save & Run Server", and you're done!

### Linux
_Assuming you are SSHed into your machine or have otherwise access._
1.  Create a new base folder (e.g.  `C:\MyRedMServer`)
2. Navigate in your browser to  [http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/](http://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)  
    a. Right click on the latest artifact
    b. Click “Copy link location” or similar prompts
3. Create a new cfx folder and then navigate to the MyRedMServer folder  
    a. `cd ~/MyRedMServer`

	b. `mkdir cfx`

	c. `cd cfx`
4. Download the artifact using the link we copied in step 2.  
    a.  `wget <link_url>`
5.  Extract the files using  `tar`  
    a.  `tar xf fx.tar.xz`
6. Run the startup script
	a. `./run.sh`
7.  This site should open in your browser. Make sure a PIN is filled, and click `Link Account`.![enter image description here](https://docs.fivem.net/server-setup/windows-step2-2.png)
8.  Log in to your account on [Cfx.re](https://forum.cfx.re/) in this tab and then click `Yes, Allow`.
9. Set a password to log in to your server's admin page. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-4.png)
10. Click 'Next'. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-5.png)
11. Type a name for your server and click 'Next'
12. Select to use a 'Remote URL Template'. ![enter image description here](https://i.gyazo.com/4022332cac1f6611d325707b27452910.png)
13. Copy and paste the below url into the url field. (select lua if you want our lua core code, or c# if you prefer core code)
    (LUA) `https://raw.githubusercontent.com/VORPCORE/VORP_txAdmin/main/vorp_recipe.yaml`
14. Click `Next`
15. Keep the default path and click `Next`
16. Click `Go to Recipe Deployer`
17. Click 'Next' once you're sure the recipe looks fine. It should be fine the way it comes.
18. Enter the key you just made on the [Keymaster](https://keymaster.fivem.net/) in the 'Before you begin' ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-12.png)
19. Click the "Show/Hide Database options (advanced)"
20. Change Database Name to `vorpv2`
21. Click 'Run Recipe'
22. Woohoo! Recipe installed correctly, you can click 'Next' again. ![enter image description here](https://docs.fivem.net/server-setup/windows-step2-13.png)
23. Click "Save & Run Server", and you're done!

## Configuration
**Server Configurations**
- Main server configurations are within `MyRedMServer/txData/vorp_123abc.base/server.cfg`
- It is highly recommended to edit the server.cfg from txAdmin dashboard to ensure it saves properly.

**Resource Configurations**

- All scripts can be edited via their associated config.lua files within  `MyRedMServer/txData/vorp_123abc.base/resources/*`

## Getting help

If you have questions, concerns, bug reports, etc, please file an issue in this repository's Issue Tracker.

## Open source licensing info
1. [CONDUCT](CODE_OF_CONDUCT.md)
2. [LICENSE](LICENSE)
3. [CONTRIBUTING](CONTRIBUTING.md)


## Credits and references
- _Inspired and derived from: https://forum.cfx.re/t/how-to-setup-a-redm-server/918850_
- _Inspired and derived from: https://docs.fivem.net/docs/server-manual/setting-up-a-server-txadmin/_
