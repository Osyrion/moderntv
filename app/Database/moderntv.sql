create database moderntvdb character set utf8;

-- Channel Groups

CREATE TABLE moderntvdb.ChannelGroups (
  `id` varchar(15) PRIMARY KEY,
  `name` varchar(40) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO moderntvdb.ChannelGroups (`id`, `name`, `order`) VALUES
('documentary', 'Documentary', 40),
('erotic', 'Erotic', 100),
('foreign', 'Foreign', 90),
('general', 'General', 10),
('children', 'Children', 30),
('movie', 'Movie', 60),
('music', 'Music & Lifestyle', 80),
('news', 'News', 70),
('other', 'Other', 110),
('regional', 'Regional', 85),
('sport', 'Sport', 20);

-- Channels

CREATE TABLE moderntvdb.Channels (
  `id` varchar(50) PRIMARY KEY,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1000,
  `channelGroup` varchar(15) DEFAULT NULL,
  `description` varchar(2000) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

ALTER TABLE moderntvdb.Channels
  ADD KEY `i_channelGroup` (`channelGroup`),
  ADD CONSTRAINT `c_channelGroup` FOREIGN KEY (`channelGroup`) REFERENCES `ChannelGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO moderntvdb.Channels (`id`, `name`, `order`, `channelGroup`, `description`) VALUES
('barrandov', 'TV Barrandov', 135, 'general', 'Programovou skladbu tvoří zábavné pořady,  telenovely, soutěžní pořady a pořady pro nejmenší.'),
('barrandov_muzika', 'Barrandov News', 141, 'general', 'Zpravodajský kanál TV Barrandov'),
('barrandovplus', 'Barrandov Krimi', 137, 'movie', 'Třetí program Barrandova myslí jak na mladší publikum s dopoledním blokem pořadů pro děti, tak na velkou diváckou obec s odpoledními a večerními dokumenty a seriály (příroda, cestování, kulinářství).'),
('bbc', 'BBC World', 215, 'foreign', ''),
('brno1', 'TV Brno 1', 261, 'regional', 'Regionální zpravodajství a publicistika, dokumenty, lifestylové a tematické pořady.'),
('cartoon_network_hd', 'Cartoon Network HD', 95, 'children', 'Oblíbené animované seriály, postavičky a hrdinové.'),
('ct1', 'ČT1', 31, 'general', 'Hlavní kanál české veřejnoprávní televize s nabídkou pořadů napříč žánry.'),
('ct2', 'ČT2', 52, 'general', 'Druhý kanál České televize s nabídkou seriálů, dokumentů a klasických filmových děl.'),
('ct24', 'ČT24', 63, 'news', 'Zpravodajství České televize, rozhovory, komentáře.'),
('ct4sport', 'ČT Sport', 57, 'sport', 'Sportovní program České televize, 24 hodin denně.'),
('ctart', 'ČT art', 60, 'general', 'Program České televize pro kulturní fanoušky vystřídá každý večer program ČT :D.'),
('ctdecko', 'Déčko', 54, 'children', 'Dětský program České televize.'),
('fanda', 'Nova Action', 89, 'general', 'Nova Action přináší akční a detektivní seriály. Sportovní přenosy z fotbalu, hokeje, tenisu. Dále NHL, NBA, Box, UFC, Poker Tour, MotoGP, Golf.'),
('filmpro', 'Filmpro', 320, 'regional', 'Regionální kanál zaměřený na Klatovský kraj'),
('fireplace', 'Krb', 426, 'other', 'Na počkání vykouzlíte dokonalou iluzi krbu ve Vašem obýváku i včetně praskání dřeva!'),
('france24', 'France 24', 289, 'news', 'Francouzský zpravodajský kanál vysílající 24 hodin denně. Vysílání v angličtině.'),
('france24_fr', 'France 24 (FR)', 290, 'news', 'Francouzký zpravodajský kanál vysílající 24 hodin denně. Vysílání ve francouzštině.'),
('hobby', 'Hobby TV', 308, 'music', 'Nový lifestylový televizní kanál zaměřený na hobby, především pak architekturu, interiérový design a zahradu, ale na své si přijdou i fanoušci, jež rádi sledují pořady o zvířatech, vaření, módě, kultuře, hudbě, cestování a spoustu dalších zajímavých témat.'),
('info_tv_brno', 'Info TV Brno a jižní morava', 500, 'regional', ''),
('jojfamily', 'JOJ Family', 119, 'general', 'Oblíbene slovenská produkce z dílny TV JOJ.'),
('kinobarrandov', 'Kino Barrandov', 139, 'movie', 'Program plný filmů a seriálů evropské i světové produkce. 24 hodin denně, česky.'),
('kinosvet', 'CS Mystery', 242, 'documentary', 'Cestopisné a historické dokumenty, dokumenty o filmech.'),
('loop_naturetv_mumlava_waterfalls', 'Mumlavské vodopády', 440, 'other', ''),
('loop_naturetv-galerie-zvirat', 'Galerie zvířat', 901, 'other', ''),
('loop_naturetv-osetrovani-mladat', 'Ošetřování mláďat', 901, 'other', ''),
('lounge', 'Lounge TV', 255, 'music', 'Česko - slovenský kanál nabízí unikátní spojení relaxačních videí a hudby. Sledujte dechberoucí záběry, zprávy, videa a živé přenosy z různých koutů světa. '),
('markizaint', 'Markíza International', 110, 'general', 'TV Markíza je najsledovanejšia súkromná televízia. Pestrá ponuka zahraničných filmov a seriálov vrátane programov z vlastnej produkcie.'),
('mnamtv', 'TV Mňam', 310, 'music', 'Přináší nejlepší kulinářská show. Šéfkuchaři vám v pořadech věnovaných vaření vysvětlí krok za krokem, jak připravit ty nejlahodnější pokrmy.'),
('mnau', 'TV Mňau', 313, 'other', 'Kanál je zaměřen na svět psů, koček, papoušků a dalších domácích mazlíčků.'),
('nasatv', 'NASA TV', 354, 'other', 'Dechberoucí záběry z vesmíru.'),
('nasatv_uhd', 'NASA TV UHD', 360, 'other', 'Přenosy z vesmírné stanice v Ultra vysokém rozlišení.'),
('natura', 'TV Natura', 181, 'music', 'Inspirujte se, jak žít zdravě, v souladu s přírodou a jak pracovat na svém osobním rozvoji. '),
('nova', 'Nova', 83, 'general', 'TV Nova je dlouhodobě nejsledovanější televizí v Česku. V dnešní době jsou jejím nejúspěšnějším pořadem Televizní noviny a seriály z vlastní produkce.'),
('novacinema', 'Nova Cinema', 87, 'movie', 'Nova Cinema je česká komerční televizní stanice, která je zaměřena na zahraniční produkci filmů, seriálů, reality show a filmově zaměřené pořady.'),
('ocko', 'Óčko', 121, 'music', 'Největší část programu TV Óčko tvoří hudební videoklipy, přes den k aktuální domácí i zahraniční populární hudbě, večer starší písně. Stanice dává prostor i menšinovým hudebním žánrům a součástí vysílání jsou také přímé přenosy či záznamy koncertů a hitparády.'),
('ocko_express', 'Óčko Expres', 125, 'music', 'ÓČKO EXPRES přináší to nejlepší ze současné hudby bez kompromisů a balastu - od indie kytarovek přes inteligentní elektro-pop až po drum \'n\' bass a dubstep.'),
('ockogold', 'Óčko STAR', 123, 'music', 'Óčko STAR se zaměřuje na největší hity od 60. až do současnosti. Program je zaměřen na muže i ženy od 25 do 45 let. Přináší domácí i světové hity. Profilovými hvězdami jsou světoví a domácí idoly jako Robbie Williams, Michael Jackson, Adele, Madonna, Rihanna, Pink, U2, Coldplay, Chinaski, Kryštof, Lucie, No Name, Ewa Farna, Richard Müller a další.'),
('orf1', 'ORF eins', 281, 'foreign', 'Rakouský veřejnoprávní televizní kanál.'),
('orf2', 'ORF zwei', 282, 'foreign', 'Druhý rakouský veřejnoprávní televizní kanál.'),
('Polar', 'Polar', 258, 'regional', 'Moravskoslezská regionální televize.'),
('praha', 'TV Praha', 262, 'regional', ''),
('prima_krimi', 'Prima Krimi', 82, 'movie', ''),
('prima_max', 'Prima Max', 79, 'movie', 'Filmové trháky i novinky z české i zahraniční produkce.'),
('primacomedy', 'Prima Comedy Central', 81, 'movie', 'Populární zahraniční seriály v českém znění.'),
('primacool', 'Prima COOL', 73, 'general', 'Druhý program Primy se zaměřuje na pánskou část publika: cool filmy a cool seriály. 18 hodin denně, česky.'),
('primafamily', 'Prima', 70, 'general', 'Pestrá nabídka pořadů včetně bohaté vlastní tvorby.'),
('primalove', 'Prima Love', 75, 'general', 'Kanál určený dámskému publiku. Seriály, romantické filmy, reality show.'),
('primazoom', 'Prima Zoom', 77, 'documentary', 'Dokumentární pořady ze všech oblastí.'),
('regiotv', 'regionalnitelevize.cz', 268, 'regional', 'Regionální zpravodajství ze všech regionů České republiky.'),
('retro', 'Retro', 192, 'music', 'Český hudební kanál, super muzika od 60tých do 90tých let.'),
('rt_doc', 'RT Documentary', 293, 'documentary', 'Dokumenty o zajímavostech z Ruska i celého světa.'),
('rt_ustecko', 'RT Ústecko', 3022, 'regional', 'RT Ustecko'),
('rtm_plus_liberec', 'RTM+ (Liberecko)', 263, 'regional', 'Regionální informace z Libereckého kraje'),
('russiatoday', 'Russia Today', 291, 'news', 'Ruský zpravodajský kanál'),
('Seznam', 'Televize Seznam', 67, 'general', 'Televize Seznam denně informuje o nejzásadnějších událostech a přináší aktuality z domova i zahraničí. Věnuje se kauzám, které hýbou českou společností, a představuje zajímavé osobnosti ze světa politiky, ekonomiky, kultury, sportu i dalších oblastí. Aktuální zpravodajské, publicistické i dokumentární pořady přináší nezávislé informace, kterým můžete důvěřovat. O zábavu se postarají pořady o životním stylu a seriály z produkce Stream.cz.'),
('sky_news', 'Sky News', 287, 'news', ''),
('slagr', 'Šlágr TV', 277, 'music', 'Původní český hudební program s nejlepší českou muzikou pro starší a pokročilé.'),
('slagr2', 'Šlágr 2', 278, 'music', ''),
('slovacko', 'TVS', 259, 'regional', 'Příjměte pozvání k výpravám za zajímavým děním v regionech od Kyjova, Hodonína, Uherského Hradiště, až po Zlínsko nebo Veselsko.'),
('slovak_sport2', 'Arena sport 2', 176, 'sport', 'Fotbalové ligy, hokejové ligy, česká Mattoni a evropské basketbalové ligy a atletika jsou základem druhého programu Slovak Sportu.'),
('smichov', 'Nova 2', 91, 'general', 'Smíchov je česká komerční televizní stanice, patřící k Nova Group, která svůj program zaměřuje výhradě na pořady, seriály či filmy komediálního žánru.'),
('stork_nest', 'Čapí hnízdo', 443, 'other', 'Reality show ze života čápů, úchvatný pohled do čapího hnízda, sledujte každodenní život na komíně blízko vesnice Bolešov na Slovensku. '),
('stv1', 'Jednotka', 100, 'general', 'Slovenská verejnoprávna televízia (RTVS) ponúka vysielanie televíznych programov pre všetky vekové kategórie.'),
('stv2', 'Dvojka', 104, 'general', 'Druhý okruh slovenskej televízie (RTVS), ktorý vysiela programy pre náročného diváka.'),
('stv3', 'Trojka', 106, 'general', ''),
('ta3', 'TA3', 113, 'news', 'V programovej štruktúre TA3 sa nachádza spravodajstvo (domáce, zahraničné, ekonomické, regionálne, športové), kultúra, politická publicistika.'),
('telka', 'Nova Gold', 93, 'general', 'Telka je česká komerční televizní stanice patřící k Nova Group, v jejíž programu se nachází nabídka seriálů a pořadů z archivu stanice Nova'),
('travelxp', 'Travelxp', 146, 'documentary', 'Cestovatelský kanál.'),
('TVlife', 'Life TV', 205, 'other', 'Slovenská křesťanská televize.'),
('tvnoe', 'TV Noe', 257, 'general', 'Nekomerční české křesťanské médium.'),
('uatv', 'UA TV', 288, 'foreign', 'Ukrajinská televizní stanice. '),
('uscenes_cat_cafe', 'Kočičí kavárna', 431, NULL, ''),
('uscenes_coral_garden', 'Korálová zahrada', 432, NULL, 'Pokochejte se pohledem na rybičky, které nemusíte krmit.'),
('uscenes_hammock_beach', 'Pláž', 433, NULL, ''),
('v1tv', 'V1 TV', 260, 'regional', 'Regionální televize pro Pardubický a Královehradecký kraj.');