require 'rails_helper'

RSpec.describe Category, :type => :model do
  it { should respond_to :name }
  it { should respond_to :description }

  it { should have_many :post_categories }
end
