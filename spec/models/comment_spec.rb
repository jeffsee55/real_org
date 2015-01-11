require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :title }
  it { should respond_to :body }

  it { should belong_to :post }
end
