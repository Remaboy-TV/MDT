CREATE TABLE `user_mdt` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`notes` varchar(255) DEFAULT NULL,
	`mugshot_url` varchar(255) DEFAULT NULL,
	`bail` bit DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `vehicle_mdt` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`plate` varchar(255) DEFAULT NULL,
	`stolen` bit DEFAULT 0,
	`notes` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `user_convictions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`offense` varchar(255) DEFAULT NULL,
	`count` int(11) DEFAULT NULL,
	
	PRIMARY KEY (`id`)
);

CREATE TABLE `mdt_reports` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`char_id` int(11) DEFAULT NULL,
	`title` varchar(255) DEFAULT NULL,
	`incident` longtext DEFAULT NULL,
    `charges` longtext DEFAULT NULL,
    `author` varchar(255) DEFAULT NULL,
	`name` varchar(255) DEFAULT NULL,
    `date` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `mdt_warrants` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) DEFAULT NULL,
	`char_id` int(11) DEFAULT NULL,
	`report_id` int(11) DEFAULT NULL,
	`report_title` varchar(255) DEFAULT NULL,
	`charges` longtext DEFAULT NULL,
	`date` varchar(255) DEFAULT NULL,
	`expire` varchar(255) DEFAULT NULL,
	`notes` varchar(255) DEFAULT NULL,
	`author` varchar(255) DEFAULT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
	
       PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`) VALUES
	(1, '§1 Manglende lys', 1500, 0, 0),
	(2, '§2 Feil bruk av lydsignal', 1500, 0, 0),
	(3, '§3 Kryssing av sperrelinje', 1700, 0, 0),
	(4, '§4 Kjøring i feil kjørefelt', 1500, 0, 0),
	(5, '§5 Ulovlig U-sving', 1000, 0, 0),
	(6, '§6 Kjøring i utmark', 2500, 0, 0),
	(7, '§7 Ulovlig parkering', 750, 0, 0),
	(8, '§8  Kjøring i ruspåvirket tilstand', 6500, 0, 12),
	(9, '§9 Brudd på stoppeplikt', 1500, 0, 0),
	(10, '§10 Uforsvarlig forbikjøring', 1500, 0, 0),
	(11, '§11a Fartsovertredelse 10-29 km/t', 2000, 0, 0),
	(12, '§11b Fartsovertredelse 30-49 km/t', 4000, 0, 0),
	(13, '§11c Fartsovertredelse >50 km/t', 7500, 0, 12),
	(14, '§12 Kjøring uten hjelm (MC)', 1500, 0, 0),
	(15, '§13 Kjøring uten gyldig førerkort', 10000, 0, 0),
	(16, '§14 Uaktsom kjøring', 5000, 0, 0),
	(17, '§15 Grov uaktsom kjøring', 10000, 0, 24),
	(18, '§16 Mangel på registrering av kjøretøy', 3000, 0, 0),
	(19, '§17 Bruk av mobiltelefon under kjøring', 1500, 0, 0),
	(20, '§131 Terrorhandlinger', 60000, 0, 75),
	(21, '§155 Vold, trusler, skadeverk eller annen rettstridig atferd mot offentlig tjenesteperson', 12000, 0, 20),
	(22, '§155a Grov vold, trusler, skadeverk eller annen rettstridig atferd mot offentlig tjenesteperson', 22000, 0, 35),
	(23, '§156 Hindring av offentlig tjenestemann', 5000, 0, 10),
	(24, '§157 Motarbeiding av rettsvesenet', 9000, 0, 15),
	(25, '§158 Grov motarbeiding av rettsvesenet', 18000, 0, 26),
	(26, '§160 Bevispåvirkning og unndragning fra strafforfølgning mv.', 9000, 0, 20),
	(27, '§162 Brudd på identifikasjonsplikten', 5000, 0, 0),
	(28, '§164 Ulovlig myndighetsutøving', 13000, 0, 25),
	(29, '§165 Misbruk av offentlig uniform, kjennetegn eller tittel mv.', 15000, 0, 15),
	(30, '§167  Ulovlig yrkes- eller virksomhetsutøvelse', 12000, 0, 0),
	(31, '§181 Ordensforstyrrelse', 3500, 0, 0),
	(32, '§182 Opptøyer', 10000, 0, 6),
	(33, '§183 Oppfordring til en straffbar handling', 8000, 0, 10),
	(34, '§185 Hatefulle ytringer', 10000, 0, 0),
	(35, '§187 Falsk alarm', 4000, 0, 0),
	(36, '§188 Uforsiktig omgang med skytevåpen eller eksplosiver', 7500, 0, 14),
	(37, '§189 Ulovlig bevæpning på offentlig sted', 7500, 0, 10),
	(38, '§189a Grov ulovlig bevæpning på offentlig sted', 18000, 0, 25),
	(39, '§190  Ulovlig befatning med skytevåpen, våpendeler, utgangsstoffer for eksplosiver', 10000, 0, 15),
	(40, '§191 Grov ulovlig befatning med skytevåpen, våpendeler, eksplosiver og utgangsstoffer for eksplosiver', 18000, 0, 30),
	(41, '§198 Forbund om alvorlig organisert kriminalitet', 30000, 0, 45),
	(42, '§202 Identitetskrenkelse', 7500, 0, 10),
	(43, '§204 Innbrudd i datasystem', 6000, 0, 10),
	(44, '§209 Brudd på taushetsplikt', 10000, 0, 25),
	(45, '§211 Brudd på taushetsplikt for enkelte yrkesgrupper', 15000, 0, 15),
	(46, '§221 Uriktig forklaring', 3500, 0, 6),
	(47, '§224 Vilkårlig anklage', 6000, 0, 12),
	(48, '§231 Narkotikaovertredelse', 5000, 0, 5),
	(49, '§232 Grov narkotikaovertredelse', 13000, 0, 20),
	(50, '§254 Frihetsberøvelse', 16000, 0, 22),
	(51, '§255 Grov frihetsberøvelse', 25000, 0, 48),
	(52, '§263 Trusler', 8000, 0, 12),
	(53, '§264 Grove trusler', 20000, 0, 36),
	(54, '§266 Hensynsløs atferd', 3000, 0, 6),
	(55, '§273 Kroppsskade', 9000, 0, 15),
	(56, '§274 Grov kroppsskade', 16000, 0, 30),
	(57, '§275 Drap', 125000, 0, 100),
	(58, '§286 Vold mot særskilt utsatte yrkesgrupper', 11000, 0, 18),
	(59, '§287 Forsømmelse av hjelpeplikt', 21000, 0, 10),
	(60, '§288 Hensettelse i hjelpeløs tilstand mv.', 25000, 0, 10),
	(61, '§321 Personran', 8000, 0, 10),
	(62, '§322 Grovt personran', 12000, 0, 18),
	(63, '§327 Ran', 10000, 0, 24),
	(64, '§328 Grovt ran', 25000, 0, 48),
	(65, '§330 Utpressing', 10000, 0, 24),
	(66, '§337 Hvitvasking', 80000, 0, 62),
	(67, '§342 Brukstyveri av motorvogn mv.', 9000, 0, 8),
	(68, '§361 Dokumentfalsk', 15000, 0, 10),
	(69, '§371 Bedrageri', 45000, 0, 12),
	(70, '§387 Korrupsjon', 30000, 0, 24),
	(71, '§388 Grov korrupsjon', 60000, 0, 65),
	(72, '§400 Nektet å følge pålegg', 5000, 0, 6),
	(73, '§750 Ulovlig jakt/fiske', 15000, 0, 0);
