namespace :units do
  desc "TODO"
  task seed_medicines: :environment do
    @storages = LocalStoragesCollection.all
    @medicines = MedicinesCollection.by_example(nomeSubstancia: 'omeprazol').limit(20)
    i = 0
    @storages.each do |s|
      @med = []
      @medicines.each do |m|

        @med << {key: m.key, quantidade: 10}
      end
      @storage = LocalStoragesCollection.by_key s.key
      unless @storage.nil?
        @storage.medicines = @med
        storage = @storage
        LocalStoragesCollection.save storage  
      end
    end
  end

  task create_relation: :environment do
    @storages = LocalStoragesCollection.all
    @medicines = MedicinesCollection.by_example(nomeSubstancia: 'omeprazol').limit(20)
    @storages.each do |s|
      @medicines.each do |m|    
        stock = Stock.new
        stock.local_storage = s.key
        stock.medicine = m.key
        stock.quantidade = 10
        puts stock.inspect
        StocksCollection.save stock
      end
    end
  end
end

