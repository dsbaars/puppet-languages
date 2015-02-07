require 'spec_helper'
describe 'languages::python' do

    context 'with defaults for all parameters' do
        it { should contain_class('languages::python') }
    end
end
