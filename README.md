![unknown](https://user-images.githubusercontent.com/67253117/110873237-87c91000-828e-11eb-9a5b-7c28879a5d5a.png)
# esx_blocktazers
A simple &amp; optimized ESX resource to prevent cheaters from tazing other players. This resource works as a whitelist, so any player with a job in the "allowedJobs" table, which is only police by default, is allowed to use tazers, otherwise, the player will be kicked with a custom kick message you can customize in the server.lua file. You can also find the "allowedJobs" table inside of the server.lua file which you can add and remove jobs from as you would like.

If this resource is not working for your server, contact me on discord at Vyast#0001. If you can troubleshoot on your own, the most common reason for this resource not working is that your servers stungun/tazer has a modified damage value. Head to line 18 in the server.lua file and above this line, add print(data.weaponDamage). Go in game, shoot a stungun/tazer at a nother player and check your console to see the value/number it printed out. That is the value you need to replace 1 or 0 with on line 18 for this resource to work correctly.

Please Note: This resource requires OneSync to be enabled in order to function properly.
