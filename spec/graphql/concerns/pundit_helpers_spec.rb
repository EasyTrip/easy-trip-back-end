# frozen_string_literal: true

describe PunditHelpers do
  subject(:authorize) { dummy_class.new.authorize ApplicationRecord }

  let!(:dummy_class) { Class.new { include PunditHelpers } }

  it 'raises ArgumentError' do
    expect { authorize }.to raise_error ArgumentError
  end
end
