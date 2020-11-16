require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { should belong_to(:project).optional }
    it { should belong_to(:category).optional }
    it { should belong_to(:agent).optional }
    it { should belong_to(:debit_account).class_name('Account').optional }
    it { should belong_to(:credit_account).class_name('Account').optional }
    it { should belong_to(:author).class_name('AdminUser') }
  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:occured_at) }
  end

  it 'validates that transaction with date' do
    transaction = described_class.new
    expect(transaction).to be_invalid
    expect(transaction.errors[:occured_at]).to include("can't be blank")
  end

  it 'validates that *_amount is greater than 0' do
    transaction = described_class.new(debit_account_id: 1, debit_amount: 0)
    expect(transaction).to be_invalid
    expect(transaction.errors[:debit_amount]).to include("Can't be blank")
  end

  it 'validates that *_account is selected' do
    transaction = described_class.new(description: 'description',
      occured_at: DateTime.now, author_id: 1)
    expect(transaction.valid?).to be_falsey
    expect(transaction.errors[:base].size).to eq(1)
    expect(transaction.errors[:base]).to include('Choose debit or credit account')
  end

  it 'validates that author must exist' do
    transaction = described_class.new(author_id: '')
    expect(transaction).to be_invalid
    expect(transaction.errors[:author]).to include('must exist')
  end

end
