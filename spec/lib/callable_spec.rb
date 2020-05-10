# frozen_string_literal: true

describe Callable do
  subject(:callable) { dummy_class.call }

  let(:dummy_class) { Class.new { include Callable } }

  it 'raises NotImplementedError' do
    expect { callable }.to raise_error NotImplementedError
  end
end
