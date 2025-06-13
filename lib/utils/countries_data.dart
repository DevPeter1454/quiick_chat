class CountryData {
  final String name;
  final String code;
  final String dialCode;
  final List<String> languages;

  const CountryData({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.languages,
  });
}

class CountriesData {
  CountriesData._();

  static const List<CountryData> countries = [
    CountryData(
      name: "Afghanistan",
      code: "AF",
      dialCode: "+93",
      languages: ["Pashto", "Dari"],
    ),
    CountryData(
      name: "Albania",
      code: "AL",
      dialCode: "+355",
      languages: ["Albanian"],
    ),
    CountryData(
      name: "Algeria",
      code: "DZ",
      dialCode: "+213",
      languages: ["Arabic", "Berber", "French"],
    ),
    CountryData(
      name: "American Samoa",
      code: "AS",
      dialCode: "+1684",
      languages: ["English", "Samoan"],
    ),
    CountryData(
      name: "Andorra",
      code: "AD",
      dialCode: "+376",
      languages: ["Catalan"],
    ),
    CountryData(
      name: "Angola",
      code: "AO",
      dialCode: "+244",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Anguilla",
      code: "AI",
      dialCode: "+1264",
      languages: ["English"],
    ),
    CountryData(
      name: "Argentina",
      code: "AR",
      dialCode: "+54",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Armenia",
      code: "AM",
      dialCode: "+374",
      languages: ["Armenian"],
    ),
    CountryData(
      name: "Australia",
      code: "AU",
      dialCode: "+61",
      languages: ["English"],
    ),
    CountryData(
      name: "Austria",
      code: "AT",
      dialCode: "+43",
      languages: ["German"],
    ),
    CountryData(
      name: "Azerbaijan",
      code: "AZ",
      dialCode: "+994",
      languages: ["Azerbaijani"],
    ),
    CountryData(
      name: "Bahamas",
      code: "BS",
      dialCode: "+1242",
      languages: ["English"],
    ),
    CountryData(
      name: "Bahrain",
      code: "BH",
      dialCode: "+973",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Bangladesh",
      code: "BD",
      dialCode: "+880",
      languages: ["Bengali"],
    ),
    CountryData(
      name: "Barbados",
      code: "BB",
      dialCode: "+1246",
      languages: ["English"],
    ),
    CountryData(
      name: "Belarus",
      code: "BY",
      dialCode: "+375",
      languages: ["Belarusian", "Russian"],
    ),
    CountryData(
      name: "Belgium",
      code: "BE",
      dialCode: "+32",
      languages: ["Dutch", "French", "German"],
    ),
    CountryData(
      name: "Belize",
      code: "BZ",
      dialCode: "+501",
      languages: ["English", "Spanish"],
    ),
    CountryData(
      name: "Benin",
      code: "BJ",
      dialCode: "+229",
      languages: ["French"],
    ),
    CountryData(
      name: "Bermuda",
      code: "BM",
      dialCode: "+1441",
      languages: ["English"],
    ),
    CountryData(
      name: "Bhutan",
      code: "BT",
      dialCode: "+975",
      languages: ["Dzongkha"],
    ),
    CountryData(
      name: "Brazil",
      code: "BR",
      dialCode: "+55",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Canada",
      code: "CA",
      dialCode: "+1",
      languages: ["English", "French"],
    ),
    CountryData(
      name: "China",
      code: "CN",
      dialCode: "+86",
      languages: ["Chinese"],
    ),
    CountryData(
      name: "Egypt",
      code: "EG",
      dialCode: "+20",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "France",
      code: "FR",
      dialCode: "+33",
      languages: ["French"],
    ),
    CountryData(
      name: "Germany",
      code: "DE",
      dialCode: "+49",
      languages: ["German"],
    ),
    CountryData(
      name: "Ghana",
      code: "GH",
      dialCode: "+233",
      languages: ["English"],
    ),
    CountryData(
      name: "India",
      code: "IN",
      dialCode: "+91",
      languages: ["Hindi", "English", "Tamil", "Telugu", "Malayalam"],
    ),
    CountryData(
      name: "Indonesia",
      code: "ID",
      dialCode: "+62",
      languages: ["Indonesian"],
    ),
    CountryData(
      name: "Italy",
      code: "IT",
      dialCode: "+39",
      languages: ["Italian"],
    ),
    CountryData(
      name: "Japan",
      code: "JP",
      dialCode: "+81",
      languages: ["Japanese"],
    ),
    CountryData(
      name: "Kenya",
      code: "KE",
      dialCode: "+254",
      languages: ["English", "Swahili"],
    ),
    CountryData(
      name: "Mexico",
      code: "MX",
      dialCode: "+52",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Netherlands",
      code: "NL",
      dialCode: "+31",
      languages: ["Dutch"],
    ),
    CountryData(
      name: "New Zealand",
      code: "NZ",
      dialCode: "+64",
      languages: ["English", "Maori"],
    ),
    CountryData(
      name: "Nigeria",
      code: "NG",
      dialCode: "+234",
      languages: ["English"],
    ),
    CountryData(
      name: "Norway",
      code: "NO",
      dialCode: "+47",
      languages: ["Norwegian"],
    ),
    CountryData(
      name: "Pakistan",
      code: "PK",
      dialCode: "+92",
      languages: ["Urdu", "English"],
    ),
    CountryData(
      name: "Philippines",
      code: "PH",
      dialCode: "+63",
      languages: ["Filipino", "English"],
    ),
    CountryData(
      name: "Russia",
      code: "RU",
      dialCode: "+7",
      languages: ["Russian"],
    ),
    CountryData(
      name: "Saudi Arabia",
      code: "SA",
      dialCode: "+966",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Singapore",
      code: "SG",
      dialCode: "+65",
      languages: ["English", "Malay", "Tamil", "Chinese"],
    ),
    CountryData(
      name: "South Africa",
      code: "ZA",
      dialCode: "+27",
      languages: ["Afrikaans", "English", "Zulu", "Xhosa"],
    ),
    CountryData(
      name: "South Korea",
      code: "KR",
      dialCode: "+82",
      languages: ["Korean"],
    ),
    CountryData(
      name: "Spain",
      code: "ES",
      dialCode: "+34",
      languages: ["Spanish", "Catalan", "Galician", "Basque"],
    ),
    CountryData(
      name: "Sweden",
      code: "SE",
      dialCode: "+46",
      languages: ["Swedish"],
    ),
    CountryData(
      name: "Switzerland",
      code: "CH",
      dialCode: "+41",
      languages: ["German", "French", "Italian", "Romansh"],
    ),
    CountryData(
      name: "Thailand",
      code: "TH",
      dialCode: "+66",
      languages: ["Thai"],
    ),
    CountryData(
      name: "Turkey",
      code: "TR",
      dialCode: "+90",
      languages: ["Turkish"],
    ),
    CountryData(
      name: "Ukraine",
      code: "UA",
      dialCode: "+380",
      languages: ["Ukrainian"],
    ),
    CountryData(
      name: "United Arab Emirates",
      code: "AE",
      dialCode: "+971",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "United Kingdom",
      code: "GB",
      dialCode: "+44",
      languages: ["English"],
    ),
    CountryData(
      name: "United States",
      code: "US",
      dialCode: "+1",
      languages: ["English"],
    ),
    // Adding more countries to complete the list
    CountryData(
      name: "Bolivia",
      code: "BO",
      dialCode: "+591",
      languages: ["Spanish", "Quechua", "Aymara"],
    ),
    CountryData(
      name: "Bosnia and Herzegovina",
      code: "BA",
      dialCode: "+387",
      languages: ["Bosnian", "Croatian", "Serbian"],
    ),
    CountryData(
      name: "Botswana",
      code: "BW",
      dialCode: "+267",
      languages: ["English", "Tswana"],
    ),
    CountryData(
      name: "Bulgaria",
      code: "BG",
      dialCode: "+359",
      languages: ["Bulgarian"],
    ),
    CountryData(
      name: "Burkina Faso",
      code: "BF",
      dialCode: "+226",
      languages: ["French"],
    ),
    CountryData(
      name: "Burundi",
      code: "BI",
      dialCode: "+257",
      languages: ["Kirundi", "French"],
    ),
    CountryData(
      name: "Cambodia",
      code: "KH",
      dialCode: "+855",
      languages: ["Khmer"],
    ),
    CountryData(
      name: "Cameroon",
      code: "CM",
      dialCode: "+237",
      languages: ["English", "French"],
    ),
    CountryData(
      name: "Cape Verde",
      code: "CV",
      dialCode: "+238",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Central African Republic",
      code: "CF",
      dialCode: "+236",
      languages: ["French", "Sango"],
    ),
    CountryData(
      name: "Chad",
      code: "TD",
      dialCode: "+235",
      languages: ["French", "Arabic"],
    ),
    CountryData(
      name: "Chile",
      code: "CL",
      dialCode: "+56",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Colombia",
      code: "CO",
      dialCode: "+57",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Comoros",
      code: "KM",
      dialCode: "+269",
      languages: ["Arabic", "French", "Comorian"],
    ),
    CountryData(
      name: "Congo",
      code: "CG",
      dialCode: "+242",
      languages: ["French", "Lingala"],
    ),
    CountryData(
      name: "Costa Rica",
      code: "CR",
      dialCode: "+506",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Croatia",
      code: "HR",
      dialCode: "+385",
      languages: ["Croatian"],
    ),
    CountryData(
      name: "Cuba",
      code: "CU",
      dialCode: "+53",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Cyprus",
      code: "CY",
      dialCode: "+357",
      languages: ["Greek", "Turkish"],
    ),
    CountryData(
      name: "Czech Republic",
      code: "CZ",
      dialCode: "+420",
      languages: ["Czech"],
    ),
    CountryData(
      name: "Denmark",
      code: "DK",
      dialCode: "+45",
      languages: ["Danish"],
    ),
    CountryData(
      name: "Djibouti",
      code: "DJ",
      dialCode: "+253",
      languages: ["French", "Arabic"],
    ),
    CountryData(
      name: "Dominica",
      code: "DM",
      dialCode: "+1767",
      languages: ["English"],
    ),
    CountryData(
      name: "Dominican Republic",
      code: "DO",
      dialCode: "+1849",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Ecuador",
      code: "EC",
      dialCode: "+593",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "El Salvador",
      code: "SV",
      dialCode: "+503",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Equatorial Guinea",
      code: "GQ",
      dialCode: "+240",
      languages: ["Spanish", "French", "Portuguese"],
    ),
    CountryData(
      name: "Eritrea",
      code: "ER",
      dialCode: "+291",
      languages: ["Tigrinya", "Arabic", "English"],
    ),
    CountryData(
      name: "Estonia",
      code: "EE",
      dialCode: "+372",
      languages: ["Estonian"],
    ),
    CountryData(
      name: "Ethiopia",
      code: "ET",
      dialCode: "+251",
      languages: ["Amharic"],
    ),
    CountryData(
      name: "Fiji",
      code: "FJ",
      dialCode: "+679",
      languages: ["English", "Fijian", "Hindi"],
    ),
    CountryData(
      name: "Finland",
      code: "FI",
      dialCode: "+358",
      languages: ["Finnish", "Swedish"],
    ),
    CountryData(
      name: "Zimbabwe",
      code: "ZW",
      dialCode: "+263",
      languages: ["English", "Shona", "Ndebele"],
    ),
    CountryData(
      name: "Greece",
      code: "GR",
      dialCode: "+30",
      languages: ["Greek"],
    ),
    CountryData(
      name: "Greenland",
      code: "GL",
      dialCode: "+299",
      languages: ["Greenlandic", "Danish"],
    ),
    CountryData(
      name: "Grenada",
      code: "GD",
      dialCode: "+1473",
      languages: ["English"],
    ),
    CountryData(
      name: "Guatemala",
      code: "GT",
      dialCode: "+502",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Guinea",
      code: "GN",
      dialCode: "+224",
      languages: ["French"],
    ),
    CountryData(
      name: "Guinea-Bissau",
      code: "GW",
      dialCode: "+245",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Guyana",
      code: "GY",
      dialCode: "+592",
      languages: ["English"],
    ),
    CountryData(
      name: "Haiti",
      code: "HT",
      dialCode: "+509",
      languages: ["French", "Haitian Creole"],
    ),
    CountryData(
      name: "Honduras",
      code: "HN",
      dialCode: "+504",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Hungary",
      code: "HU",
      dialCode: "+36",
      languages: ["Hungarian"],
    ),
    CountryData(
      name: "Iceland",
      code: "IS",
      dialCode: "+354",
      languages: ["Icelandic"],
    ),
    CountryData(
      name: "Iran",
      code: "IR",
      dialCode: "+98",
      languages: ["Persian"],
    ),
    CountryData(
      name: "Iraq",
      code: "IQ",
      dialCode: "+964",
      languages: ["Arabic", "Kurdish"],
    ),
    CountryData(
      name: "Ireland",
      code: "IE",
      dialCode: "+353",
      languages: ["English", "Irish"],
    ),
    CountryData(
      name: "Israel",
      code: "IL",
      dialCode: "+972",
      languages: ["Hebrew", "Arabic"],
    ),
    CountryData(
      name: "Jamaica",
      code: "JM",
      dialCode: "+1876",
      languages: ["English"],
    ),
    CountryData(
      name: "Jordan",
      code: "JO",
      dialCode: "+962",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Kazakhstan",
      code: "KZ",
      dialCode: "+7",
      languages: ["Kazakh", "Russian"],
    ),
    CountryData(
      name: "Kiribati",
      code: "KI",
      dialCode: "+686",
      languages: ["English", "Gilbertese"],
    ),
    CountryData(
      name: "Kosovo",
      code: "XK",
      dialCode: "+383",
      languages: ["Albanian", "Serbian"],
    ),
    CountryData(
      name: "Kuwait",
      code: "KW",
      dialCode: "+965",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Kyrgyzstan",
      code: "KG",
      dialCode: "+996",
      languages: ["Kyrgyz", "Russian"],
    ),
    CountryData(
      name: "Laos",
      code: "LA",
      dialCode: "+856",
      languages: ["Lao"],
    ),
    CountryData(
      name: "Latvia",
      code: "LV",
      dialCode: "+371",
      languages: ["Latvian"],
    ),
    CountryData(
      name: "Lebanon",
      code: "LB",
      dialCode: "+961",
      languages: ["Arabic", "French"],
    ),
    CountryData(
      name: "Lesotho",
      code: "LS",
      dialCode: "+266",
      languages: ["Sesotho", "English"],
    ),
    CountryData(
      name: "Liberia",
      code: "LR",
      dialCode: "+231",
      languages: ["English"],
    ),
    CountryData(
      name: "Libya",
      code: "LY",
      dialCode: "+218",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Liechtenstein",
      code: "LI",
      dialCode: "+423",
      languages: ["German"],
    ),
    CountryData(
      name: "Lithuania",
      code: "LT",
      dialCode: "+370",
      languages: ["Lithuanian"],
    ),
    CountryData(
      name: "Luxembourg",
      code: "LU",
      dialCode: "+352",
      languages: ["Luxembourgish", "French", "German"],
    ),
    CountryData(
      name: "Madagascar",
      code: "MG",
      dialCode: "+261",
      languages: ["Malagasy", "French"],
    ),
    CountryData(
      name: "Malawi",
      code: "MW",
      dialCode: "+265",
      languages: ["English", "Chichewa"],
    ),
    CountryData(
      name: "Malaysia",
      code: "MY",
      dialCode: "+60",
      languages: ["Malay", "English"],
    ),
    CountryData(
      name: "Maldives",
      code: "MV",
      dialCode: "+960",
      languages: ["Dhivehi"],
    ),
    CountryData(
      name: "Mali",
      code: "ML",
      dialCode: "+223",
      languages: ["French"],
    ),
    CountryData(
      name: "Malta",
      code: "MT",
      dialCode: "+356",
      languages: ["Maltese", "English"],
    ),
    CountryData(
      name: "Marshall Islands",
      code: "MH",
      dialCode: "+692",
      languages: ["English", "Marshallese"],
    ),
    CountryData(
      name: "Mauritania",
      code: "MR",
      dialCode: "+222",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Mauritius",
      code: "MU",
      dialCode: "+230",
      languages: ["English", "French", "Creole"],
    ),
    CountryData(
      name: "Micronesia",
      code: "FM",
      dialCode: "+691",
      languages: ["English"],
    ),
    CountryData(
      name: "Moldova",
      code: "MD",
      dialCode: "+373",
      languages: ["Romanian"],
    ),
    CountryData(
      name: "Monaco",
      code: "MC",
      dialCode: "+377",
      languages: ["French"],
    ),
    CountryData(
      name: "Mongolia",
      code: "MN",
      dialCode: "+976",
      languages: ["Mongolian"],
    ),
    CountryData(
      name: "Montenegro",
      code: "ME",
      dialCode: "+382",
      languages: ["Montenegrin"],
    ),
    CountryData(
      name: "Morocco",
      code: "MA",
      dialCode: "+212",
      languages: ["Arabic", "Berber", "French"],
    ),
    CountryData(
      name: "Mozambique",
      code: "MZ",
      dialCode: "+258",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Myanmar",
      code: "MM",
      dialCode: "+95",
      languages: ["Burmese"],
    ),
    CountryData(
      name: "Namibia",
      code: "NA",
      dialCode: "+264",
      languages: ["English", "Afrikaans"],
    ),
    CountryData(
      name: "Nauru",
      code: "NR",
      dialCode: "+674",
      languages: ["Nauruan", "English"],
    ),
    CountryData(
      name: "Nepal",
      code: "NP",
      dialCode: "+977",
      languages: ["Nepali"],
    ),
    CountryData(
      name: "Nicaragua",
      code: "NI",
      dialCode: "+505",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Niger",
      code: "NE",
      dialCode: "+227",
      languages: ["French"],
    ),
    CountryData(
      name: "North Korea",
      code: "KP",
      dialCode: "+850",
      languages: ["Korean"],
    ),
    CountryData(
      name: "North Macedonia",
      code: "MK",
      dialCode: "+389",
      languages: ["Macedonian"],
    ),
    CountryData(
      name: "Oman",
      code: "OM",
      dialCode: "+968",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Palau",
      code: "PW",
      dialCode: "+680",
      languages: ["English", "Palauan"],
    ),
    CountryData(
      name: "Palestine",
      code: "PS",
      dialCode: "+970",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Panama",
      code: "PA",
      dialCode: "+507",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Papua New Guinea",
      code: "PG",
      dialCode: "+675",
      languages: ["English", "Tok Pisin", "Hiri Motu"],
    ),
    CountryData(
      name: "Paraguay",
      code: "PY",
      dialCode: "+595",
      languages: ["Spanish", "Guarani"],
    ),
    CountryData(
      name: "Peru",
      code: "PE",
      dialCode: "+51",
      languages: ["Spanish", "Quechua", "Aymara"],
    ),
    CountryData(
      name: "Poland",
      code: "PL",
      dialCode: "+48",
      languages: ["Polish"],
    ),
    CountryData(
      name: "Portugal",
      code: "PT",
      dialCode: "+351",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Qatar",
      code: "QA",
      dialCode: "+974",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Romania",
      code: "RO",
      dialCode: "+40",
      languages: ["Romanian"],
    ),
    CountryData(
      name: "Rwanda",
      code: "RW",
      dialCode: "+250",
      languages: ["Kinyarwanda", "French", "English"],
    ),
    CountryData(
      name: "Saint Kitts and Nevis",
      code: "KN",
      dialCode: "+1869",
      languages: ["English"],
    ),
    CountryData(
      name: "Saint Lucia",
      code: "LC",
      dialCode: "+1758",
      languages: ["English"],
    ),
    CountryData(
      name: "Saint Vincent and the Grenadines",
      code: "VC",
      dialCode: "+1784",
      languages: ["English"],
    ),
    CountryData(
      name: "Samoa",
      code: "WS",
      dialCode: "+685",
      languages: ["Samoan", "English"],
    ),
    CountryData(
      name: "San Marino",
      code: "SM",
      dialCode: "+378",
      languages: ["Italian"],
    ),
    CountryData(
      name: "Sao Tome and Principe",
      code: "ST",
      dialCode: "+239",
      languages: ["Portuguese"],
    ),
    CountryData(
      name: "Senegal",
      code: "SN",
      dialCode: "+221",
      languages: ["French"],
    ),
    CountryData(
      name: "Serbia",
      code: "RS",
      dialCode: "+381",
      languages: ["Serbian"],
    ),
    CountryData(
      name: "Seychelles",
      code: "SC",
      dialCode: "+248",
      languages: ["English", "French", "Seychellois Creole"],
    ),
    CountryData(
      name: "Sierra Leone",
      code: "SL",
      dialCode: "+232",
      languages: ["English"],
    ),
    CountryData(
      name: "Slovakia",
      code: "SK",
      dialCode: "+421",
      languages: ["Slovak"],
    ),
    CountryData(
      name: "Slovenia",
      code: "SI",
      dialCode: "+386",
      languages: ["Slovenian"],
    ),
    CountryData(
      name: "Solomon Islands",
      code: "SB",
      dialCode: "+677",
      languages: ["English"],
    ),
    CountryData(
      name: "Somalia",
      code: "SO",
      dialCode: "+252",
      languages: ["Somali", "Arabic"],
    ),
    CountryData(
      name: "South Sudan",
      code: "SS",
      dialCode: "+211",
      languages: ["English"],
    ),
    CountryData(
      name: "Sri Lanka",
      code: "LK",
      dialCode: "+94",
      languages: ["Sinhala", "Tamil"],
    ),
    CountryData(
      name: "Sudan",
      code: "SD",
      dialCode: "+249",
      languages: ["Arabic", "English"],
    ),
    CountryData(
      name: "Suriname",
      code: "SR",
      dialCode: "+597",
      languages: ["Dutch"],
    ),
    CountryData(
      name: "Eswatini",
      code: "SZ",
      dialCode: "+268",
      languages: ["English", "Swati"],
    ),
    CountryData(
      name: "Syria",
      code: "SY",
      dialCode: "+963",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Taiwan",
      code: "TW",
      dialCode: "+886",
      languages: ["Mandarin"],
    ),
    CountryData(
      name: "Tajikistan",
      code: "TJ",
      dialCode: "+992",
      languages: ["Tajik", "Russian"],
    ),
    CountryData(
      name: "Tanzania",
      code: "TZ",
      dialCode: "+255",
      languages: ["Swahili", "English"],
    ),
    CountryData(
      name: "Timor-Leste",
      code: "TL",
      dialCode: "+670",
      languages: ["Portuguese", "Tetum"],
    ),
    CountryData(
      name: "Togo",
      code: "TG",
      dialCode: "+228",
      languages: ["French"],
    ),
    CountryData(
      name: "Tonga",
      code: "TO",
      dialCode: "+676",
      languages: ["English", "Tongan"],
    ),
    CountryData(
      name: "Trinidad and Tobago",
      code: "TT",
      dialCode: "+1868",
      languages: ["English"],
    ),
    CountryData(
      name: "Tunisia",
      code: "TN",
      dialCode: "+216",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Turkmenistan",
      code: "TM",
      dialCode: "+993",
      languages: ["Turkmen", "Russian"],
    ),
    CountryData(
      name: "Tuvalu",
      code: "TV",
      dialCode: "+688",
      languages: ["Tuvaluan", "English"],
    ),
    CountryData(
      name: "Uganda",
      code: "UG",
      dialCode: "+256",
      languages: ["English", "Swahili"],
    ),
    CountryData(
      name: "Uruguay",
      code: "UY",
      dialCode: "+598",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Uzbekistan",
      code: "UZ",
      dialCode: "+998",
      languages: ["Uzbek", "Russian"],
    ),
    CountryData(
      name: "Vanuatu",
      code: "VU",
      dialCode: "+678",
      languages: ["Bislama", "English", "French"],
    ),
    CountryData(
      name: "Vatican City",
      code: "VA",
      dialCode: "+379",
      languages: ["Italian", "Latin"],
    ),
    CountryData(
      name: "Venezuela",
      code: "VE",
      dialCode: "+58",
      languages: ["Spanish"],
    ),
    CountryData(
      name: "Vietnam",
      code: "VN",
      dialCode: "+84",
      languages: ["Vietnamese"],
    ),
    CountryData(
      name: "Yemen",
      code: "YE",
      dialCode: "+967",
      languages: ["Arabic"],
    ),
    CountryData(
      name: "Zambia",
      code: "ZM",
      dialCode: "+260",
      languages: ["English"],
    ),
  ];

  // Add a getter for the countries list
  static List<CountryData> get allCountries {
    // Create a copy of the list to avoid modifying the original
    final sortedList = List<CountryData>.from(countries);
    // Sort alphabetically by name
    sortedList.sort((a, b) => a.name.compareTo(b.name));
    return sortedList;
  }

  // Helper methods
  static CountryData? getCountryByCode(String code) {
    try {
      return countries.firstWhere(
        (country) => country.code.toLowerCase() == code.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  static CountryData? getCountryByDialCode(String dialCode) {
    try {
      return countries.firstWhere(
        (country) => country.dialCode == dialCode,
      );
    } catch (e) {
      return null;
    }
  }

  static CountryData? getCountryByName(String name) {
    try {
      return countries.firstWhere(
        (country) => country.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  static List<CountryData> searchCountries(String query) {
    final lowercaseQuery = query.toLowerCase();
    return countries.where((country) {
      return country.name.toLowerCase().contains(lowercaseQuery) ||
          country.code.toLowerCase().contains(lowercaseQuery) ||
          country.dialCode.contains(query);
    }).toList();
  }
}
