require 'spec_helper'

describe "Revision Model" do
  let(:revision) { Revision.new }
  it 'can be created' do
    revision.should_not be_nil
  end
end
