require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should respond_to :user_id }
  it { should respond_to :title }
  it { should respond_to :body }

  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :post_categories }
end
