require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    before :each do
     @transaction = Transaction.create(occured_at: DateTime.now)
    end
    it { should belong_to(:project).optional }
    it { should belong_to(:category).optional }
    it { should belong_to(:agent).optional }
    it { should belong_to(:debit_account).class_name('Account').optional }
    it { should belong_to(:credit_account).class_name('Account').optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:occured_at) }
  end

  it 'validates that transaction with date' do
    transaction = Transaction.new(description: 'desc', debit_account_id: 1, debit_amount: 5)
    expect(transaction).to be_invalid
    expect(transaction.errors[:occured_at]).to include("can't be blank")
  end

  it 'validates that *_amount is greater than 0' do
    transaction = Transaction.new(description: 'desc', debit_account_id: 1, debit_amount: 0)
    expect(transaction).to be_invalid
    expect(transaction.errors[:debit_amount]).to include("Can't be blank")
  end
end
