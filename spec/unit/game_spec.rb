require 'game'

describe Game do

  weapons = ['Scissors', 'Paper', 'Rock', 'Lizard', 'Spock']

  let(:rps_mock){double :rps_mock, :result => 'Chris Wins'}

  subject{Game.new(name_1: 'Chris', name_2: 'James', weapons: weapons, multiplayer: 'false', game_module: rps_mock)}

  describe '#player_1_name' do
    it 'returns player 1 name' do
      expect(subject.player_1_name).to eq 'Chris'
    end
    it 'uses defualt for player 1 if none given' do
      game = Game.new(name_1: '', name_2: '', weapons: weapons, multiplayer: 'false', game_module: rps_mock)
      expect(game.player_1_name).to eq 'Player 1'
    end
  end

  describe '#player_2_name' do
    it 'returns player 2 name' do
      expect(subject.player_2_name).to eq 'James'
    end
    it 'uses computer name for player 2 if none given' do
      game = Game.new(name_1: '', name_2: '', weapons: weapons, multiplayer: 'false', game_module: rps_mock)
      expect(game.player_2_name).to eq 'Computer'
    end
    it 'uses default name for player 2 if multiplayer' do
      game = Game.new(name_1: '', name_2: '', weapons: weapons, multiplayer: 'true', game_module: rps_mock)
      expect(game.player_2_name).to eq 'Player 2'
    end
  end

  describe '#multiplayer' do
    it 'returns multiplayer boolean if given string true' do
      game = Game.new(name_1: '', name_2: '', weapons: weapons, multiplayer: 'true', game_module: rps_mock)
      expect(game.multiplayer).to eq true
    end
    it 'returns multiplayer boolean if given string false' do
      game = Game.new(name_1: '', name_2: '', weapons: weapons, multiplayer: 'false', game_module: rps_mock)
      expect(game.multiplayer).to eq false
    end
  end

  describe '#add_move_1' do
    it 'allows move to be added' do
      expect(subject).to respond_to(:add_move_1).with(1).argument
    end
  end

  describe '#add_move_2' do
    it 'allows move to be added' do
      expect(subject).to respond_to(:add_move_2).with(1).argument
    end
  end

  describe '#result' do
    it 'calls on game module for result with added moves' do
      subject.add_move_1(1)
      subject.add_move_2(4)
      expect(rps_mock).to receive(:result).with({:move_1=>1, :move_2=>4, :name_1=>'Chris', :name_2=>'James', :num_weapons=>5})
      subject.result
    end
    it 'returns result hash including player moves' do
      subject.add_move_1(1)
      subject.add_move_2(4)
      expect(subject.result).to eq({result: 'Chris Wins', player_1_move: 'Scissors', player_2_move: 'Lizard'})
    end
    it 'generates random move for player two if not given' do
      subject.add_move_1(1)
      srand(3)
      expect(rps_mock).to receive(:result).with({:move_1=>1, :move_2=>3, :name_1=>'Chris', :name_2=>'James', :num_weapons=>5})
      subject.result
    end
  end

  describe '.create' do
    it 'creates new instance of game' do
      expect(Game).to receive(:new)
      Game.create(name_1: 'Chris', name_2: 'James', weapons: weapons, multiplayer: 'true', game_module: rps_mock)
    end
  end

  describe '.game_instance' do
    it 'returns created game instance' do
      test = Game
      test.create(name_1: 'Chris', name_2: 'James', weapons: weapons, multiplayer: 'true', game_module: rps_mock)
      expect(test.game_instance).to be_instance_of(Game)
    end
  end
end
