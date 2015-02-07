require 'spec_helper'
describe 'languages::php' do

  context 'with defaults for all parameters' do
    it { should contain_class('languages::php') }
  end
end
