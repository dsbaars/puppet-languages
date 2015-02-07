require 'spec_helper'
describe 'languages' do

  context 'with defaults for all parameters' do
    it { should contain_class('languages') }
  end
end
