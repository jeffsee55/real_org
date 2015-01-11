require 'rails_helper'

RSpec.describe PostCategory, :type => :model do
  it { should respond_to :post_id }
  it { should respond_to :category_id }

  it { should belong_to :post }
  it { should belong_to :category }
end
