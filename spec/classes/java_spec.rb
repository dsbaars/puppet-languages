require 'spec_helper'
describe 'languages::java' do

  context 'with defaults for all parameters' do
    it { should contain_class('languages::java') }
  end
end
