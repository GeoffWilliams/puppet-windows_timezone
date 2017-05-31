require 'spec_helper'
describe 'windows_timezone' do
  context 'with default values for all parameters' do
    it { should contain_class('windows_timezone') }
  end
end
