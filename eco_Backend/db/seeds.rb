# db/seeds.rb

# Seed EconTable
if EconTable.count.zero?
  EconTable.create!([
    {
      acronym: "FEG",
      name: "Fegeland",
      imgUrl: "https://wiki.kerbalpowers.org/images/6/65/Fegeland_Flag.png",
      gross: 1000000,
      trade: 500000,
      expenditure: 200000,
      reserve: 300000,
      status: "Booming", # Predefined value
      co: 50,
      iso: 30,
      ant: 20,
      state: 40,
      ind: 60
    },
    {
      acronym: "AON",
      name: "Aontas",
      imgUrl: "https://wiki.kerbalpowers.org/images/1/1c/Aonta_Flag_New.png",
      gross: 1500000,
      trade: 600000,
      expenditure: 400000,
      reserve: 500000,
      status: "Stable",
      co: 40,
      iso: 25,
      ant: 35,
      state: 50,
      ind: 45
    },
    {
      acronym: "GRE",
      name: "Grestin",
      imgUrl: "https://wiki.kerbalpowers.org/images/8/89/GRS_Flag.png",
      gross: 1200000,
      trade: 700000,
      expenditure: 250000,
      reserve: 250000,
      status: "Friendly",
      co: 30,
      iso: 50,
      ant: 20,
      state: 30,
      ind: 70
    }
  ])
  puts "Seeded EconTable with default values."
else
  puts "EconTable already contains data. Skipping seeding."
end
# Seed EconTable data
econ_table = ActiveRecord::Base.connection.table_exists?('econ_tables')



# Seed AiTable
if AiTable.count.zero?
  AiTable.create!([
    {
      acronym: "PUG",
      name: "Puge-Tatar",
      imgUrl: "https://wiki.kerbalpowers.org/images/2/22/Puge-Tatar_flag_New.png",
      gross: 100000,
      trade: -20000,
      alignment: "AON",
      co: 80,
      iso: 20,
      ant: 0,
      state: 30,
      ind: 70
    },
    {
      acronym: "TRO",
      name: "Troakia",
      imgUrl: "https://wiki.kerbalpowers.org/images/0/0a/Troakia_Flag.png",
      gross: 100000,
      trade: 0,
      alignment: "FEG",
      co: 63,
      iso: 0,
      ant: 37,
      state: 20,
      ind: 80
    },
    {
      acronym: "GRS",
      name: "Grestine",
      imgUrl: "https://i.imgur.com/NZQl0xF.png",
      gross: 200000,
      trade: 0,
      alignment: "AON",
      co: 45,
      iso: 55,
      ant: 0,
      state: 15,
      ind: 85
    }
  ])
  puts "Seeded AiTable with default values."
else
  puts "AiTable already contains data. Skipping seeding."
end