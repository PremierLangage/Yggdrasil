# OCE : test 11/09/2019 OK

#concept/value/floatexpression.pl

# extends=/template/simplestring.pl
## temporaire couper ici

@ /builder/before.py [builder.py]
@ /utils/sandboxio.py
@ /grader/evaluator.py [grader.py]

text=' dummy shmoud be remove by the builder'


form==
<div class="input-group">
    <input id="form_calcul"  value="{{ answers__.calcul}}" class="form-control" placeholder="" style="weigth:150" required>
</div>
==
## temporaire couper ici

tag=float|const|expression

title= Un calcul de change en Flotant (float)

oneshot=False

before==
import random

random.seed(seed)

# optained  with http://data.fixer.io/api/symbols?access_key=29f9ad3929ae047144ca6599d5b4a0ae
symbols={'AED': 'United Arab Emirates Dirham', 'AFN': 'Afghan Afghani', 'ALL': 'Albanian Lek', 'AMD': 'Armenian Dram', 'ANG': 'Netherlands Antillean Guilder', 'AOA': 'Angolan Kwanza', 'ARS': 'Argentine Peso', 'AUD': 'Australian Dollar', 'AWG': 'Aruban Florin', 'AZN': 'Azerbaijani Manat', 'BAM': 'Bosnia-Herzegovina Convertible Mark', 'BBD': 'Barbadian Dollar', 'BDT': 'Bangladeshi Taka', 'BGN': 'Bulgarian Lev', 'BHD': 'Bahraini Dinar', 'BIF': 'Burundian Franc', 'BMD': 'Bermudan Dollar', 'BND': 'Brunei Dollar', 'BOB': 'Bolivian Boliviano', 'BRL': 'Brazilian Real', 'BSD': 'Bahamian Dollar', 'BTC': 'Bitcoin', 'BTN': 'Bhutanese Ngultrum', 'BWP': 'Botswanan Pula', 'BYN': 'New Belarusian Ruble', 'BYR': 'Belarusian Ruble', 'BZD': 'Belize Dollar', 'CAD': 'Canadian Dollar', 'CDF': 'Congolese Franc', 'CHF': 'Swiss Franc', 'CLF': 'Chilean Unit of Account (UF)', 'CLP': 'Chilean Peso', 'CNY': 'Chinese Yuan', 'COP': 'Colombian Peso', 'CRC': 'Costa Rican Colón', 'CUC': 'Cuban Convertible Peso', 'CUP': 'Cuban Peso', 'CVE': 'Cape Verdean Escudo', 'CZK': 'Czech Republic Koruna', 'DJF': 'Djiboutian Franc', 'DKK': 'Danish Krone', 'DOP': 'Dominican Peso', 'DZD': 'Algerian Dinar', 'EGP': 'Egyptian Pound', 'ERN': 'Eritrean Nakfa', 'ETB': 'Ethiopian Birr', 'EUR': 'Euro', 'FJD': 'Fijian Dollar', 'FKP': 'Falkland Islands Pound', 'GBP': 'British Pound Sterling', 'GEL': 'Georgian Lari', 'GGP': 'Guernsey Pound', 'GHS': 'Ghanaian Cedi', 'GIP': 'Gibraltar Pound', 'GMD': 'Gambian Dalasi', 'GNF': 'Guinean Franc', 'GTQ': 'Guatemalan Quetzal', 'GYD': 'Guyanaese Dollar', 'HKD': 'Hong Kong Dollar', 'HNL': 'Honduran Lempira', 'HRK': 'Croatian Kuna', 'HTG': 'Haitian Gourde', 'HUF': 'Hungarian Forint', 'IDR': 'Indonesian Rupiah', 'ILS': 'Israeli New Sheqel', 'IMP': 'Manx pound', 'INR': 'Indian Rupee', 'IQD': 'Iraqi Dinar', 'IRR': 'Iranian Rial', 'ISK': 'Icelandic Króna', 'JEP': 'Jersey Pound', 'JMD': 'Jamaican Dollar', 'JOD': 'Jordanian Dinar', 'JPY': 'Japanese Yen', 'KES': 'Kenyan Shilling', 'KGS': 'Kyrgystani Som', 'KHR': 'Cambodian Riel', 'KMF': 'Comorian Franc', 'KPW': 'North Korean Won', 'KRW': 'South Korean Won', 'KWD': 'Kuwaiti Dinar', 'KYD': 'Cayman Islands Dollar', 'KZT': 'Kazakhstani Tenge', 'LAK': 'Laotian Kip', 'LBP': 'Lebanese Pound', 'LKR': 'Sri Lankan Rupee', 'LRD': 'Liberian Dollar', 'LSL': 'Lesotho Loti', 'LTL': 'Lithuanian Litas', 'LVL': 'Latvian Lats', 'LYD': 'Libyan Dinar', 'MAD': 'Moroccan Dirham', 'MDL': 'Moldovan Leu', 'MGA': 'Malagasy Ariary', 'MKD': 'Macedonian Denar', 'MMK': 'Myanma Kyat', 'MNT': 'Mongolian Tugrik', 'MOP': 'Macanese Pataca', 'MRO': 'Mauritanian Ouguiya', 'MUR': 'Mauritian Rupee', 'MVR': 'Maldivian Rufiyaa', 'MWK': 'Malawian Kwacha', 'MXN': 'Mexican Peso', 'MYR': 'Malaysian Ringgit', 'MZN': 'Mozambican Metical', 'NAD': 'Namibian Dollar', 'NGN': 'Nigerian Naira', 'NIO': 'Nicaraguan Córdoba', 'NOK': 'Norwegian Krone', 'NPR': 'Nepalese Rupee', 'NZD': 'New Zealand Dollar', 'OMR': 'Omani Rial', 'PAB': 'Panamanian Balboa', 'PEN': 'Peruvian Nuevo Sol', 'PGK': 'Papua New Guinean Kina', 'PHP': 'Philippine Peso', 'PKR': 'Pakistani Rupee', 'PLN': 'Polish Zloty', 'PYG': 'Paraguayan Guarani', 'QAR': 'Qatari Rial', 'RON': 'Romanian Leu', 'RSD': 'Serbian Dinar', 'RUB': 'Russian Ruble', 'RWF': 'Rwandan Franc', 'SAR': 'Saudi Riyal', 'SBD': 'Solomon Islands Dollar', 'SCR': 'Seychellois Rupee', 'SDG': 'Sudanese Pound', 'SEK': 'Swedish Krona', 'SGD': 'Singapore Dollar', 'SHP': 'Saint Helena Pound', 'SLL': 'Sierra Leonean Leone', 'SOS': 'Somali Shilling', 'SRD': 'Surinamese Dollar', 'STD': 'São Tomé and Príncipe Dobra', 'SVC': 'Salvadoran Colón', 'SYP': 'Syrian Pound', 'SZL': 'Swazi Lilangeni', 'THB': 'Thai Baht', 'TJS': 'Tajikistani Somoni', 'TMT': 'Turkmenistani Manat', 'TND': 'Tunisian Dinar', 'TOP': 'Tongan Paʻanga', 'TRY': 'Turkish Lira', 'TTD': 'Trinidad and Tobago Dollar', 'TWD': 'New Taiwan Dollar', 'TZS': 'Tanzanian Shilling', 'UAH': 'Ukrainian Hryvnia', 'UGX': 'Ugandan Shilling', 'USD': 'United States Dollar', 'UYU': 'Uruguayan Peso', 'UZS': 'Uzbekistan Som', 'VEF': 'Venezuelan Bolívar Fuerte', 'VND': 'Vietnamese Dong', 'VUV': 'Vanuatu Vatu', 'WST': 'Samoan Tala', 'XAF': 'CFA Franc BEAC', 'XAG': 'Silver (troy ounce)', 'XAU': 'Gold (troy ounce)', 'XCD': 'East Caribbean Dollar', 'XDR': 'Special Drawing Rights', 'XOF': 'CFA Franc BCEAO', 'XPF': 'CFP Franc', 'YER': 'Yemeni Rial', 'ZAR': 'South African Rand', 'ZMK': 'Zambian Kwacha (pre-2013)', 'ZMW': 'Zambian Kwacha', 'ZWL': 'Zimbabwean Dollar'}
# optained with http://data.fixer.io/api/latest?access_key=29f9ad3929ae047144ca6599d5b4a0ae
rates={"AED":4.247833,"AFN":84.631135,"ALL":125.680181,"AMD":559.402618,"ANG":2.134584,"AOA":312.665153,"ARS":34.957522,"AUD":1.585808,"AWG":2.072889,"AZN":1.968807,"BAM":1.952042,"BBD":2.315854,"BDT":96.956836,"BGN":1.955973,"BHD":0.436111,"BIF":2046.638566,"BMD":1.156424,"BND":1.7472,"BOB":7.994298,"BRL":4.672819,"BSD":1.156944,"BTC":0.00018,"BTN":81.065227,"BWP":12.321727,"BYN":2.366105,"BYR":22665.903427,"BZD":2.325558,"CAD":1.50863,"CDF":1867.624148,"CHF":1.138048,"CLF":0.026138,"CLP":765.6453,"CNY":7.952613,"COP":3423.881305,"CRC":657.13749,"CUC":1.156424,"CUP":30.645227,"CVE":110.063737,"CZK":25.722905,"DJF":205.519417,"DKK":7.458539,"DOP":57.704964,"DZD":136.926274,"EGP":20.666457,"ERN":17.346725,"ETB":31.924805,"EUR":1,"FJD":2.428022,"FKP":0.913557,"GBP":0.898848,"GEL":2.989376,"GGP":0.899056,"GHS":5.530365,"GIP":0.913557,"GMD":55.629785,"GNF":10464.766996,"GTQ":8.686071,"GYD":241.888899,"HKD":9.078099,"HNL":27.722373,"HRK":7.435921,"HTG":80.086982,"HUF":324.035669,"IDR":16914.661717,"ILS":4.209682,"IMP":0.899056,"INR":81.082644,"IQD":1380.422904,"IRR":48691.217935,"ISK":124.998049,"JEP":0.899056,"JMD":157.956421,"JOD":0.820482,"JPY":128.249675,"KES":116.441064,"KGS":80.254193,"KHR":4712.201183,"KMF":491.191422,"KPW":1040.814794,"KRW":1297.622235,"KWD":0.350508,"KYD":0.964145,"KZT":417.68893,"LAK":9854.637216,"LBP":1750.478433,"LKR":185.941776,"LRD":178.431908,"LSL":1.607879,"LTL":3.525593,"LVL":0.717619,"LYD":1.611881,"MAD":10.947899,"MDL":19.350388,"MGA":3825.507632,"MKD":61.60844,"MMK":1749.328306,"MNT":2853.496024,"MOP":9.354201,"MRO":412.843348,"MUR":39.817401,"MVR":17.866618,"MWK":841.020623,"MXN":21.755808,"MYR":4.75001,"MZN":68.535497,"NAD":16.658312,"NGN":419.56245,"NIO":36.907847,"NOK":9.649262,"NPR":129.345916,"NZD":1.733716,"OMR":0.445223,"PAB":1.15706,"PEN":3.799025,"PGK":3.833371,"PHP":61.810269,"PKR":141.575199,"PLN":4.28012,"PYG":6710.553121,"QAR":4.210522,"RON":4.649168,"RSD":118.082429,"RUB":79.682227,"RWF":1017.993952,"SAR":4.33734,"SBD":9.27082,"SCR":15.71699,"SDG":20.901779,"SEK":10.509572,"SGD":1.58465,"SHP":1.527519,"SLL":9829.601188,"SOS":668.412733,"SRD":8.624623,"STD":24461.257803,"SVC":10.123506,"SYP":595.558231,"SZL":16.574446,"THB":37.933026,"TJS":10.892011,"TMT":4.059047,"TND":3.181671,"TOP":2.631559,"TRY":7.016371,"TTD":7.797707,"TWD":35.62176,"TZS":2644.970751,"UAH":32.221427,"UGX":4338.66749,"USD":1.156424,"UYU":36.693462,"UZS":9028.440064,"VEF":11.549783,"VND":26923.855285,"VUV":129.856574,"WST":3.024198,"XAF":654.732894,"XAG":0.079389,"XAU":0.000973,"XCD":3.125293,"XDR":0.828419,"XOF":654.732078,"XPF":119.031013,"YER":289.510412,"ZAR":16.533568,"ZMK":10409.20577,"ZMW":11.540648,"ZWL":372.778957}
# jour="23 Aout 2018"

cur1=random.choice(list(symbols.keys()))
cur2=random.choice(list(symbols.keys()))
text="""
Georges voyage beaucoup, il a ramené 1000 {} soit des "{}" de son dernier voyage,
la convertion qu'il doit appliquer est de {} {} pour 1 EUR (euro).
""".format(cur1,symbols[cur1],rates[cur1], cur1)

text+="""
Voila Georges reparti ailleurs, maitenant la monaie locale est le {} soit des "{}",
la convertion qu'il doit appliquer est de {} {} pour 1 EUR (euro).
""".format(cur2,symbols[cur2],rates[cur2], cur2)

text +="""
Question combien a t'il de {} à l'arrivee ?
Ecrivez l'**expression** qu'il faut écrire ou directement le **résultat**.
""".format(cur2)

text += '''

Remarque si souhaitez connaitre le nom en francais de ces monaies je vous propose la page suivante:
[wikipedia](https://fr.wikipedia.org/wiki/Liste_des_monnaies_en_circulation" target="_blank")
'''

res= 1000/rates[cur1]*rates[cur2]
==



evaluator==
from sandboxio import *
d=get_answers()

ret = d['calcul']

def myround(x, base=5):
    return int(base * round(float(x)/base))

if not ret:
    ret ="0.0"

try:
    ret=float(ret)

except:
    ret=eval(ret)

if  -0.00001 < ret - res < 0.0001:
    grade = 100, '''<div class="btn-success"> joli calcul !!<br> soit '''+str(res)+" "+cur2+" soit "+str(myround(1000/rates[cur1]))+" euros ! </div>"
else:
    if res > ret:
        grade = 0, '''<div class="btn-danger"> le calcul doit exact a 7 decimales !! et c'est plus grand </div>'''#+str(res)+" "+str(ret)
    else:
        grade = 0, '''<div class="btn-danger"> le calcul doit exact a 7 decimales !! et c'est plus petit </div>'''#+str(res)+" "+str(ret)
==




