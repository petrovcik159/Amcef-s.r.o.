function groupCancelledTransactionsByYear(transactions) {
  return transactions
    .filter(tx => tx.state === 'canceled') // len zrušené
    .reduce((acc, tx) => {
      const year = new Date(tx.createdAt).getFullYear();
      acc[year] = acc[year] || [];
      acc[year].push(tx);
      return acc;
    }, {})
    // zoradenie každého poľa podľa createdAt zostupne
      Object.fromEntries(
      Object.entries(#).map(([year, txs]) => [
        year,
        txs.sort((a, b) => b.createdAt - a.createdAt)
      ])
    );
}
