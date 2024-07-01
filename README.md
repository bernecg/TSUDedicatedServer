# TSUDedicatedServer

## What is TSU?

TSU stands for Turbo Slider Unlimited, a multiplayer racing game. Developed by
[Antti Mannisto](https://store.steampowered.com/search/?developer=Antti%20Mannisto)
the game can be purchased on Steam here
[Turbo Sliders Unlimited](https://store.steampowered.com/app/1478340/Turbo_Sliders_Unlimited/)

## Dedicated Server

The idea of this project is to create a dedicated server to have your own
session. A lot of what is done was based on the official documentation for
dedicated server, located in the
[official website](https://www.turbosliders.com/help/dedicated-servers).

The game has some dedicated server by default, but you don't have admin access,
meaning you can't change any settings. Besides, depending from where you are
geographically playing, some lags can be noticed.

You can host yourself, it's possible through the game, which will consume
resource from your machine, although it's not something really heavy.

## How to

TBD

## TODO

- Improve documentation:
  - How to execute
  - Diagram
  - What else?
- Download non-default tracks and vehicles automatically (Steam? Google Drive?).
- Create some scripts for events:
  - Default event (10 tracks - 7 normal | 3 specials - 2 laps).
  - Formula 1 (3 tracks - 5 laps).
- Add Terraform unit tests".
- Github actions:
  - Check formatting.
  - Execute Terraform validation.
  - Execute Terraform unit tests.
- One-click or Discord-command to execute plan (big maybe).
  - If that's created, automate the deletion of the server after 2-3 hours.
