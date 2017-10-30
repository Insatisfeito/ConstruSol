puts 'Seeding Transports.'

transports = [{
        name: "Comboio de carga",
        simapro_name: "Freight Train (Europe without Switzerland) Market for | Alloc, Def, S",
        adp: 0.00000000000655,
        gwp: 0.0000000127,
        odp: 0.000000125,
        ap: 0.000657,
        popc: 0.0000523,
        ep: 0.0578,
        enr: 0.000851,
        er: 0.0000571
  },{
    name: "Veículo ligeiro comercial de carga",
    simapro_name: "Transport, freight, light commercial vehicle (GLO) Market For | Aloc Def S",
    adp:0.00000000764,
    gwp:0.00195,
    odp:0.000000000332,
    ap:0.0000091,
    popc:0.000000794,
    ep:0.00000268,
    enr:0.0307,
    er:0.000623
  },{
    name: "Camião de carga superior a 32 toneladas",
    simapro_name: "Transport, freight, lorry > 32 metric ton EURO3 (GLO) Market For | Aloc Def S",
    adp:0.000000000159,
    gwp:0.000085,
    odp:0.0000000000162,
    ap:0.000000457,
    popc:0.0000000161,
    ep:0.00000011,
    enr:0.00144,
    er:0.0000203
},{
  name: "Camião de carga entre 16 e 32 toneladas",
  simapro_name: "Transport, freight, lorry 16-32 metric ton EURO3 (GLO) Market For | Aloc Def S",
  adp:0.000000000467,
  gwp:0.00017,
  odp:0.0000000000313,
  ap:0.000000891,
  popc:0.0000000325,
  ep:0.000000213,
  enr:0.00275,
  er:0.0000326
},{
  name: "Camião de carga entre 3,5 e 7,5 toneladas",
  simapro_name: "Transport, freight, lorry 3.5-7.5 metric ton EURO3 (GLO) Market For | Aloc Def S",
  adp:0.00000000261,
  gwp:0.000527,
  odp:0.000000000092,
  ap:0.00000262,
  popc:0.000000102,
  ep:0.000000647,
  enr:0.00829,
  er:0.000117
},{
  name: "Camião de carga entre 7,5 e 16 toneladas",
  simapro_name: "Transport, freight, lorry 7.5-16 metric ton EURO3 (GLO) Market For | Aloc Def S",
  adp:0.000000000797,
  gwp:0.000221,
  odp:0.0000000000396,
  ap:0.00000112,
  popc:0.0000000418,
  ep:0.00000027,
  enr:0.00352,
  er:0.0000443
},{
  name: "Camião de carga entre 7,5 e 16 toneladas",
  simapro_name: "Transport, freight, lorry 7.5-16 metric ton EURO3 (GLO) Market For | Aloc Def S",
  adp:0.000000000318,
  gwp:0.000136,
  odp:0.0000000000251,
  ap:0.000000711,
  popc:0.0000000259,
  ep:0.000000171,
  enr:0.00222,
  er:0.0000291
},{
  name: "Avião", 						
  simapro_name: "",
  adp:0.00462,
  gwp:7.02E+03,
  odp:0.000458,
  ap:5.14E+01,
  popc:2.54E+00,
  ep:1.32E+01,
  enr:89613.45,
  er:8268
},{
  name: "Navio",
  simapro_name: "",							
  adp:2.89E-12,  
  gwp:0.0000115,
  odp:1.86E-12,
  ap:0.000000242,
  popc:7.89E-09,
  ep:2.66E-08,
  enr:0.000175625,
  er:0.000003642
}]

  transports.each do |transport|
    Transport.where(transport).first_or_create!
  end
