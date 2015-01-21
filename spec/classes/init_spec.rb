require 'spec_helper'
describe 'condor' do

  context 'with defaults for all parameters' do
    it { should contain_class('condor') }
  end
end
