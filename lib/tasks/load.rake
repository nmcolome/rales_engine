require 'csv'


namespace :load do
  desc "Loads the customers csv file to the database"
  task :customers do
    CSV.foreach("db/data/customers.csv", headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_h)
    end
    puts "All customers were successfully loaded"
  end

  desc "Loads the merchants csv file to the database"
  task :merchants do
    CSV.foreach("db/data/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_h)
    end
    puts "All merchants were successfully loaded"
  end

  desc "Loads the items csv file to the database"
  task :items do
    CSV.foreach("db/data/items.csv", headers: true, header_converters: :symbol) do |row|
      Item.create!(row.to_h)
    end
    puts "All items were successfully loaded"
  end

  desc "Loads the invoices csv file to the database"
  task :invoices do
    CSV.foreach("db/data/invoices.csv", headers: true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_h)
    end
    puts "All invoices were successfully loaded"
  end

  desc "Loads the transactions csv file to the database"
  task :transactions do
    CSV.foreach("db/data/transactions.csv", headers: true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_h)
    end
    puts "All transactions were successfully loaded"
  end

  desc "Loads the invoice items csv file to the database"
  task :invoice_items do
    CSV.foreach("db/data/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!(row.to_h)
    end
    puts "All invoice items were successfully loaded"
  end

  desc "Runner task to loads all the csv files to the database"
  task all: [:environment, :customers, :merchants, :items, :invoices, :transactions, :invoice_items] do
  end
end