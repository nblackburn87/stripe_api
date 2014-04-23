require 'spec_helper'

describe Organization do

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  it { should validate_uniqueness_of :name }
end
