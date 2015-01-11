require 'rails_helper'

RSpec.describe Author, :type => :model do
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :bio  }

  it { should have_many :posts }
end
