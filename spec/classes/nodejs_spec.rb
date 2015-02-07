require 'spec_helper'
describe 'languages::nodejs' do

  context 'with defaults for all parameters' do
    it { should contain_class('languages::nodejs') }
  end
end
