# frozen_string_literal: true

require_relative '../robot'

describe Robot do
  let(:robot) { Robot.new }
  let(:left) { robot.left }
  let(:right) { robot.right }
  let(:move) { robot.move }
  let(:shutdown) { robot.shutdown }
  let(:origin_location) { [0, 0] }

  describe '#left' do
    it 'turns the robot left' do
      expect { left }.to(change { robot.direction }.from('north').to('west'))
    end

    it 'not change robot location' do
      expect { left }.not_to(change { robot.location })
    end
  end

  describe '#right' do
    it 'turns the robot right' do
      expect { right }.to(change { robot.direction }.from('north').to('east'))
    end

    it 'not change robot location' do
      expect { right }.not_to(change { robot.location })
    end
  end

  describe '#move' do
    it 'not change the direction' do
      expect { move }.not_to(change { robot.direction })
    end

    it 'moves the robot forward one space' do
      expect { move }.to change { robot.location }.from(origin_location).to([0, 1])
    end
  end

  describe '#shutdown' do
    it 'exits the program' do
      expect { shutdown }.to raise_error(SystemExit)
    end
  end
end
