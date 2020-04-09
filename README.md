# RPS Challenge
-------
```
     _______             _______                _______
|---'   ____)       |---'   ____)____      |---'   ____)____
|      (_____)      |          ______)     |          ______)
|      (_____)      |         _______)     |       __________)
|      (____)       |         _______)     |      (____)
|---.__(___)        |---.__________)       |---.__(___)

```
-------
### Outline

Makers Academy weekend challenge to create a simple webapp using Ruby Sinatra, allowing a user to play Rock Paper Scissors Spock Lizard against an opponent or computer.

## How to Install

### Prerequisites

The webapp has been developed on Ruby Sinatra, a rack based platform, so to install make sure you have the following installed:
- RVM (follow instructions [here](https://rvm.io/rvm/install))
- Ruby 2.6.5 (```rvm install 2.6.5```)
- Bundler 2+ (```gem install bundler```)

Then clone or download this repository, move to root directory and run ```bundle install``` to install the application for all environments. 

### How to Run the Tests

After install, to check the application is working correctly navigate to the root directory and run the tests using the following command:
```bash
rspec
```

### How to Start the Server

The default application server is Puma. The application is currently configured to listen for requests on a unix socket ```shared/sockets/puma.sock```. To change this to listen on the localhost, edit the puma configuration file ```config/puma.rb```, commenting out the line starting with ```bind ...``` and un-commenting the line starting with ```port ...```, selecting the port you wish to host on.

To start the server, navigate to the root directory and run the following command:
```bash
puma
```

## Application Design Process

### Customer Requirements
#### Base requirements
```
As a marketeer
So that I can see my name in lights
I would like to register my name before playing an online game
```
```
As a marketeer
So that I can enjoy myself away from the daily grind
I would like to be able to play rock/paper/scissors
```
#### Additional Requirements
```
Mutliplayer mode
Two players can play against eachother in the game
```
```
Extended Rock Paper Scissors
Extended game to play Rock, Paper, Scissors, Spock, Lizard
```

### Approach

#### Extract Scope
Using customer requirements and
- Inital page allowing user select single or multiplayer
- Name entering page to allow players to enter name and start game
- Single player game page - click button of move
- Multiplayer game page - second player clicks button of move
- Results page - Displays winner and play again button
- Game logic to be designed to allow for expansion for additional weapons

#### Notes
- Features to be TDD with Capybara/RSpec
- Additional features can be added such as game music and animation

#### Objects
- app_controller - controls models, views, and routes
- views - various for app
- model: RPSExtended - returns string with winner of RPS game
- model: Game - stores player names and implements logic for game

#### Create RSpec for basic object functions and implement TDD
- RPSExtended::result(name_1:, name_2:, move_1:, move_2:, num_weapons:) - String result
- Game.new(name_1:, name_2:, num_weapons:, game_module:) - Inject game module which returns result
- Game.new.result(move_1:, move_2:) - String result from game module
- Game.create(name_1:, name_2:, num_weapons:, game_module:) - Stores game in class variable for persistence
- Game.game_instance - Returns stored game instance

#### Create RSpec for webpages and features
- Homepage - Displays game title and singleplayer/multiplayer options
- Enter names - Allows entering of names
- Single player game - Shows name and buttons for each move
- Mutliplayer game - Shows name and buttons for each move, switches player after first move
- End screen - Shows winner, offers for game to be restarted

#### Refactor & Cleanup
- Refactor views to be abstract which controller fills in
- Refactor multiplayer to use standard views
- Refactor result to return each players move
- Cleanup tests (make sure each feature is tested)


## License

This application is distributed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International Public License