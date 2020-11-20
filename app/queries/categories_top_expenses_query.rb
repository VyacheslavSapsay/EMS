class CategoriesTopExpensesQuery < CategoriesQuery
  def perform
    query joins(:transactions)
      .where('transactions.created_at >= ?', 1.month.ago)
      .select(
        'categories.*',
        'SUM(transactions.debit_amount_cents) AS total_debit_amount',
        'SUM(transactions.credit_amount_cents) AS total_credit_amount',
        'SUM(transactions.credit_amount_cents + transactions.debit_amount_cents) AS total_amount'
      )
      .order('total_amount DESC')
      .group('categories.id')
  end

end
