# Example RSpec file for predicate matchers and truthiness
#
# Instructions:
# 1. Run `rspec` to see predicate matchers in action.
# 2. Try writing your own examples for truthiness and predicates!

RSpec.describe 'Predicate Matchers' do
  it 'checks be_empty' do
    expect([]).to be_empty
  end

  it 'checks be_truthy' do
    expect(1).to be_truthy
  end
end
