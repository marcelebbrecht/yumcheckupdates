require 'spec_helper'
describe 'yumcheckupdates' do
  context 'with default values for all parameters' do
    it { should contain_class('yumcheckupdates') }
  end
end
