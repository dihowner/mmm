-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2017 at 11:27 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ponzi`
--

-- --------------------------------------------------------

--
-- Table structure for table `bankaccount`
--

CREATE TABLE `bankaccount` (
  `bid` int(255) NOT NULL,
  `participant` varchar(255) NOT NULL,
  `bankName` varchar(255) NOT NULL,
  `merchantName` varchar(255) NOT NULL,
  `merchantNo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bankaccount`
--

INSERT INTO `bankaccount` (`bid`, `participant`, `bankName`, `merchantName`, `merchantNo`) VALUES
(1, '9', 'GUARANTY TRUST BANK', 'IPELE JOSHUA TEMITOPE', '0129058404'),
(2, '1', 'GUARANTY TRUST BANK', 'OGUNDOWOLE RAHEEM OPEYEMI', '0124336462'),
(3, '2', 'GUARANTY TRUST BANK', 'IKEANYIONWU CHIEDOZIE EMMANUEL', '0232440246'),
(4, '3', 'GUARANTY TRUST BANK', 'EZE VICTOR CHINEDU', '0122525824'),
(5, '4', 'FIRST BANK', 'SOYEWO OLUWATOYIN GBENGA', '3064805828'),
(6, '5', 'FIRST BANK', 'KAZEEM AZEEZAT TAIWO', '3091770513'),
(7, '6', 'SKYE BANK', 'RAHEEM DAMILOLA ADEOLA', '3024231206'),
(8, '7', 'GTB', 'ABALU CHIGOZIE REX', '0238542025'),
(9, '8', 'WEMA BANK', 'MUNIRU AHMED OLASUNKANMI', '0231827823'),
(10, '10', 'DIAMOND BANK', 'SILVIO NNAEMEKA NWANERI', '0079600810'),
(11, '13', 'DIAMOND', 'AJAYI EBENEZER', '0077590483'),
(12, '17', 'GTBANK', 'FASAKIN ADEWUMI', '0029643902'),
(13, '19', 'WEMA BANK PLC', 'ABOSEDE OLUWASEUN ABRAHAM', '0231766522'),
(14, '20', 'SKYE BANK', 'GIWA ABDULAHI AKINDELE', '3021187900'),
(15, '22', 'WEMA BANK PLC', 'ABOSEDE OLUWASEUN ABRAHAM', '0231766522'),
(16, '23', 'DIAMOND BANK', 'LAWRENCE OGECHUKWU CHINWEZE', '0042780091'),
(17, '24', 'FIRST BANK ', 'NWOGWUGWU SYDNEY IFEANYI ', '3095634154'),
(18, '25', 'GTBANK', 'BARINEM BAKPO', '0151300919'),
(19, '28', 'FIDELITY', 'BARINEM BAKPO', '6231169531'),
(20, '29', 'SKYE BANK', 'ADESOLA CAROLINE EZE', '1013596194'),
(21, '30', 'FIRST BANK', 'OFOKA CHIOMA LUCY', '3092860121'),
(22, '32', 'ACCESS BANK', 'FEMI ADEKUNLE', '0691003229'),
(23, '33', 'GTBANK', 'OLOWE OLUFEMI ISRAEL', '0157450005'),
(24, '34', 'ACCESS BANK ', 'ARIYO RUTH N.', '0707001629'),
(25, '31', 'WEMA BANK', 'AROWOLO ALIU ADEKUNLE ', '0231925970'),
(26, '36', 'WEMA', 'STEPEHEN ABBEY', '1105324689'),
(27, '37', 'WEMA BANK', 'AROWOLO ALIU ADEKUNLE ', '0231925970'),
(28, '39', 'GTB BANK', 'ADEYOJU ISRAEL', '2728949735'),
(29, '40', 'ACCESS BANK', 'ODEYEMI STEPHEN OLUWASEUN ', '0014641967'),
(30, '45', 'FIRST BANK', 'LAWRENCE FEMI', '3101074125'),
(31, '46', 'SKYE BANK', 'OSUOLALE FAROUQ ADEKOLA', '3027013256'),
(32, '14', 'ACCESS BANK ', 'KAYODE FAITH OLUWATOSIN ', '0725553018'),
(33, '47', 'SKYE BANK ', 'AWOSOLA ADEOLUWA SAMUEL ', '3046898777'),
(34, '49', 'GTBANK ', 'OYEDEPO SESAN SAMUEL ', '0117712332'),
(35, '50', 'WEMA BANK ', 'OJO AYODELE E', '0229527438'),
(36, '51', 'FIRST BANK ', 'OBASIPE TOLULOPE  ESTHER ', '3097541137'),
(37, '14', 'ACCESS BANK ', 'KAYODE FAITH OLUWATOSIN ', '0725553018'),
(38, '52', 'GTBANK ', 'EWEJOBI  OLAJIDE ADEYEMI ', '0149490684'),
(39, '54', 'SKYE BANK', 'TAIWO SEUN OLORUNFEMI', '1130203771'),
(40, '55', 'FIRST BANK', 'TAIWO SEUN OLORUNFEMI', '3110555271'),
(41, '11', 'FIRST BANK ', 'KAYODE EUNICE OGHENEVIARHE', '3066955174'),
(42, '58', 'ZENITH BANK ', 'BAYODE JOSEPH ', '2113248504'),
(43, '60', 'GT BANK', 'EZE UCHE', '0109552496'),
(44, '64', 'ACCESS BANK', 'AROWOSAYE OLARENWAJU MARIAM', '0050083466'),
(45, '65', 'ACCESS BANK', 'TOYIN ALONGE', '0689621790'),
(46, '66', 'GTBANK', 'OLOGUN OLUWAFEMI EBENEZER', '0148379023'),
(47, '67', 'SKYE BANK ', 'OMOTOSHO EMMANUEL K', '3030364554'),
(48, '69', 'UBA BANK', 'ASIRU AYODELE IBRAHIM', '2031933953'),
(49, '71', 'GTB', 'FAKOREDE TIMILEHIN DAVID', '0240146606'),
(50, '72', 'GTBANK', 'AKINADE TAIWO SAMUEL ', '0210273309'),
(51, '43', 'UBA', 'QUADRI MAYODELE OLALEKAN', '2043430013'),
(52, '75', 'SKYE BANK PLC', 'TAJUDEEN OPEYEMI SHAKIRU', '3027449763'),
(53, '76', 'FIRST BANK', 'ONAOLAPO TIMILEYIN ABAYOMI', '3090200103'),
(54, '78', 'FCMB', 'OLUKANNI OLALEKAN OREOLUWA', '4110500015'),
(55, '79', 'GTB', 'SAMUEL A. O', '0130173307'),
(56, '80', 'SKYE BANK', 'CAROLINE ADESOLA EZE', '1013596194'),
(57, '82', 'SKYE BANK', 'ADESOLA CAROLINE EZE', '1013596194'),
(58, '86', 'ZENITH BANK ', 'BAYODE JOSEPH ', '2113248504'),
(59, '87', 'DIAMOND BANK', 'OLUCHUKWU UFONDU', '0071423923'),
(60, '89', 'ACCESS BANK ', 'UFONDU SOMADINA', '0706224513'),
(61, '90', 'FIRST-BANK', 'ONAOLAPO TIMILEYIN ABAYOMI', '3090200103'),
(62, '85', 'SKYE BANK', 'CAROLINE ADESOLA EZE', '1013596194'),
(63, '92', 'DIAMOND BANK ', 'Fapohunda Oluwagbenga Kolade', '8880686070'),
(64, '93', 'HERITAGE BANK', 'OMOWUMI OMOLARA AROWOSAYE', '1001236916'),
(65, '94', 'FIRSTBANK', 'AKIOJANO VICTOR ', '3090353009'),
(66, '95', 'WEMA BANK', 'OBE OLUWAGBEMIGA', '0233525769'),
(67, '59', 'FCMB', 'BADMUS LUKMAN ABIDEMI', '4352777017'),
(68, '97', 'HERITAGE BANK', 'BADMOS KAFAYAT', '1500345845'),
(69, '96', 'FIRST BANK', 'IKEANYIONWU CHIAMAKA', '3048700381'),
(70, '99', 'ACCESS BANK', 'OLA OLUWAKAYODE VICTOR', '0014354650'),
(71, '100', 'FIRST BANK', 'AMBALI  RASHEED', '3100234621'),
(72, '101', 'SKYE BANK', 'BOLARINWA AZEEZ GBOLAHAN', '1130203726'),
(73, '102', 'STANBIC BANK', 'BADMOS RAHSEED', '0018681104'),
(74, '104', 'STANBIC IBTC', 'JUSTIN OBINNA JOSEPH', '0020363618'),
(75, '105', 'ACCESS BANK', 'OLUWATOYIN DEBORAH AYANDIRAN', '0050038143'),
(76, '106', 'FIRST BANKE', 'CAROLINE ADESOLA EZE', '3035132469'),
(77, '107', 'FCMB', 'BADMUS KAFAYAT', '4022393011'),
(78, '108', 'SKYE BANK PLC', 'TAJUDEEN OPEYEMI SHAKIRU', '3027449763'),
(79, '109', 'ACCESS BANK', 'MARYAM GARBA', '0689758566'),
(80, '111', 'DIAMOND BANK ', 'EZE EMMANUEL ONYEDIKACHI ', '0065178798'),
(81, '112', 'GTBANK', 'OYELEKE OLAMILEKAN OYEWALE ', '0150595150'),
(82, '113', 'FCMB', 'OLALEKAN IDRIS AYUBA', '3973174010'),
(83, '115', 'ACCESS BANK', 'ABIOLA AKANBI ADEBAYO', '0002981798'),
(84, '116', 'FIRST BANK', 'RUTH TORIOLA CHIOMA', '3101159600'),
(85, '117', 'ACCESS BANK', 'ALONGE ADENIKE ISLAMIYAT', '0059320049'),
(86, '119', 'ACCESS BANK', 'ALONGE ADEYEMI SULAIMON', '0726687316'),
(87, '120', 'DIAMOND BANK', 'AKU KIZITO C', '0035645611'),
(88, '122', 'ACCESS BANK', 'VICTORIA ADISA', '0688922689'),
(89, '123', 'HERITAGE BANK', 'DAMILOLA M AROWOSAYE', '1001214891'),
(90, '124', 'SKYE BANK', 'ADEGBOLA ABDUL LATEEF', '1130198996'),
(91, '126', 'ACCESS BANK', 'EZE VICTOR', '0720438420'),
(92, '127', 'FIRST BANK', 'IKEANYIONWU CHIEDOZIE ', '3046381584'),
(93, '114', 'WEMA BANK', 'POPOOLA BUKOLA', '0232425147'),
(94, '128', 'ACCESS BANK', 'IPELE JOSHUA TEMITOPE', '0725687986'),
(95, '129', 'SKYE BANK', 'MUIDEEN OLAMILEKAN', '3011397511'),
(96, '130', 'ACCESS BANK PLC', 'AJIBADE OLUWATOSIN ESTHER', '0702668609'),
(97, '133', 'SKYE BANK', 'JIMOH ZAINAB OLAITAN', '3026561750'),
(98, '41', 'FIRSTBANK', 'AJIBADE BAYONLE SAMUEL', '3073676598'),
(99, '136', 'GTB', 'OGUNDIRAN SAMUEL OLAITAB', '0217980240'),
(100, '137', 'SKYE BANK', 'MUDATHIR SULIHAT OMOTAYO', '3027459193'),
(101, '138', 'ACCESS BANK', 'BAMIJI DAMILOLA SUSAN', '0059030535'),
(102, '139', 'ACCESS BANK', 'POPE NIGGA', '0694730238'),
(103, '142', 'SKYE BANK', 'BETIKU ABIGAIL', '3011632300'),
(104, '144', 'GTB ', 'ADEWOYE STEPHEN ', '0152583885'),
(105, '145', 'UBA', 'ESTHER OMOLADE AKINMADE ', '2000394042'),
(106, '146', 'ACCESSBANK ', 'AJIBADE KEHINDE TOLANI', '0709127354'),
(107, '147', 'STANBIC IBTC', 'OLADIMEJI OLANREWAJU EMMANUEL', '9305036997'),
(108, '148', 'FIRST BANK', 'OLUSIJI OPEYEMI', '3113994378'),
(109, '149', 'WEMA BANK', 'AROWOLO ALIU ADEKUNLE ', '0231925970'),
(110, '153', 'ACCESS', 'FATO ATINUKE LINDA', '0710297893'),
(111, '154', 'ACCESS BANK', 'IBRAHIM ISMAILA', '0059029524'),
(112, '155', 'UBA', 'OLANREWAJU OLUWASEUN ', '2035658401'),
(113, '156', 'GTBANK', 'ADEYEYE ADEDOYIN E.', '0159323996'),
(114, '157', 'ZENITH', 'FATO ATINUKE LINDA', '2008929699'),
(115, '150', 'FIRST BANK', 'CAROLINE EZE', '3035132469'),
(116, '158', 'ZENITH BANK', 'AWOLOLA PELUMI JOSHUA', '2208628242'),
(117, '159', 'DIAMOND BANK', 'PRECIOUS CHIBUEZE', '0080683062'),
(118, '160', 'ACESS', 'ABULDRASHEED RUKAYAT OMOLARA', '0711702536'),
(119, '161', 'GT BANK', 'EZE UCHE', '0109552496'),
(120, '163', 'ACCESS', 'FASAKIN AYODEJI', '0718887027'),
(121, '164', 'ACCESS BANK PLC', 'AGUH JACINTA O.', '0018504446'),
(122, '166', 'ECO BANK', 'ADEJUMO JOHN OLUSEGUN', '5302027525'),
(123, '167', 'ACESS BANK', 'OLAIBI SUKURAT ODUNOLA', '0690363584'),
(124, '168', 'GTB', 'AFOLABI EMMANUEL ABIOLA', '0210968298'),
(125, '165', 'SKYE BANK', 'EZE CAROLINE', '1013596194'),
(126, '171', 'WEMA BANK PLC', 'ADELEYE OWOBOLANLE JOSEPH', '0231792350'),
(127, '173', 'SKYE BANK', 'OGUNDOYIN FUNMILOLA', '1019764551'),
(128, '174', 'FIRST BANK PLC', 'ABAKWUE NNAEMEKA S.', '3072460455'),
(129, '175', 'GTB', 'OYETUNJI ROSELINE S. ', '0159270179'),
(130, '176', 'ACCESS BANK ', 'ARIYO OYETOLA O. ', '0713310438'),
(131, '177', 'DIAMOND BANK', 'ADEDOTUN AKINLOLU', '0039466700'),
(132, '178', 'UBA', 'DADA JOHN', '0182992564'),
(133, '178', 'UBA', 'DADA JOHN', '0182992564'),
(134, '179', 'FIDELITY BANK', 'PATIENCE NDIP DANIEL', '6150672370'),
(135, '180', 'FIRST BANK', 'ESEKHADE GAD IKHADE', '3107803596'),
(136, '181', 'ACCESS BANK', 'OJEIWA ANTHONY', '0713241828'),
(137, '182', 'ACCESS BANK', 'ABIOLA OSEENI', '0065065640'),
(138, '183', 'FCMB', 'BOSE AJIBADE', '3969347011'),
(139, '121', 'GTBANK PLC', 'FAPOHUNDA KOLADE GBENGA', '0009866095'),
(140, '184', 'ACCESS BANK', 'OLUWA ADERONKE TEMITOPE', '0056640034'),
(141, '186', 'HERITAGE BANK', 'OMOBOLANLE AINA AMADIN', '1200009768'),
(142, '187', 'UBA', 'FRANKLIN OLADAPO', '2064898966'),
(143, '188', 'FIRST BANK', 'OYEMAYOWA ADEOLA AJOKE', '3024149973'),
(144, '190', 'FCMB', 'BADMUS BISOLA NAFISAT', '4403321013'),
(145, '192', 'FIRST BANK', 'OLUSIJI OPEYEMI', '3113994378'),
(146, '194', 'FCMB', 'OLUWA ADERONKE', '4034242017'),
(147, '193', 'U.B.A', 'RICHARD ELIZABETH ABISOYE', '2082242349'),
(148, '195', 'SKYE BANK', 'AROWOLO JIDEOLA OLUMIDE', '3010123793'),
(149, '196', 'GUARANTEE TRUST BANK ', 'KAYODE IFEOLUWA MICHAEL ', '0138009262'),
(150, '198', 'UBA', 'RAYMOND OWOICHO OKOH', '2094438602'),
(151, '199', 'DIAMOND BANK', 'OMORUYI MACQUEEN ', '0080792412'),
(152, '201', 'GTBANK', 'IYANDA NURUDEEN OLAYIWOLA', '0118314018'),
(153, '202', 'GTBANK PLC', 'OGUNDARE OMOBOLANLE  ADEBUNMI', '0029094683'),
(154, '204', 'ACCESS BANK ', 'BALOGUN OLUWATOBI A', '0064989367'),
(155, '206', 'GTBANK', 'KEHINDE OLUWADOYIN', '0173514822'),
(156, '207', 'FIRST BANK', 'NDUBUISI NDUBUILO', '3015224472'),
(157, '205', 'GTBANK', 'OMODELE OLUWASEUN IDOWU', '0050596697'),
(158, '197', 'ACCESS BANK', 'QUADRI MAYODELE OLALEKAN', '0037886277'),
(159, '208', 'SKYE BANK', 'WOLE LANIYONU', '3025947753'),
(160, '209', 'FCMB', 'ODEBODE SAMUEL KOLAWOLE', '2886977013'),
(161, '215', 'DIAMOND ', 'ABASS BOLA ', '0045678754'),
(162, '185', 'GTBANK', 'OLUWAGBEMI ISAAC IFEOLUWA', '0169654804'),
(163, '216', 'ACCESS BANK', 'ADEOYE KOLA BUNMI', '0717198140'),
(164, '218', 'UNION BANK ', 'KAYODE EUNICE OGHENEVIARHE', '0000341090'),
(165, '220', 'WEMA BANK ', 'EGBEBOWALE  KEHINDE', '0229524547'),
(166, '222', 'ACCESS BANK', 'ADEWUMI ARIYIBI', '0060133629'),
(167, '224', 'WEMA BANK', 'AROWOLO ALIU ADEKUNLE', '0231925970'),
(168, '223', 'DIAMOND BANK PLC', 'AYODELE SOLOMON PARIOLA', 'OO85508740'),
(169, '225', 'GTBANK', 'ADEOGUN ADEMOLA YUSSUF', '0161050864'),
(170, '226', 'FCMB', 'OYEDIRAN JOSEPH F.', '0446622010'),
(171, '227', 'FIRST BANK PLC', 'OGUNJOBI YINKA', '3021372080'),
(172, '228', 'ACCESS BANK', 'JOLAYEMI WALE JACOB', '0696643529'),
(173, '213', 'FIRST BANK', 'ABALU CHIDERA CLIVE', '3100316394'),
(174, '212', 'FIRST BANK', 'ABALU CHIGOZIE REX', '3058869245'),
(175, '231', 'FIRST BANK', 'LUTHER OMODOLAPO ADEBOLA', '3021442116'),
(176, '234', 'UBA BANK', 'ISAIAH TAIWO. E', '2040035170'),
(177, '232', 'WEMA BANK', 'MUNIRU AHMED SUNKANMI', '0231827823'),
(178, '233', 'UBA', 'SOLOMON OKEMONA AUGUSTINE ', '2078289877'),
(179, '236', 'ACCESS BANK PLC', 'OWOMOYELA LSAAC JIMOH', '0711702718'),
(180, '230', 'AMINAT OLOFINLUYI', 'UBA', '2013693420'),
(181, '237', 'FIRST BANK PLC', 'ADEMOLA ADIGUN SAHEED', '3005895132'),
(182, '238', 'UNITED BANK OF AFRICA (U.B.A)', 'EDOJAH', '2083173585'),
(183, '239', 'FIRST BANK', 'MAKINDE OLADOYE', '2019451008'),
(184, '240', 'FCMB', 'ADEREMI SODIQ AYANFE', '2955737014'),
(185, '214', 'GTB', 'IFEANYI LUCY ESIOBU', '0238618397'),
(186, '241', 'ADEDOYIN ADEKUNLE ISAAC', 'FCMBANK', '2451542017'),
(187, '242', 'STANBIC BANK', 'OLABIYI OLAJUWON', '0008843398'),
(188, '229', 'GT BANK ', 'UGOCHUKWU IHEJIRIKA', '0165824959'),
(189, '243', 'FIRST BANK', 'ADEKUNLE KEHINDE MORAYO', '3053197538'),
(190, '245', 'GTB', 'LANLEHIN  OLAYINKA ', '0045678921'),
(191, '244', 'FCMBANK', 'HAMMED ABIODUN OLAMIDE', '4004415012'),
(192, '246', 'GTBANK', 'ADEYEYE ADEDOYIN E', '0159323996'),
(193, '247', 'DIAMOND BANK ', 'OKOJI BARNABAS ', '0088403231'),
(194, '235', 'FIRST BANK PLC', 'ALIMOMOH AZEEZ CLINTON', '3113722489'),
(195, '235', 'FIRST BANK PLC', 'ALIMOMOH AZEEZ CLINTON', '3113722489'),
(196, '248', 'GTBANK PLC', 'ADEMOSU OLUMIDE AYOMIDE', '0115527145'),
(197, '249', 'GTBANK', 'JOSEPH MATHEW O.', '0162064110'),
(198, '250', 'HERITAGE BANK ', 'ADEKOYEJO OPEYEMI PETER', '1500255825'),
(199, '251', 'ECO BANK', 'SODIQ AKEEM DAMOLA', '5291104533'),
(200, '252', 'AMINAT OLOFINLUYI', 'UBA', '2013693420'),
(201, '254', 'ECO BANK', 'TEMITOPE ISMAILA I', '2791028976'),
(202, '255', 'ECO BANK', 'HASSAN IBRAHIM', '2793001001'),
(203, '256', 'FIRST BANK', 'AKINOLA JOHN OLA', '3049792402'),
(204, '257', 'FIRST BANK PLC', 'ADEBANJO SAMUEL IDOWU ', '3058397340'),
(205, '261', 'GTBANK', 'AZEEZ RIDWAN O.', '0116701362'),
(206, '262', 'GT BANK', 'IFEANYI ALAEKE ', '0238618397'),
(207, '264', 'GT BANK', 'OJO OLUKEMI DEBORAH', '0030550813'),
(208, '266', 'FIRST BANK ', 'OMOTOSO ESTHER OLUREMI', '3022883196'),
(209, '268', 'FIRST BANK ', 'MRS OMOTOSO ESTHER OLUREMI', '3022883196'),
(210, '269', 'ACCESS BANK ', 'FADIPE OLUWASEUN SUNDAY ', '0043373022'),
(211, '267', 'UNION BANK', 'OLANREWAJU JOSEPH ', '0054714741'),
(212, '272', 'ACCESS BANK', 'SALAU OMOTOLA', '0700689091'),
(213, '273', 'SKYE BANK', 'OMOTOSO FOLUSO ELIZABETH', '2020574137'),
(214, '275', 'SKYE BANK', 'OWOADE OYETAYO', '1017685335'),
(215, '276', 'ACESS BANK', 'ADEMOLA IDRIS ODUNAYO', '0711927397'),
(216, '274', 'DIAMOND BANK', 'OWOLABI WAKEEL KUNLE', '0029571162'),
(217, '280', 'FCMB', 'AKANBI ROFIYAT AYOKA', '4271552016'),
(218, '282', 'GTBANK', 'FAPOHUNDA GBENGA K', '0009866095'),
(219, '283', 'GTBANK', 'ADEYEMI SAMUEL TOSIN', '0240164747'),
(220, '284', 'ECOBANK', 'OGUNDAIRO ABAYOMI', '4271092002'),
(221, '285', 'UBA', 'FRANCIS OKOH', '2055490119'),
(222, '279', 'GTBANK', 'AYANMAKINDE TAIWO AUGUSTINE', '0160613301'),
(223, '287', 'FIRST BANK', 'TORRENCE GURIYA', '3098179050'),
(224, '288', 'DIAMOND', 'IYIOLA OLASUNMIBOYE AKINKUNMI', '0082372702'),
(225, '291', 'DIAMOND BANK', 'EZERI EMMANUEL', '0066769841'),
(226, '292', 'DIAMOND BANK ', 'NWODO NNAEMEKA', '0024493186'),
(227, '293', 'FIDELITY BANK', 'DESMOND CHIDI', '6235704080'),
(228, '294', 'ACCESS BANK', 'OGUNDEJI OLUSOLA PETER ', '0050073689'),
(229, '296', 'FIRST BANK', 'AYOADE DAMILOLA', '3106765341'),
(230, '298', 'WEMA BANK', 'ADESHULU RIDWAN ADEDEJI', '0232220270'),
(231, '301', 'FIRSTBANK ', 'JOSEPH AMBROSE OSHIOKE ', '3108597155'),
(232, '302', 'FIRSTBANK ', 'SARAH OBIORU ', '3106062679'),
(233, '304', 'GTB ', 'AZUBUINE FORTUNE AKUNNA', '0150826030'),
(234, '305', 'FIRST BANK', 'OKPALAEKE CHARLES ANAYO ', '3106021045'),
(235, '309', 'SAVANAH BANK', 'CHUBA OKADIGBO', '0011001101'),
(236, '310', 'ACCESS BANK ', 'IMEOFON ESSIEN', '0696909436'),
(237, '311', 'FCMB', 'GIWA JOSEPH', '1321284019'),
(238, '169', 'STERLING BANK', 'EKERIN KENNY', '0029790637'),
(239, '312', 'STERLING BANK', 'OKOH U DEBORAH', '0063758208'),
(240, '313', 'GTBANK', 'OYEKALE ROSELINE OLUWAFIKAYO', '0138373811'),
(241, '315', 'GUARANTY TRUST BANK', 'SAHEED ISHOLA JUNAID', '0117084860'),
(242, '318', 'FIRST BANK PLC', 'SOYEWO OLUWATOYIN GBENGA ', '3064805828');

-- --------------------------------------------------------

--
-- Table structure for table `downline`
--

CREATE TABLE `downline` (
  `d_id` int(255) NOT NULL,
  `referralID` varchar(255) NOT NULL,
  `participantID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `downline`
--

INSERT INTO `downline` (`d_id`, `referralID`, `participantID`) VALUES
(1, '', '1'),
(2, '1', '2'),
(3, '1', '3'),
(4, '1', '4'),
(5, '1', '5'),
(6, '1', '6'),
(7, '1', '7'),
(8, '1', '8'),
(9, '1', '9'),
(10, '1', '10'),
(11, '1', '11'),
(12, '1', '12'),
(13, '1', '13'),
(14, '1', '14'),
(16, '1', '16'),
(17, '3', '17'),
(18, '1', '18'),
(19, '1', '19'),
(20, '6', '20'),
(21, '1', '21'),
(22, '19', '22'),
(23, '1', '23'),
(24, '1', '24'),
(25, '1', '25'),
(26, '25', '26'),
(27, '1', '27'),
(28, '25', '28'),
(29, '3', '29'),
(30, '1', '30'),
(31, '1', '31'),
(32, '1', '32'),
(33, '4', '33'),
(34, '1', '34'),
(35, '1', '35'),
(36, '6', '36'),
(37, '31', '37'),
(38, '1', '38'),
(39, '1', '39'),
(40, '6', '40'),
(41, '1', '41'),
(42, '8', '42'),
(43, '1', '43'),
(44, '1', '44'),
(45, '8', '45'),
(46, '1', '46'),
(47, '8', '47'),
(48, '6', '48'),
(49, '47', '49'),
(50, '6', '50'),
(51, '47', '51'),
(52, '47', '52'),
(53, '1', '53'),
(54, '1', '54'),
(55, '54', '55'),
(56, '1', '56'),
(57, '1', '57'),
(58, '1', '58'),
(59, '1', '59'),
(60, '3', '60'),
(61, '1', '64'),
(62, '64', '65'),
(63, '1', '66'),
(64, '19', '67'),
(65, '1', '68'),
(66, '1', '69'),
(67, '1', '70'),
(68, '4', '71'),
(69, '45', '72'),
(70, '64', '73'),
(71, '19', '74'),
(72, '19', '75'),
(73, '1', '76'),
(74, '19', '77'),
(75, '1', '78'),
(76, '69', '79'),
(77, '3', '80'),
(78, '3', '81'),
(79, '3', '82'),
(80, '1', '83'),
(81, '1', '84'),
(82, '3', '85'),
(83, '1', '86'),
(84, '1', '87'),
(85, '1', '88'),
(86, '30', '89'),
(87, '19', '90'),
(88, '1', '91'),
(89, '1', '92'),
(90, '1', '93'),
(91, '29', '94'),
(92, '4', '95'),
(93, '2', '96'),
(94, '59', '97'),
(95, '6', '98'),
(96, '9', '99'),
(97, '64', '100'),
(98, '1', '101'),
(99, '59', '102'),
(100, '33', '103'),
(101, '33', '104'),
(102, '64', '105'),
(103, '29', '106'),
(104, '64', '107'),
(105, '1', '108'),
(106, '64', '109'),
(107, '33', '110'),
(108, '1', '111'),
(109, '33', '112'),
(110, '64', '113'),
(111, '6', '114'),
(112, '6', '115'),
(113, '64', '116'),
(114, '64', '117'),
(115, '19', '118'),
(116, '64', '119'),
(117, '1', '120'),
(118, '92', '121'),
(119, '64', '122'),
(120, '64', '123'),
(121, '54', '124'),
(122, '33', '125'),
(123, '3', '126'),
(124, '2', '127'),
(125, '9', '128'),
(126, '1', '129'),
(127, '19', '130'),
(128, '31', '131'),
(129, '9', '132'),
(130, '9', '133'),
(131, '1', '134'),
(132, '1', '135'),
(133, '1', '136'),
(134, '9', '137'),
(135, '1', '138'),
(136, '1', '139'),
(137, '4', '140'),
(138, '1', '141'),
(139, '40', '142'),
(140, '1', '143'),
(141, '1', '144'),
(142, '144', '145'),
(143, '1', '146'),
(144, '6', '147'),
(145, '1', '148'),
(146, '31', '149'),
(147, '148', '150'),
(148, '148', '151'),
(149, '17', '152'),
(150, '17', '153'),
(151, '1', '154'),
(152, '34', '155'),
(153, '1', '156'),
(154, '17', '157'),
(155, '10', '158'),
(156, '87', '159'),
(157, '100', '160'),
(158, '1', '161'),
(159, '10', '162'),
(160, '17', '163'),
(161, '87', '164'),
(162, '148', '165'),
(163, '1', '166'),
(164, '160', '167'),
(165, '6', '168'),
(166, '6', '169'),
(167, '1', '170'),
(168, '19', '171'),
(169, '76', '172'),
(170, '19', '173'),
(171, '10', '174'),
(172, '34', '175'),
(173, '34', '176'),
(174, '6', '177'),
(175, '1', '178'),
(176, '10', '179'),
(177, '31', '180'),
(178, '14', '181'),
(179, '59', '182'),
(180, '64', '183'),
(181, '64', '184'),
(182, '1', '185'),
(183, '3', '186'),
(184, '3', '187'),
(185, '3', '188'),
(186, '31', '189'),
(187, '59', '190'),
(188, '4', '191'),
(189, '148', '192'),
(190, '142', '193'),
(191, '64', '194'),
(192, '1', '195'),
(193, '14', '196'),
(194, '1', '197'),
(195, '1', '198'),
(196, '14', '199'),
(197, '10', '200'),
(198, '1', '201'),
(199, '121', '202'),
(200, '14', '203'),
(201, '14', '204'),
(202, '1', '205'),
(203, '22', '206'),
(204, '30', '207'),
(205, '3', '208'),
(206, '1', '209'),
(207, '7', '210'),
(208, '7', '211'),
(209, '7', '212'),
(210, '7', '213'),
(211, '1', '214'),
(212, '1', '215'),
(213, '1', '216'),
(214, '1', '217'),
(215, '14', '218'),
(216, '11', '219'),
(217, '4', '220'),
(218, '1', '221'),
(219, '59', '222'),
(220, '142', '223'),
(221, '31', '224'),
(222, '33', '225'),
(223, '1', '226'),
(224, '142', '227'),
(225, '14', '228'),
(226, '2', '229'),
(227, '223', '230'),
(228, '33', '231'),
(229, '8', '232'),
(230, '1', '233'),
(231, '59', '234'),
(232, '10', '235'),
(233, '1', '236'),
(234, '236', '237'),
(235, '142', '238'),
(236, '1', '239'),
(237, '64', '240'),
(238, '33', '241'),
(239, '33', '242'),
(240, '148', '243'),
(241, '33', '244'),
(242, '1', '245'),
(243, '1', '246'),
(244, '10', '247'),
(245, '121', '248'),
(246, '33', '249'),
(247, '1', '250'),
(248, '19', '251'),
(249, '223', '252'),
(250, '1', '253'),
(251, '1', '254'),
(252, '1', '255'),
(253, '33', '256'),
(254, '19', '257'),
(255, '100', '258'),
(256, '100', '259'),
(257, '1', '260'),
(258, '1', '261'),
(259, '1', '262'),
(260, '31', '263'),
(261, '1', '264'),
(262, '1', '265'),
(263, '1', '266'),
(264, '266', '267'),
(265, '266', '268'),
(266, '8', '269'),
(267, '1', '270'),
(268, '266', '271'),
(269, '3', '272'),
(270, '266', '273'),
(271, '40', '274'),
(272, '40', '275'),
(273, '6', '276'),
(274, '1', '277'),
(275, '1', '278'),
(276, '69', '279'),
(277, '236', '280'),
(278, '266', '281'),
(279, '92', '282'),
(280, '33', '283'),
(281, '54', '284'),
(282, '1', '285'),
(283, '40', '286'),
(284, '158', '287'),
(285, '155', '288'),
(286, '155', '289'),
(287, '1', '290'),
(288, '1', '291'),
(289, '1', '292'),
(290, '1', '293'),
(291, '1', '294'),
(292, '1', '295'),
(293, '1', '296'),
(294, '1', '297'),
(295, '1', '298'),
(296, '1', '299'),
(297, '1', '300'),
(298, '1', '301'),
(299, '1', '302'),
(300, '295', '303'),
(301, '1', '304'),
(302, '1', '305'),
(303, '1', '306'),
(304, '1', '307'),
(305, '1', '308'),
(306, '1', '309'),
(307, '1', '310'),
(308, '1', '311'),
(309, '169', '312'),
(310, '33', '313'),
(311, '54', '314'),
(312, '155', '315'),
(313, '1', '316'),
(314, '1', '317'),
(315, '4', '318'),
(316, '33', '319'),
(317, '33', '320');

-- --------------------------------------------------------

--
-- Table structure for table `executive`
--

CREATE TABLE `executive` (
  `executive_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `executive`
--

INSERT INTO `executive` (`executive_id`, `username`, `password`, `level`) VALUES
(1, 'admin', '9d9e8fa2e59450d44ae8f68243d9f415', 'Manager'),
(2, 'giverscycler', '827ccb0eea8a706c4c34a16891f84e7b', 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `firstlogin`
--

CREATE TABLE `firstlogin` (
  `logid` int(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `firstlogin`
--

INSERT INTO `firstlogin` (`logid`, `username`) VALUES
(1, 'ipeletemitope@gmail.com'),
(2, 'oluwatayoadeyemi@yahoo.com'),
(3, 'chiboysmart@gmail.com'),
(4, 'vicezet@yahoo.ca'),
(5, 'vicezet@yahoo.ca'),
(6, 'soyewooluwatoyin@hotmail.co.uk'),
(7, 'ogundowoleraheem@gmail.com'),
(8, 'adamilola98@gmail.com'),
(9, 'chideraabalu@yahoo.com'),
(10, 'muniruolasunkanmi@gmail.com'),
(11, 'silvionwaneri@gmail.com'),
(12, 'ajayiebenezer3@gmail.com'),
(13, 'dewumiseun@yahoo.com'),
(14, 'hamzatademola@rocketmail.com'),
(15, 'otunbaoluseun@gmail.com'),
(16, 'bammy2588@yahoo.com'),
(17, 'oluseunomowolewa@gmail.com'),
(18, 'ogechukwu4best@gmail.com'),
(19, 'stiless634@gmail.com'),
(20, 'barinembakpo@gmail.com'),
(21, 'jbigah5@yahoo.com'),
(22, 'carolineeze@yahoo.com'),
(23, 'lucyoforka@gmail.com'),
(24, 'femi4real86@yahoo.com'),
(25, 'olufemiolowe@yahoo.com'),
(26, 'olufemiolowe@yahoo.com'),
(27, 'olufemiolowe@yahoo.com'),
(28, 'olufemiolowe@yahoo.com'),
(29, 'ruthariyo2009@gmail.com'),
(30, 'arowolo886@gmail.com'),
(31, 'd@yahoo.com'),
(32, 'arowolo886@yahoo.com'),
(33, 'adeyojuisrael@gmail.com'),
(34, 'shaymaxstephen9@gmail.com'),
(35, 'lawrencefemi35@gmail.com'),
(36, 'fathookay.ode1@hotmail.com'),
(37, 'fathookay.ode1@hotmail.com'),
(38, 'gbolaahan29@gmail.com'),
(39, 'ade4distinction@gmail.com'),
(40, 'ade4distinction@gmail.com'),
(41, 'femitunji2980@gmail.com'),
(42, 'oyedeposam@gmail.com'),
(43, 'ayodele824@gmail.com'),
(44, 'obasipetolu@gmail.com'),
(45, 'ewejobiolajide@gmail.com'),
(46, 'adeyemoademola92@gmail.com'),
(47, 'holorunzei@gmail.com'),
(48, 'runzeiholo@gmail.com'),
(49, 'kidafaze@gmail.com'),
(50, 'bayodeseye@gmail.com'),
(51, 'abidemibadmus16@gmail.com'),
(56, 'whochey@yahoo.com'),
(57, 'arowosayem@yahoo.com'),
(58, 'talonge83@yahoo.com'),
(59, 'djfemmite48@gmail.com'),
(60, 'emmatosh1994@gmail.com'),
(61, 'ayodele4uluv@yahoo.com'),
(62, 'davidfakorede@gmail.com'),
(63, 'hadesam9@gmail.com'),
(64, 'mayordonfocus@yahoo.com'),
(65, 'ajibolaolalekan@yahoo.com'),
(66, 'onaolapotimileyinabayomi@gmail.com'),
(67, 'olukannilekan02@gmail.com'),
(68, 'elizabeth23@gmail.com'),
(69, 'princesst@yahoo.com'),
(70, 'adesolaeze@yahoo.com'),
(71, 'williamwitney30@gmail.com'),
(72, 'somadinaufondu@gmail.com'),
(73, 'sufondu@yahoo.com'),
(74, 'hoseniqudry12@gmail.com'),
(75, 'princessadesola@yahoo.com'),
(76, 'kl_gbenga@yahoo.com'),
(77, 'omowumiomolara110@yahoo.com'),
(78, 'tmm@yahoo.com'),
(79, 'obe.oluwagbenga@gmail.com'),
(80, 'badmoskafayat2016@gmail.com'),
(81, 'amakajoy@yahoo.com'),
(82, 'olakavic@yahoo.com'),
(83, 'ambalirasheed689@email.com'),
(84, 'bolarinwaazeez68@yahoo.com'),
(85, 'lookmanabidemibadmus16@yahoo.com'),
(86, 'josephobinna216@yahoo.com'),
(87, 'princesscaroline@yahoo.com'),
(88, 'ayandiran@yahoo.com'),
(89, 'badmus@yahoo.com'),
(90, 'akanjiolalekan@yahoo.com'),
(91, 'garba@yahoo.com'),
(92, 'mattasandra015@gmail.com'),
(93, 'fabulousrichy@gmail.com'),
(94, 'horlarmilekam.oyeleke@facebook.com'),
(95, 'olalekanayuba855@gmail.com'),
(96, 'abiolaadebayo@gmail.com'),
(97, 'toriolachioma@yahoo.com'),
(98, 'nikealonge@yahoo.com'),
(99, 'adeyemi@yahoo.com'),
(100, 'akunanwa11@gmail.com'),
(101, 'adisa@yahoo.com'),
(102, 'tiwa@yahoo.com'),
(103, 'adegbolaope7@gmail.com'),
(104, 'olowuferanmi@yahoo.com'),
(105, 'vicezet@gmail.com'),
(106, 'schiboy@yahoo.com'),
(107, 'ipeletemitope@yahoo.com'),
(108, 'racheal005@yahoo.com'),
(109, 'olamilekan67real@yahoo.com'),
(110, 'otunbacoded@gmail.com'),
(111, 's.ajibade2011@gmail.com'),
(112, 'abianoh8@gmail.com'),
(113, 'zolaitan933@gmail.com'),
(114, 'olaitan_ogundiran@yahoo.com'),
(115, 'omotosho96@gmail.com'),
(116, 'damilolasusan42@gmail.com'),
(117, 'popeken4real@gmail.com'),
(118, 'abigail.betiku@yahoo.com'),
(119, 'stephenadewoye1@gmail.com'),
(120, 'estherakinmade70@gmail.com'),
(121, 'ken10ky2k4@yahoo.com'),
(122, 'oladlan@yahoo.com'),
(123, 'olusijiopeyemimary@gmail.com'),
(124, 'arowoloaminat886@gmail.com'),
(125, 'dewumiseun@gmail.com'),
(126, 'toppsson55@gmail.com'),
(127, 'ezecaroline03@gmail.com'),
(128, 'olaseun4christ@gmail.com'),
(129, 'donhaye12@gmail.com'),
(130, 'fatokevin44@gmail.com'),
(131, 'awololaoluwapelumi@gmail.com'),
(132, 'awaguekwutosi@gmail.com'),
(133, 'rukayatomolara689@email.com'),
(134, 'wizzy@yahoo.com'),
(135, 'dheejay@yahoo.ca'),
(136, 'dheejay@yahoo.ca'),
(137, 'dheejay@yahoo.ca'),
(138, 'seejacy@gmail.com'),
(139, 'seejacy@gmail.com'),
(140, 'adesola1@gmail.com'),
(141, 'adejumo@yahoo.com'),
(142, 'olaibi689@email.com'),
(143, 'seunnay@yahoo.com'),
(144, 'kennyrite@yahoo.com'),
(145, 'bolasmoney@gmail.com'),
(146, 'ogundoyinfunmilola@gmail.com'),
(147, 'abax4all1@gmail.com'),
(148, 'sunmbomoye@gmail.com'),
(149, 'tolariyo2001@gmail.com'),
(150, 'akinlolu.adedotun@yahoo.com'),
(151, 'dada@gmail.com'),
(152, 'patiencedaniel1999@gmail.com'),
(153, 'esekhadegad@gmail.com'),
(154, 'mhiztanhero@gmail.com'),
(155, 'mhiztanhero@gmail.com'),
(156, 'lookmanabidemibadmus@yahoo.com'),
(157, 'boseajibade@yahoo.com'),
(158, 'koladegbenga6@gmail.com'),
(159, 'oluwa@yahoo.com'),
(160, 'ifeoluwa20@gmail.com'),
(161, 'omobolanleainaamadin@outlook.com'),
(162, 'franklinoladapo@outlook.com'),
(163, 'oyemayowaajokeoye@outlook.com'),
(164, 'olowolayioladipupo@gmail.com'),
(165, 'absobab.b@gmail.com'),
(166, 'olusijiabiodun@yahoo.com'),
(167, 'aderonke@yahoo.com'),
(168, 'femirichard43@gmail.com'),
(169, 'j.oarowolo@gmail.com'),
(170, 'michaelego2011@gmail.com'),
(171, 'lordrayboy@gmail.com'),
(172, 'macqueenomoruyi@gmail.com'),
(173, 'olojeoluwamotemi442@gmail.com'),
(174, 'meekky01@gmail.com'),
(175, 'samclef1759@yahoo.com'),
(176, 'young6stem@gmail.com'),
(177, 'atinsola9367@gmail.com'),
(178, 'otunbaoluseun2@gmail.com'),
(179, 'andubisi54@yahoo.com'),
(180, 'omodeleid@gmail.com'),
(181, 'akinpelumayowa333@gmail.com'),
(182, 'samuellanny411@gmail.com'),
(183, 'manlyworld2013@gmail.com'),
(184, 'admin'),
(185, 'abassbola@yahoo.com'),
(186, 'adeoyakolabunmi@gmail.com'),
(187, 'badanifemi16@email.com'),
(188, 'eunicekayode@gmail.com'),
(189, 'kidajoshforreal@gmail.com'),
(190, 'egbebowalekehinde@gmail.com'),
(191, 'adekoyaadewunmi2@gmail.com'),
(192, 'ariyibi35@yahoo.com'),
(193, 'orelope91@gmail.com'),
(194, 'ayodelepariola826@yahoo.com'),
(195, 'ajibola282@gmail.com'),
(196, 'licsonjoe0@gmail.com'),
(197, 'ogunjobi_tunji@yahoo.com'),
(198, 'jolayemi.walejacob@yahoo.com'),
(199, 'chideraclive@gmail.com'),
(200, 'ugochukwuihejirika2016@yahoo.com'),
(201, 'gozkidprince@yahoo.com'),
(202, 'adesewaadenike7@gmail.com'),
(203, 'muniruahmed@yahoo.com'),
(204, 'taiwo30@yahoo.com'),
(205, 'solomonokemona@yahoo.com'),
(206, 'owohcybercafe@gmail.com'),
(207, 'elizabeth4u2011@gmail.com'),
(208, 'ademolasaheed35@yahoo.com'),
(209, 'spanama18@gmail.com'),
(210, 'oladoyemakinde@yahoo.com'),
(211, 'aderemisodiq@yahoo.com'),
(212, 'lucyesiobu@yahoo.com'),
(213, 'aremo4u@gmail.com'),
(214, 'aremo4u@gmail.com'),
(215, 'olajuwonokomaamee@gmail.com'),
(216, 'madekunlekehinde@gmail.com'),
(217, 'abiodunswagboi@yahoo.com'),
(218, 'jazz@gmail.com'),
(219, 'donhaye@yahoo.com'),
(220, 'barnabasokoji@yahoo.com'),
(221, 'azeezclinton@gmail.com'),
(222, 'olumercy48@gmail.com'),
(223, 'mathewj4real@gmail.com'),
(224, 'adekoyejoseun@gmail.com'),
(225, 'adekoyejoseun@gmail.com'),
(226, 'akeemdarosa@yahoo.com'),
(227, 'elizabeth4u@yahoo.com'),
(228, 'elizabeth4u@yahoo.com'),
(229, 'toks@gmail.com'),
(230, 'deola4tech@gmail.com'),
(231, 'johnakinola54@gmail.com'),
(232, 'pastorsam29@yahoo.com'),
(233, 'azeezridwanolanrewaju@gmail.com'),
(234, 'sandysnow@yahoo.com'),
(235, 'abianoh80@gmail.com'),
(236, 'jamesdebby89@gmail.com'),
(237, 'ifeanaeke@yahoo.com'),
(238, 'azeezclinton2000@gmail.com'),
(239, 'emmatosh18@gmail.com'),
(240, 'olanrewaju9653@gmail.com'),
(241, 'emmatosh18@yahoo.com'),
(242, 'fadipe55@gmail.com'),
(243, 'voicetotola@yahoo.com'),
(244, 'foludammy@gmail.com'),
(245, 'tayo_owoade@yahoo.com'),
(246, 'ademolaidris1995@gmail.com'),
(247, 'dekunleowolabi@yahoo.com'),
(248, 'skulboiy@gmail.com'),
(249, 'haywhy2015@gmail.com'),
(250, 'haywhy2015@gmail.com'),
(251, 'haywhy2015@gmail.com'),
(252, 'haywhy2015@gmail.com'),
(253, 'ecomog100@yahoo.com'),
(254, 'emmatosh1994@yahoo.com'),
(255, 'tiwa_tolulope@yahoo.com'),
(256, 'sammy1@yahoo.com'),
(257, 'abayomiogundairo@yahoo.com'),
(258, 'rayowoicho@gmail.com'),
(259, 'josunlana@yahoo.com'),
(260, 'guriyatorrence@gmail.com'),
(261, 'boyeola77@gmail.com'),
(262, 'charito556@gmail.com'),
(263, 'manuel@gmail.com'),
(264, 'dove@gmail.com'),
(265, 'ogundejiholushorlar5050@gmail.com'),
(266, 'dammyerudite@gmail.com'),
(267, 'adedeji642@gmail.com'),
(268, 'ambrosejoseph945@gmail.com'),
(269, 'ufuomadgreat@gmail.com'),
(270, 'kunny4me2000@gmail.com'),
(271, 'okpalaekecharlesanayo1@gmail.com'),
(272, 'chuba@yahoo.com'),
(273, 'imeofonessien@gmail.com'),
(274, 'giwablack@yahoo.com'),
(275, 'deborahchenna@yahoo.com'),
(276, 'oyekaleb@gmail.com'),
(277, 'emmanuelakindele1979@yahoo.com'),
(278, 'oluwatoyinsoyewo@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `forumreply`
--

CREATE TABLE `forumreply` (
  `replyid` int(255) NOT NULL,
  `topicid` varchar(2) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `replymsg` longtext NOT NULL,
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumreply`
--

INSERT INTO `forumreply` (`replyid`, `topicid`, `participantID`, `replymsg`, `date_written`) VALUES
(1, '1', '41', 'Yea, nice idea I support the motion', 'Apr 12, 2017 17:53:33'),
(2, '1', '14', 'Please dear Giverscycler.i do not fully support the motion. Not that I am saying the idea is wrong and inconclusive, in fact I totally agree with you.', 'Apr 12, 2017 18:08:00'),
(3, '1', '14', 'Think about it like this. After I got the money,I told 8 of my friends about it and they were excited to join. Now 7 of my friends trusted me with 1k,2k,5k, nd 10k respectively believing that they\'ll get their cash back this week. But hearing this now, I think it is unfair for new members. We\'re all students now we\'re all starving ND ure asking us to PH again. It\'s totally unfair on us.', 'Apr 12, 2017 18:12:59'),
(4, '1', '14', 'I am sorry if I did not express my opinion well. Thank you', 'Apr 12, 2017 18:16:30'),
(5, '1', '8', 'No qualms', 'Apr 12, 2017 18:18:42'),
(6, '1', '14', 'I am sorry if I did not express my opinion well. Thank you', 'Apr 12, 2017 18:19:01'),
(7, '1', '64', 'This is not a good idea ,first pay me my outstanding  GH', 'Apr 12, 2017 18:19:20'),
(8, '1', '67', 'What of those first timers that  just PHed, is this also apply to them?', 'Apr 12, 2017 18:24:59'),
(9, '1', '14', 'Emmatosh thank you. That\'s the same question I need answers to.', 'Apr 12, 2017 18:26:29'),
(10, '1', '22', 'no problem, d idea is ok', 'Apr 12, 2017 18:31:18'),
(11, '1', '206', 'this is not how it all started,its not meant to be like this cos at this moment people are broke and they expect Us all to PH again after the first one this can\'t work this way....haba,,,its unfair...Abeg admin,reconsider this law again...CUS this law is not favourable at all\r\n', 'Apr 12, 2017 18:53:44'),
(12, '1', '206', 'this is not how it all started,its not meant to be like this cos at this moment people are broke and they expect Us all to PH again after the first one this can\'t work this way....haba,,,its unfair...Abeg admin,reconsider this law again...CUS this law is not favourable at all\r\n', 'Apr 12, 2017 18:53:52'),
(13, '1', '30', 'in this life one must hv too take a risk I believe dey won\'t disappointe us let me just give it my last chance i just pray everything works well.hmmm', 'Apr 12, 2017 19:05:20'),
(14, '1', '1', 'The rule seems to be unfair cos of those who have never gained in the system for once. I have invited friends to the system who are having there money pending in the system till now. One need to try and see if the new rule will work out. My fellow participant, i will urge us to abide to the rule if these is what will save us from loosing all our investment. Many scheme has failed (Twinkas, Claritta, CLO, CashCircullar and so on) me. So I will want us all to abide to the rules and let us all promote the good image of the community.\r\n\r\nThanks, as for me , I will beg my downline to try and Re-commit back.\r\n\r\nPlease Admins, do not disappoint us.\r\n\r\nThanks', 'Apr 12, 2017 19:35:20'),
(15, '1', '268', 'Is this going to work, am getting scared as a started who haven\'t benefited from this system, pls do not disappoint me', 'Apr 12, 2017 20:05:53'),
(16, '1', '96', 'If it\'s going to sustain the system,  then no problem ', 'Apr 12, 2017 20:13:55'),
(17, '1', '121', 'Mayour22/memba\r\nDis is really serrious men and is quite unfair attitude. Is jst bco ll dnt wnt to lose d capital we hv invested der, dt why am joining d motion.  Hmmm - but let wait and C shal. Hw true its men.', 'Apr 12, 2017 21:54:08'),
(18, '1', 'MICHEAL SMITH', '\nDear participant, we do understand what you are currently facing, fearless as these community is based on trust and well-being of our participant in order not to loose their investment is our major goal. Once you are being merged to Get help of your 300%, do not forget to Re-PH and save other participants also, do not be greedy..... Keep inviting and surely we will overcome.\n\n\nRemember: Your PH is someone else GH and vice-versa\n\n\nThank You.', '13.04.2017 07:47:51 AM'),
(19, '1', '97', 'Did you think we are fool you started not less than two week the system have collapse anything we Yoruba\'s people do is a fraud and plan for example everyone let look at MMM they go and come back because we don\'t know where they operate it so you are expecting us to pH so that you can swallow our money abi I think if you can merged some today people we come to the system thank for your understanding', 'Apr 13, 2017 06:26:39'),
(20, '1', 'MICHEAL SMITH', 'Merging has commenced, kindly honor your match. ', 'Apr 13, 2017 06:30:43 '),
(21, '1', '40', 'if we PH like how many days will it takes u to merge us cux am scared ', 'Apr 13, 2017 06:49:21'),
(22, '1', '40', 'if we PH like how many days will it takes u to merge us cux am scared ', 'Apr 13, 2017 06:49:48'),
(23, '1', 'MICHEAL SMITH', '@Shaymax, We are attending to people that are on Queue to Get Help first, we assume all Outstanding GH to be old, once you PH, your new PH activates your outstanding GH and you get part of your outstanding GH.\r\n\r\nDo bear and understand with us', ''),
(24, '1', 'MICHEAL SMITH', '@Iya lukman, no one swallows your money, this is a peer to peer donation and we  have no central account where we can pay anyone back. \n\nAll participant gets paid by each other, once U PH, ur PH is matched to someone\'s GH.\n\nOnce you invite anyone to the system, do orientate them not to leave the system without PHing back after GHing.  \n\nThanks.', ''),
(25, '1', '22', 'av been merged and am expecting a return', 'Apr 13, 2017 07:06:05'),
(26, '1', '1', 'i don\'t just know why Nigerians are so greedy, you get your fund and run away leaving the system into wahala for everyone else. Admins pls take note of such people, we are looking foward on how you are going to rectify these issue for us.\r\n\r\nThanks ', 'Apr 13, 2017 07:29:42'),
(27, '1', '241', 'I don\'t support dis motion of urs..I don\'t actually like how u delay outstanding payments....I\'m even scared to invite friends since they will ask me what I av gained from u.....pls do something', 'Apr 13, 2017 08:41:26'),
(28, '1', '241', 'Pls just return back my 5k,I don\'t need ur useless 10k..this is actually a FRAUD site...u didn\'t impress at all.......if not for my friend who invited me and he\'s is also a victim of ur fraudulent act...BULLSHIT\r\n', 'Apr 13, 2017 08:50:05'),
(29, '1', '37', 'for me..... every rules given by giverscycler is well okay, if they can promise us that our old gh will be paid back as fast as possible....\r\n\r\nthanks', 'Apr 13, 2017 09:20:15'),
(30, '1', '90', 'If i ph now, like how many days will it take Me to Gh..... .?', 'Apr 13, 2017 11:40:20'),
(31, '1', '5', 'Thanks to GC, I have been paid part of my outstanding GH. Friends lets believe in these system, its real.', 'Apr 13, 2017 12:03:09'),
(32, '1', '67', 'sorry I won\'t be able to ph within 12 hours because I can\'t access the bank where I am right now and transferring it from the phone is not working, kindly help to extend the time limit, thanks', 'Apr 13, 2017 15:07:55'),
(33, '1', '199', 'Please I beg of u Mr Michael Smith in the name of the Almighty , I am a new user and my referral promised me I\'ll get 200%. Meanwhile I got just 3k out of outstanding 10k. I believe this is unfair to new members. Please consider me. Thank you sir ', 'Apr 13, 2017 15:26:38'),
(34, '1', '181', 'I am a new member too. The new plan is okay and I pray it\'ll work but I think it\'ll be best if I get some of my outstanding GH back please. I BEG OF U ADMIN. Please reply ', 'Apr 13, 2017 15:32:22'),
(35, '1', '130', 'i paid today and av been merged to get help........\r\nthanks to giverscycler............\r\nGivers are receivers', 'Apr 13, 2017 16:00:01'),
(36, '1', '22', 'Admin, av being calling chuba since but it seems he used a wrong number bcos it is gtbank customer care dat is picking d call. pls do something', 'Apr 13, 2017 16:41:38'),
(37, '1', '1', 'Everyone abeg check these link ooo and see what they uploaded for me.\n\nhttps://giverscycler.com/img/attachment/POPIMG_20170413_174203.jpg\n\n<br><br><br>\n\n\n<img src=\'https://giverscycler.com/img/attachment/POPIMG_20170413_174203.jpg\' width=\'40%\'/>', 'Apr 13, 2017 16:52:29'),
(38, '1', '37', 'i made a payment today and my outstanding money did not display again..... can u pls elaborate this for me?', 'Apr 13, 2017 18:22:10'),
(39, '1', '22', 'Anyone who bears chuba or better still knows\r\n someone that bears chuba should kindly signify....\r\n', 'Apr 13, 2017 18:22:54'),
(40, '1', '43', 'be focused in this mature games...', 'Apr 13, 2017 19:20:36'),
(41, '1', '238', 'I don\'t ur low pH in d system, all my upliners are still in d system,non of my friends withdrew, pls dont deceive us,my first time in d system, and u r disappointing me with excuse,how do u want me to convince new members, when av not collected a dine from u,pls tell me', 'Apr 13, 2017 20:46:41'),
(42, '1', '238', 'U said the new rules is not applicable to first timer,but on my status, am seeing re-ph,pls explain ', 'Apr 13, 2017 20:50:45'),
(43, '1', '205', 'one chance!', 'Apr 13, 2017 20:57:28'),
(44, '1', '138', 'But pls can\'t u pay part of our outstanding in order to PH.', 'Apr 14, 2017 07:48:59'),
(45, '1', '40', 'admin pls ave paid to Isaiah Taiwo since yesterday yet he avnt confirmed me I called his number he was telling me dat he is not d one operating his acct dat he dnt ave a browsing fone and d person helping him is not around to confirm me...pls what should I do now', 'Apr 14, 2017 07:51:08'),
(46, '1', 'MICHEAL SMITH', 'Dear participant, due to the fact that some participant are new and are yet to benefit from the system, all new participants gets one-third of there outstanding payment while some existing participants who Re-PHed gets there 300% instantly yesterday, once it gets to your turn, you will be merged to GH part of your outstanding payment whether you are a a new member or not. We will keep up to our words and ensure everyone gets his or payment.\r\n\r\nSustainability of GC lies in your hand.\r\n\r\nThanks ', 'Apr 15, 2017 09:14:48'),
(47, '1', '67', 'Excuse me, I have ph since yesterday afternoon and it has been confirmed, why haven\'t I been merged to gh in return? wats wrong? ', 'Apr 14, 2017 20:07:06'),
(48, '1', '33', 'pls admin I hve ph,pls merge me to some1 gh plssssssssssssssss', 'Apr 14, 2017 23:12:10'),
(49, '1', '268', 'I paid yesterday morning and yet I haven\'t been merged, pls do something admin', 'Apr 15, 2017 06:33:39'),
(50, '1', '225', 'My people, I was merged to get help of N8,000 after providing help of N2,000 again which makes it 300% plus one-third of my outstanding GH. Giverscycler is real. Fearless buddies', 'Apr 15, 2017 12:09:27'),
(51, '1', '37', 'Giverscycler still d best.... My fund is back\r\n\r\nFearless ', 'Apr 15, 2017 12:53:47'),
(52, '1', '231', 'my pple giverscycler is real i have been paid,I love dis rule', 'Apr 15, 2017 13:41:52'),
(53, '1', '201', 'I never believed it I thought it was over not until I was paid one-third of my outstanding GH, now have re-PHed in order to get 300% out of my outstanding GH.\r\n\r\nThanks to GC. ', 'Apr 15, 2017 16:31:01'),
(54, '1', '227', 'What I don\'t understand is when I suppose to gh from someone who sent a fake pop which has not been cleared, yet still expect me to ph..have never collect a kobo. How do I convince new member with this?  ', 'Apr 15, 2017 19:00:23'),
(55, '1', '1', 'My people, please lets stop these bad act of uploading FAKE POP, what is the essence of you PHing when you know fully you won\'t pay. Givercycler is not responsible for all these, we are the one holding our money ourselves. Please I use God to beg everyone of us, lets stop these bad act.\r\n\r\nOnce again, I beg oooo\r\n\r\nThanks.', 'Apr 15, 2017 20:03:57'),
(56, '1', '185', 'I am merge tu pay tu sum1....and av been calling d person since yesterday his number is switch off....and I av limited time tu pay.....wat can I do tu retain my time til he gt d payment...', 'Apr 16, 2017 10:34:23'),
(57, '1', '1', '@Jasmine, make the payment and once the participant refuses to confirm you, just inform the admin to take note.\r\n\r\nThanks', 'Apr 16, 2017 13:42:00'),
(58, '1', '267', 'I was merged to gh from someone and when I called her, she said she\'s no longer phing?  what to do, because that the money I want to use to re-ph of which I\'ve been merged already, pls do something admin. ', 'Apr 16, 2017 17:22:56'),
(59, '1', '1', 'Thanks to GC, my FAKE POP issue has been resloved.', 'Apr 17, 2017 08:14:51'),
(60, '1', 'MICHEAL SMITH', '@Olanrewaju joseph, Kindly honor your match, once your match time elapses, you will be re-merged.\r\n\r\nThanks', 'Apr 17, 2017 08:22:20'),
(61, '1', 'MICHEAL SMITH', '@Smarty, once you fulfil all the requirement needed in your ticket, you will be re-merged.\r\n\r\nThanks', 'Apr 17, 2017 08:24:25'),
(62, '1', '34', 'I have re-ph and matched to pay and I have done that but I have not been match to GH since last week Thursday. Please, I need your  attention adm.', 'Apr 17, 2017 12:24:34'),
(63, '1', 'TERRA COLE ', '@Nikegreat, once it gets to your turn, u will be merged.\r\n\r\n', 'Apr 17, 2017 13:13:15'),
(64, '1', '267', 'I already borrowed money to re-PHed, I hope you re-merge me quickly for the person who refused to GH to me, and consider my new PH by merging me with who will GH', 'Apr 17, 2017 22:04:57'),
(65, '1', '268', 'one of my match refused to GH to me pls do something about it admin', 'Apr 17, 2017 22:08:08'),
(66, '1', '86', 'I have ph twice so what\'s next', 'Apr 18, 2017 09:40:50'),
(67, '1', '86', 'I have ph twice now still expecting gh for over 3days now', 'Apr 18, 2017 09:42:49'),
(68, '1', '1', '@Joseph, I was merged to collect N7,000 on Apr 13, 2017 which sender uploaded a FAKE POP to Me, my issue was resolved yesterday and I was merged to collect N3,000 today which has been paid and have re-PHed again, lets have hope and believe in the system.... I strongly believe nothing will happen to our fund.\r\n\r\nLong live GC', 'Apr 18, 2017 11:00:34'),
(69, '1', '30', 'once GC reemerge me again I promise too re-ph again this platform is d best other ones hv stolen my money and I swore never too enter into any platform till I met GC I know how I wept bitterly for my lost 70k but ever the same it is well wat I normally tell people is dat u don\'t know wat u hv till u lose it so pls let us work hand too hand too make the cycle the best in the society thank u', 'Apr 19, 2017 07:10:40'),
(70, '1', '130', 'Pls admin,y is it that it takes time before you gh????', 'Apr 19, 2017 07:16:08'),
(71, '1', '33', 'For everyone DAT has been going, pls let\'s write a comment here 4 everyone to see. It will keep all hopes alive', 'Apr 19, 2017 10:40:10'),
(72, '1', '33', '\r\nFor everyone DAT has been ghing, pls let\'s write a comment here 4 everyone to see. It will keep all hopes alive	', 'Apr 19, 2017 10:40:52'),
(73, '1', '1', 'Mr Gold pls confirm my payment abeg oooo', 'Apr 19, 2017 21:15:34'),
(74, '1', '67', 'I wonder when I\'m also going to give my testimony here because I\'ve re-PHed since last week Thursday, I\'ve not been merged to GH until now, answer me when? Admin!!!!', 'Apr 19, 2017 21:31:59'),
(75, '1', '241', 'Oluwatayo,though I have not seen alert yet and you evn refuse to call me......u can send me the teller on whatsapp 08051671486..I will use dat to confirm u', 'Apr 20, 2017 05:12:03'),
(76, '1', '86', 'Still expecting to gh\r\nBeen over 4 days now', 'Apr 20, 2017 07:29:41'),
(77, '1', '86', 'I have ph twice now and expecting to gh for over 4days now. \r\nWhy this long.. .it didn\'t take this long to ph', 'Apr 20, 2017 07:30:37'),
(78, '1', '1', '@Joseph, Do you know that its a matter of queue, there are people ahead of U so the system attends to everyone base on your queue, I think what actually happen is because of those that do come back to queue (People who they did not pay). Fearless, you will be paid no matter which day you are. On Twinkas, I have been on queue since February 6 till now so Y scared of just 4days which is not even so. Are you counting public holiday ni? Chillax buddy, you will be paid.', 'Apr 20, 2017 09:02:06'),
(79, '1', '180', 'I have been merged to receive my 1/3 of my money.......... Thanks to giverscycler', 'Apr 20, 2017 10:07:29'),
(80, '1', '138', 'Pls wen will I be merged cos I av re-ph since Tuesday', 'Apr 21, 2017 05:33:19'),
(81, '1', '138', 'Won\'t I be merged today again', 'Apr 21, 2017 09:41:57'),
(82, '1', '138', 'Won\'t I be merged today again', 'Apr 21, 2017 09:42:40'),
(83, '1', '176', 'My first ph was on the  2nd of April and till now I have not been able to gh. Please,admin do something. Thanks ', 'Apr 21, 2017 10:01:13'),
(84, '1', '244', 'Thanks to GC, have been merged to receive', 'Apr 21, 2017 16:10:42'),
(85, '1', 'MICHEAL SMITH', '@Tolariyo, I can see you have been merged to receive part your outstanding GH, once you re-PH, you get 300% of your new PH. \r\n\r\nThanks.', 'Apr 21, 2017 16:34:29'),
(86, '1', 'MICHEAL SMITH', '@HIMOLE, You PH to a participant yesterday, do wait while we attend to people on the queue before You. Once we get to you, you will be merged. Thanks.', 'Apr 21, 2017 16:36:22'),
(87, '1', 'ELIAS MKALECH', 'Emmatosh, you have been merged to GH, expecting your testimony soonest ', 'Apr 21, 2017 19:31:37'),
(88, '1', '138', 'K but I paid on tuesday', 'Apr 21, 2017 21:29:26'),
(89, '1', '67', 'Thanks to GC, I have been merged to GH, although its not up to d expected 300% rather its far from it, nevertheless thanks ', 'Apr 22, 2017 04:12:48'),
(90, '1', '267', 'I\'ve been merged before but my match refused to GH, and u then told me to find every means to honour my own match of which I did and I said I borrowed the money I used to re-PHed, so y does it take this long to re-merge me, I really have no other means to refund the money I borrowed to PH then. Pls help me out now and save me from being embarrassed', 'Apr 22, 2017 04:22:09'),
(91, '1', 'PAUL JOHNSON ', '@Emmatosh, check your Ghost request,   you will see your balance. \r\n\r\nThanks ', 'Apr 22, 2017 07:05:59'),
(92, '1', 'PAUL JOHNSON ', '@Emmatosh, check your GH request,   you will see your balance. \r\n\r\nThanks ', 'Apr 22, 2017 07:08:02'),
(93, '1', '30', 'pls deae its hv been a while now and still her u hv not remerged me again the girl who was supposed too pay denied are been in givercycle pls dear GC I hv been more than patient pls reply me', 'Apr 22, 2017 15:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `forumtopics`
--

CREATE TABLE `forumtopics` (
  `topicid` int(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `topicmsg` longtext NOT NULL,
  `replies` varchar(255) NOT NULL DEFAULT '0',
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumtopics`
--

INSERT INTO `forumtopics` (`topicid`, `poster`, `subject`, `topicmsg`, `replies`, `date_written`) VALUES
(1, 'MICHEAL SMITH', 'NEW GH RULES FOR OUTSTANDING PAYMENT', 'Due to the rate at which participant are being GHing without PHing back in return neither inviting to the system. Leaving the system into doubtness to participant who are ready to promote the system. Many peer to peer donation scheme has crashed but we will keep up doing our best to strive and survive.\n\nFollowing suggestions were raised by some participant which we felt will be the possible way of making these community a worthwhile.\n\nPH to GH: For those who are having a certain amount of money in the system, any amount you PH, you get 300% back. i.e \n\nOustanding Fee: N30,000\nNew PH: N10,000\n\nTO Get Help of N10,000 * 300% = N30,000\n\nNormally, your New PH yields 200% which makes your total outstanding amount N30000 + N20,000 = N50,000\n\nRemaining Balance : N50,000 - N30,000 (GH Request) = N20,000\n\n\n<b><u>When do I provide help to a participant in need of help?</u></b>\n\nThere is maturity stage before providing help which normally takes 3hours or more depending on GH-Request in the system. Once your fund has reach maturity stage, you will be merge to provide help. Do ensure to have your money handy always.  \n\n<b><u>How do I get My Remaining Balance?</u></b>\n\nLike I said earlier, we put you first, once you Re-PH again, you get another 300% of your New PH till your Outstanding balance yields zero (0). Once it yields zero, that means you do not have any outstanding fund in the system.\n\nOnce your payment has been confirmed and it reach 24hours, the system automatically Get Help for you.\n\n<b><u>If I fail to provide help because am scared despite having an outstanding GH?</u></b>\n\nWell, in a situation like these, such is meant to happen, do not forget, once your time elapse, you will be blocked and your outstanding GH gets blocked also. Meaning if you are next to GH, you get paused until your account is re-activated and you Re-PHed.\n\n<b><u>Can I still proceed to PH and GH?</u></b>\nPHing and GHing is not on hold, feel free to PH any amount you want. The higher your PH, the faster you get your outstanding GH out of the system.\n\nAll Referrer\'s should orientate their downline (Referrals) about the goals and objective of GIVERSCYCLER.\n\nTake advantage of the 10% referral bonus when you invite your friends and loved ones.\n\nPromote GiversCycler in the best way you can and the widest publicity it deserves. \n\nWe are open to suggestion as these community is based on mutual understanding for the benefit of all and making profit in return.\n\nThank You!!!\n\n\n<font color=\'red\'><b>THIS METHOD IS NOT APPLICABLE TO NEW PARTICIPANT WHO ARE PHing FOR THE FIRST TIME!\n\nRemember: Givers are Receivers</b></font>', '91', 'Apr 12, 2017 15:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `gethelp`
--

CREATE TABLE `gethelp` (
  `ID` int(255) NOT NULL,
  `ghID` varchar(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `amountGH` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL DEFAULT '0',
  `ghDATE` varchar(255) NOT NULL,
  `merge` varchar(255) NOT NULL DEFAULT 'NO',
  `user_status` varchar(255) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gethelp`
--

INSERT INTO `gethelp` (`ID`, `ghID`, `participantID`, `amountGH`, `balance`, `ghDATE`, `merge`, `user_status`) VALUES
(1, 'Q394948969', '3', '12000', '0', '2017-09-04', 'YES', 'active'),
(2, 'V227428130', '7', '20000', '0', '2017-09-04', 'YES', 'active'),
(13, 'Q407394987', '1', '18000', '0', '2017-09-04', 'YES', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `leftover`
--

CREATE TABLE `leftover` (
  `id` int(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leftover`
--

INSERT INTO `leftover` (`id`, `pid`, `amount`) VALUES
(1, '3', '0'),
(2, '7', '0'),
(3, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `leftover_admin`
--

CREATE TABLE `leftover_admin` (
  `id` int(255) NOT NULL,
  `amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leftover_admin`
--

INSERT INTO `leftover_admin` (`id`, `amount`) VALUES
(1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `merge_gh`
--

CREATE TABLE `merge_gh` (
  `mergeID` int(255) NOT NULL,
  `phID` varchar(255) NOT NULL,
  `ghID` varchar(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `gh_participantID` varchar(255) NOT NULL,
  `amountGH` varchar(255) NOT NULL,
  `dateMerge` varchar(255) NOT NULL,
  `dateMerge_expires` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `time_upload` varchar(255) NOT NULL,
  `auto_confirm` varchar(255) NOT NULL,
  `gh_letter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merge_gh`
--

INSERT INTO `merge_gh` (`mergeID`, `phID`, `ghID`, `participantID`, `gh_participantID`, `amountGH`, `dateMerge`, `dateMerge_expires`, `attachment`, `status`, `time_upload`, `auto_confirm`, `gh_letter`) VALUES
(1, 'Z1221926367', 'Q394948969', '9', '3', '4000', '04.09.2017 18:38', 'Sep 06, 2017 20:38:00', '', '', '', '', ''),
(2, 'Z1171242230', 'Q394948969', '2', '3', '4000', '04.09.2017 18:38', 'Sep 06, 2017 20:38:00', '', '', '', '', ''),
(3, 'Z1112166616', 'Q394948969', '4', '3', '4000', '04.09.2017 18:38', 'Sep 06, 2017 20:38:00', '2017_09_04_10_33_POPIMG-20150524-WA0001.jpg', 'Confirmed', '', '', ''),
(4, 'Z1112166616', 'V227428130', '4', '7', '6000', '04.09.2017 18:39', 'Sep 06, 2017 20:39:00', '2017_09_04_10_43_POPIMG-20150524-WA0001.jpg', 'Confirmed', '', '', ''),
(5, 'Z1128919760', 'V227428130', '2', '7', '7000', '04.09.2017 18:39', 'Sep 06, 2017 20:39:00', '', '', '', '', ''),
(6, 'Z1115917221', 'V227428130', '6', '7', '7000', '04.09.2017 18:39', 'Sep 06, 2017 20:39:00', '', '', '', '', ''),
(7, 'Z1115917221', 'Q407394987', '6', '1', '6000', '04.09.2017 18:40', 'Sep 06, 2017 20:40:00', '', '', '', '', ''),
(8, 'Z1118684481', 'Q407394987', '5', '1', '5000', '04.09.2017 18:40', 'Sep 06, 2017 20:40:00', '', '', '', '', ''),
(9, 'Z1201578008', 'Q407394987', '8', '1', '7000', '04.09.2017 18:40', 'Sep 06, 2017 20:40:00', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `newslogged`
--

CREATE TABLE `newslogged` (
  `ID` int(255) NOT NULL,
  `loggedID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsupdate`
--

CREATE TABLE `newsupdate` (
  `news_id` int(255) NOT NULL,
  `news_subject` varchar(255) NOT NULL,
  `newsmsg` longtext NOT NULL,
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsupdate`
--

INSERT INTO `newsupdate` (`news_id`, `news_subject`, `newsmsg`, `date_written`) VALUES
(1, 'WELCOME TO GIVERSCYCLER', 'Dear participant,\r\n\r\nWelcome to GiversCycler. Giverscycler is a peer to peer mutual aid community where participant help each other and get helped in return. The system is based on mutual understanding where all participant have a goal of making profit in return.\r\n\r\nEndeavor to abide to the rules and regulation guiding the community. Take advantage of the 10% referral bonus when you invite your friends and loved ones.\r\n\r\nPromote GiversCycler in the best way you can and the widest publicity it deserves. \r\n\r\n<font color=\'red\'><b>NOTE: </b></font> Fake Proof Of Payment (POP) is an enemy of the system.\r\n\r\n\r\n<font color=\'green\'><b>Remember: Givers are Receivers</b></font>', 'Mar 26, 2017 01:30:31 PM'),
(2, 'UPGRADE ON MERGING PROCESS', 'Dear participants\r\n\r\nAn upgrade was made in order to flush out un-serious participant. We are sorry for any error you might have encountered. \r\n\r\nOur developers are working round the clock to make GIVERSCYCLER a success!\r\n\r\n\r\n<font color=\'red\'><b>NOTE:</b></font> Fake Proof Of Payment (POP) is an enemy of the system.\r\n\r\n\r\n<font color=\'green\'><b>Remember: Givers are Receivers</b></font>', 'Mar 31, 2017 07:07:07 PM'),
(3, 'MERGING PROCESS', 'Dear participant,\r\n\r\n	An upgrade was made from a 2 by 1 matrix to a random merging.\r\n	\r\nThis means you dont have to wait for someone who activated the same package as you did.\r\n\r\nThe upgrade is to facilitate pairing between participants who are ready to pay and enhance the rate at which participants are been paid back. \r\n\r\nWe are working hard to make GIVERSCYCLER a success. Take advantage of the 10% referral bonus when you invite your friends and loved ones.\r\n\r\nLets join hands together to build a better community.\r\n\r\n\r\n<font color=\'green\'><b>Remember: Givers are Receivers</b></font>', 'Apr 09, 2017 09:15:06 PM'),
(4, 'OUTSTANDING GET HELP METHOD', 'Due to low PH in the system and participant GHing without PHing back to the community,  we have resulted to \'PH to GH\'. PH any amount and get 200% of your new PH plus 100% of your old GH, to make 300% GH.\r\n\r\nFor instance: \r\nOustanding GH: N40,000\r\nNew PH: N10,000\r\n\r\nGet Help Order: N30,000 (New PH * 300%)\r\nOutstanding GH balance: N40,000 - N10, 000 = N30,000\r\n\r\nRecommitment is the Key.\r\n\r\nGivers are Receivers.', 'Apr 11, 2017 08:07:47 AM');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `pid` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `invite` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`pid`, `name`, `mobile`, `email`, `password`, `invite`, `status`) VALUES
(1, 'oluwatayo', '2349033024846', 'oluwatayoadeyemi@yahoo.com', '3a732cc2:65b8a35b447a5152d94cae4a6613f7ba', '', 'active'),
(2, 'chiedozie smart', '2347065209281', 'chiboysmart@gmail.com', '3a732cc2:5564f1f6c1215c6410eabeedc80fda41', '1', 'active'),
(3, 'vicezet', '2348103374417', 'vicezet@yahoo.ca', '3a732cc2:ba570d4913b34467eed31d64d782f937', '1', 'active'),
(4, 'oluwatoyin', '2348167975572', 'soyewooluwatoyin@hotmail.co.uk', '3a732cc2:8d83d05a3eb1c2b25814781c604367e9', '1', 'active'),
(5, 'azeezat', '2349066865915', 'ogundowoleraheem@gmail.com', '3a732cc2:9728855d247b98c627f2aa875843838f', '1', 'active'),
(6, 'ryyhmez', '2348141359005', 'adamilola98@gmail.com', '3a732cc2:7f2cbe23c1bf33e2e05f18e1bb64d29a', '1', 'active'),
(7, 'gozkid', '2347085474898', 'chideraabalu@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(8, 'sunkanmi', '2349038020342', 'muniruolasunkanmi@gmail.com', '3a732cc2:a0bba027b0b4723070046f6e22c7985a', '1', 'active'),
(9, 'topzy', '2348186319382', 'ipeletemitope@gmail.com', '3a732cc2:49efcc44febd3bc4920391001e5d6365', '1', 'active'),
(10, 'silvio', '2347013604664', 'silvionwaneri@gmail.com', '3a732cc2:d6b9e79eb0283286482e03e31decb4a0', '1', 'active'),
(11, 'kidafaze ', '2348114197899 ', 'kidafaze@gmail.com', '3a732cc2:6b92ea2e56d848369793fdf9da50c697', '1', 'active'),
(13, 'ebino', '2348139597130', 'ajayiebenezer3@gmail.com', '3a732cc2:218278e5c3fc7a47fde2309933d2d6de', '1', 'active'),
(14, 'yungkida ', '2349078609450 ', 'fathookay.ode1@hotmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(16, 'fadare.odunayo', '2348138515240', 'jjonesjjessica@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '1', 'active'),
(17, 'saintdew', '2347062562948', 'dewumiseun@yahoo.com', '3a732cc2:72b302bf297a228a75730123efef7c41', '3', 'active'),
(18, 'prince xyz ', '2348038210531', 'hamzatademola@rocketmail.com', '3a732cc2:af746e7acf22cd1844502bd6967fe46b', '1', 'active'),
(19, 'otunba coded', '2349035318278', 'otunbaoluseun@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(20, 'giwa abdulahi ', '2347032121625', 'bammy2588@yahoo.com', '3a732cc2:7e7657f88fc018a0748a5d118828a82f', '6', 'active'),
(21, 'suaress', '2347059484884', 'collingsnigajames@gmail.com', '3a732cc2:8970eead8ab9c9ac6fc204c492b06927', '1', 'active'),
(22, 'olori coded', '2348133216541', 'oluseunomowolewa@gmail.com', '3a732cc2:7ba520275a8bee46ee5b2cf95e815aee', '19', 'active'),
(23, 'ogechukwu', '2348067423254', 'ogechukwu4best@gmail.com', '3a732cc2:c99800ee19854ebdfc171af2e300f800', '1', 'active'),
(24, 'stiles ', '2347066001317', 'stiless634@gmail.com', '3a732cc2:960fd0320d5b12b2da0481b6f8823ff6', '1', 'active'),
(25, 'bakpo5', '2349056152876', 'barinembakpo@gmail.com', '3a732cc2:5e9c26e196c256d1c4d5f90764a28fae', '1', 'active'),
(26, 'bigah5', '2348036239037', 'jbigah@yahoo.com', '3a732cc2:938921eb57c7fdc61b94aa94ff168769', '25', 'active'),
(27, 'ngstar', '2348032023115', 'ngoziishe@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(28, 'bigah55', '2348105869025', 'jbigah5@yahoo.com', '3a732cc2:5e9c26e196c256d1c4d5f90764a28fae', '25', 'active'),
(29, 'caroline', '2348035624309', 'carolineeze@yahoo.com', '3a732cc2:ed986b825f9b1ea3cad8c5f6be3dbafd', '3', 'active'),
(30, 'lucy', '2348175174131', 'lucyoforka@gmail.com', '3a732cc2:673eb027e9c056f57140322807351dd5', '1', 'active'),
(31, 'arowolo ', '2348145856060', 'arowolo886@gmail.com', '3a732cc2:a8aa702f46c0dee75d69302f8e7f03fd', '1', 'active'),
(32, 'femi', '2348061673707', 'femi4real86@yahoo.com', '3a732cc2:b4e3596315834106ead253c1e384d11b', '1', 'active'),
(33, 'holluphix', '2348174464405', 'olufemiolowe@yahoo.com', '3a732cc2:998a2a90367ff80f9931db1e06b7312a', '4', 'active'),
(34, 'nikegreat ', '2348067653075', 'ruthariyo2009@gmail.com', '3a732cc2:20b46cf12e7b5e8aab86c6dfebf83a0c', '1', 'active'),
(35, 'olusola', '2348063130369', 'oladejosola11@gmail.com', '3a732cc2:4dde37b983c00896077d04dc941dc8d5', '1', 'active'),
(36, 'sheymax', '2348161113034', 'd@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(37, 'arowolonation', '2349037119639', 'arowolo886@yahoo.com', '3a732cc2:a8aa702f46c0dee75d69302f8e7f03fd', '31', 'active'),
(38, 'flamezbaba', '2348069388976', 'ebenezery4lord.push@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(39, 'justice', '2347030509559', 'adeyojuisrael@gmail.com', '3a732cc2:a256a73b169cea3a5c2a46a28babf949', '1', 'active'),
(40, 'shaymax', '2348030613363', 'shaymaxstephen9@gmail.com', '3a732cc2:ccb5b524c2e585aa5d4c14f9867ae331', '6', 'active'),
(41, 'obeyu', '2348105624086', 's.ajibade2011@gmail.com', '3a732cc2:2464e0e0626ad2f92d3250154dcd6184', '1', 'active'),
(42, 'coolestbabe', '2348186025349', 'adigunolabisi44@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '8', 'active'),
(43, 'mayodele', '2347061342779', 'mayordonfocus@yahoo.com', '3a732cc2:8975f07e63bd657114a57de7c9315cb3', '1', 'active'),
(45, 'lawrence', '2348169427654', 'lawrencefemi35@gmail.com', '3a732cc2:c6224c1be072bf5556817749c32e40c6', '8', 'blocked'),
(46, 'gbolahan osuolale', '2348077521150', 'gbolaahan29@gmail.com', '3a732cc2:ba111e5511f3a0f0982c63ed1fcda9a5', '1', 'active'),
(47, 'ade1', '2348070709818', 'ade4distinction@gmail.com', '3a732cc2:6565f68ade9509520c263e1ed7fb2e20', '8', 'active'),
(48, 'femzy', '2347064422308', 'femitunji2980@gmail.com', '3a732cc2:e149ce0c0397dbf6ecc4f65c6388d16a', '6', 'active'),
(49, 'samuel ', '2348105371745', 'oyedeposam@gmail.com', '3a732cc2:6565f68ade9509520c263e1ed7fb2e20', '47', 'active'),
(50, 'heywhy', '2347064468496', 'ayodele824@gmail.com', '3a732cc2:a3821f620f2c8efece3c124faed0e2e8', '6', 'active'),
(51, 'tolu ', '2348145631872', 'obasipetolu@gmail.com', '3a732cc2:7ba85531758a37ea0187a32a891dd171', '47', 'active'),
(52, 'jayman', '2347053862010', 'ewejobiolajide@gmail.com', '3a732cc2:c390e55005098be4c9aa8c03cc48e358', '47', 'active'),
(53, 'triplea', '2348140455407', 'adeyemoademola92@gmail.com', '3a732cc2:5f503a1d238e0528d56478bf5373cdbb', '1', 'active'),
(54, 'holo', '2348100535417', 'holorunzei@gmail.com', '3a732cc2:bbd7b515f76c402b7541aaf4b28cfc8f', '1', 'active'),
(55, 'seun', '2347018896220', 'runzeiholo@gmail.com', '3a732cc2:bbd7b515f76c402b7541aaf4b28cfc8f', '54', 'active'),
(56, 'wunmi', '2349094882115', 'adewunmiholarbissy@gmail.com', '3a732cc2:4a633affa0b3d7dd1091e2855a775969', '1', 'active'),
(57, 'shola', '2349053477715', 'sholaadetowubo2016@gmail.com', '3a732cc2:73c9150f4e1dda6a456cbaee7203535b', '1', 'active'),
(58, 'jossybays', '2348160611196', 'bayodeseye@gmail.com', '3a732cc2:ca53f986984328544cf6147e11ac90f7', '1', 'active'),
(59, 'badmus abidemi', '2348162676137', 'abidemibadmus16@gmail.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '1', 'active'),
(60, 'whochey', '2347066991062', 'whochey@yahoo.com', '3a732cc2:3901f84fd174d620ab83d59b48fb793e', '3', 'blocked'),
(64, 'iyasuper', '2348060413208', 'arowosayem@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '1', 'active'),
(65, 'mummynike', '2348147812489', 'talonge83@yahoo.com', '3a732cc2:14edd42761eb759b935356e8acf5743e', '64', 'active'),
(66, 'dj femmite', '2348160810082', 'djfemmite48@gmail.com', '3a732cc2:1fcb9adeca701fe6d6045c61c438d268', '1', 'active'),
(67, 'emmatosh ', '2348163218532', 'emmatosh1994@gmail.com', '3a732cc2:5459b797349869876ca0a32029ed900d', '19', 'active'),
(68, 'hayourdele', '2348056558010', 'ayodele4u@yahoo.com', '3a732cc2:f500c23acc9bb55470d0ba83d117b213', '1', 'active'),
(69, 'asiru ayodele', '2348069366240', 'ayodele4uluv@yahoo.com', '3a732cc2:f500c23acc9bb55470d0ba83d117b213', '1', 'active'),
(70, 'timmylehin', '2348115948799', 'fakoredetimilehindavid@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '1', 'active'),
(71, 'timilehin', '2349070218253', 'davidfakorede@gmail.com ', '3a732cc2:6bfef0cb52897a127fb54b8a4511c889', '4', 'blocked'),
(72, 'hadesam9', '2348105745554', 'hadesam9@gmail.com', '3a732cc2:ffab4bc5e3cd7a224175d4c460feff3f', '45', 'active'),
(73, 'ladyk', '2348167717337', 'kafayatbadmus2016@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '64', 'active'),
(75, 'opeyemi', '2347016892882', 'ajibolaolalekan@yahoo.com', '3a732cc2:3118370b906a85eb12e23605b9a6ed2f', '19', 'active'),
(76, 'harbaryorme', '2348149959043', 'onaolapotimileyinabayomi@gmail.com', '3a732cc2:ccdc089a770574c6c832963219d5b35e', '1', 'active'),
(77, 'dhammy', '2349037028642', 'richardbrooks0001@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '19', 'active'),
(78, 'olukanni lekan', '2348148703720', 'olukannilekan02@gmail.com', '3a732cc2:39b1b669fbdf0d4f6a51df2de116c09d', '1', 'active'),
(79, 'lizzy', '+2347056015979', 'elizabeth23@gmail.com', '3a732cc2:dcbd79dc238336e1086e1cc8c36683e0', '69', 'blocked'),
(80, 'princess', '2348027861727', 'princesst@yahoo.com', '3a732cc2:ed986b825f9b1ea3cad8c5f6be3dbafd', '3', 'active'),
(81, 'adesola', '2347034340980', 'adesola@yahoo.com', '3a732cc2:1e2cb517c6db7b507d5ff347b32075ca', '3', 'active'),
(82, 'adesolaeze', '2347038537757', 'adesolaeze@yahoo.com', '3a732cc2:ed986b825f9b1ea3cad8c5f6be3dbafd', '3', 'active'),
(83, 'ambrose kush', '+2349060022013', 'ibrahimsulaimon21@gmail.com', '3a732cc2:aa47f8215c6f30a0dcdb2a36a9f4168e', '1', 'active'),
(84, 'bayor', '2348145661426', 'johnrossi81@gmail.com', '3a732cc2:2464e0e0626ad2f92d3250154dcd6184', '1', 'active'),
(85, 'princessadesola', '2348172388159', 'princessadesola@yahoo.com', '3a732cc2:ed986b825f9b1ea3cad8c5f6be3dbafd', '3', 'active'),
(86, 'joseph', '2349091444169', 'williamwitney30@gmail.com', '3a732cc2:ca53f986984328544cf6147e11ac90f7', '1', 'active'),
(87, 'somadina ufondu', '2348139049292', 'somadinaufondu@gmail.com', '3a732cc2:4d9dbc13029cb7fc87c925b0c2dcb69b', '1', 'active'),
(88, 'adebowale', '2349050116656', 'oluwabisi2017@gmail.com', '3a732cc2:e0e34c5ad05aac3eef6ab31eacbf7a5c', '1', 'active'),
(89, 'oluchukwu ufondu', '2348079157430', 'sufondu@yahoo.com', '3a732cc2:4d9dbc13029cb7fc87c925b0c2dcb69b', '30', 'active'),
(90, 'quadrado', '2349032083485', 'hoseniqudry12@gmail.com', '3a732cc2:29a85b4ac6a206db5582035bedaf631b', '19', 'active'),
(91, 'mummybarakat', '2347051633306', 'gmarym83@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '1', 'active'),
(92, 'gbemtos1', '2348079896780', 'kl_gbenga@yahoo.com', '3a732cc2:6f1c9e6a991fde4c67cc953a63c61106', '1', 'active'),
(93, 'omowumi omolara arowosaye', '2348062426529', 'omowumiomolara110@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '1', 'active'),
(94, 'tmm', '2347066821400', 'tmm@yahoo.com', '3a732cc2:2343ec78a04c6ea9d80806345d31fd78', '29', 'active'),
(95, 'gbenga', '2347068423405', 'obe.oluwagbenga@gmail.com', '3a732cc2:44fc8f1944e23c08f19984f299bd9354', '4', 'active'),
(96, 'charming ', '2347065209280', 'amakajoy@yahoo.com', '3a732cc2:5564f1f6c1215c6410eabeedc80fda41', '2', 'active'),
(97, 'iya lukman', '2348057348834', 'badmoskafayat2016@gmail.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'active'),
(98, 'iwosunday', '2347065221924', 'iwosunday101@gmail.com', '3a732cc2:687558ff79c6d35868116f0ee1ff0271', '6', 'active'),
(99, 'olakavic', '2348067784890', 'olakavic@yahoo.com', '3a732cc2:c1cae9071bca745a8aaecce872f049e4', '9', 'active'),
(100, 'rashy', '2348059299439', 'ambalirasheed689@email.com', '3a732cc2:9c6d9e2c6501a6a8312e84f93b518cd9', '64', 'blocked'),
(101, 'smile', '2348169276673', 'bolarinwaazeez68@yahoo.com', '3a732cc2:c73133d4276d40ec72fd16bdba74305d', '1', 'active'),
(102, 'big daddy', '2348139124594', 'lookmanabidemibadmus16@yahoo.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'active'),
(103, 'justin', '2347017512014', 'justinobinna216@yahoo.com', '3a732cc2:0b1772588fbc40e408e0eeecec85f630', '33', 'active'),
(104, 'hobhena', '2349023008421', 'josephobinna216@yahoo.com', '3a732cc2:0b1772588fbc40e408e0eeecec85f630', '33', 'active'),
(105, 'oluwatoyin deborah ayandiran', '2348078294388', 'ayandiran@yahoo.com', '3a732cc2:45c12241226892286f24b4b9b2f05444', '64', 'active'),
(106, 'princesscaroline', '2348161580240', 'princesscaroline@yahoo.com', '3a732cc2:ed986b825f9b1ea3cad8c5f6be3dbafd', '29', 'active'),
(107, 'badmus kafayat', '2349057104599', 'badmus@yahoo.com', '3a732cc2:188ad7a7b03da17034136ee0a552ad2b', '64', 'active'),
(108, 'adisababa', '234701 689 2882', 'akanjiolalekan@yahoo.com', '3a732cc2:3118370b906a85eb12e23605b9a6ed2f', '1', 'blocked'),
(109, 'garba maryam', '2348062426520', 'garba@yahoo.com', '3a732cc2:971e3a58ec1110274d4d1b69d06002c4', '64', 'blocked'),
(110, 'mickymanty', '234805466763', 'mattasandra015@gmail.com', '3a732cc2:56cf01f6edfe9598b5e23407fe290990', '33', 'active'),
(111, 'eze emmanuel', '2349065054919 ', 'fabulousrichy@gmail.com', '3a732cc2:cc077e4074d58b5b3afe96921b220364', '1', 'blocked'),
(112, 'horlarmilekam ', '2347066072793', 'horlarmilekam.oyeleke@facebook.com', '3a732cc2:4b0fb1a7a664aab8c0a279ce0b62279a', '33', 'active'),
(113, 'idris ayuba olalekan', '2348068984940', 'olalekanayuba855@gmail.com', '3a732cc2:bd2feb61057e0c7d9c733d7ad909be19', '64', 'active'),
(114, 'bukhy', '234813 684 1739', 'racheal005@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(115, 'abiolaadebayo', '2348037007899', 'abiolaadebayo@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(116, 'ruth toriola chioma', '2348024954622', 'toriolachioma@yahoo.com', '3a732cc2:93426bb0a16d10294b5f59089ff76363', '64', 'active'),
(117, 'alonge adenike islamiyat', '2349038229060', 'nikealonge@yahoo.com', '3a732cc2:14edd42761eb759b935356e8acf5743e', '64', 'active'),
(118, 'ostenfo surush', '2348105741887', 'otunbaoluseun62@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '19', 'active'),
(119, 'alonge adeyemi sulaiman', '2348133692568', 'adeyemi@yahoo.com', '3a732cc2:524156fcb43944259ccb31607c411688', '64', 'active'),
(120, 'aku kizito', '2349094143735', 'akunanwa11@gmail.com', '3a732cc2:9ebe55bfb4401434da159f458997dd16', '1', 'blocked'),
(121, 'mayour22', '2348060354972', 'koladegbenga6@gmail.com', '3a732cc2:6f1c9e6a991fde4c67cc953a63c61106', '92', 'active'),
(122, 'victoria adisa', '2348059399674', 'adisa@yahoo.com', '3a732cc2:055940752793da5fcf42416503fe2341', '64', 'active'),
(123, 'mummytiwa', '2349086388086', 'tiwa@yahoo.com', '3a732cc2:2dc0991c5f0409d20993529411198d70', '64', 'active'),
(124, 'king swag', '2348068776152', 'adegbolaope7@gmail.com', '3a732cc2:870a37d1541491fe158b43b898c15b2c', '54', 'active'),
(125, 'owuboy', '2349034321666', 'olowuferanmi@yahoo.com', '3a732cc2:2b805c44a7ea238298aadc24d2788d10', '33', 'active'),
(126, 'eze', '2348026360788', 'vicezet@gmail.com', '3a732cc2:0f917cde2c10da2710e2ee7d4e93b275', '3', 'active'),
(127, 'emmanuel', '234811 970 8090', 'schiboy@yahoo.com', '3a732cc2:5564f1f6c1215c6410eabeedc80fda41', '2', 'active'),
(128, 'ipele1', '2348088315743', 'ipeletemitope@yahoo.com', '3a732cc2:81bae4347792d0818eb56b371db77639', '9', 'active'),
(129, 'olabest2017', '23481365970360', 'olamilekan67real@yahoo.com', '3a732cc2:695e06655143c0d6c31e47e356558132', '1', 'blocked'),
(130, 'shantel', '2348055300360', 'otunbacoded@gmail.com', '3a732cc2:487da9f7092bcf31b2b88da71d00f8ce', '19', 'active'),
(131, 'rochester ', '2349022496103', 'abianoh8@gmail.com', '3a732cc2:44cfd1180c92efbea3a7ce5c5f5cb2e2', '31', 'active'),
(132, 'hormortaryor', '2349036378867', 'omotayoomotosho97 @gmail.com', '3a732cc2:b1822f4776bac7c0847f47b46899c371', '9', 'active'),
(133, 'zee', '2348060782557', 'zolaitan933@gmail.com', '3a732cc2:3de2334a314a7a72721f1f74a6cb4cee', '9', 'active'),
(134, 'ogundiran samuel', '2348132484897', 'samuelleks201@gmail con', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '1', 'active'),
(135, 'major leks ', '2349029047415', 'samuelleks201@gmail com', '3a732cc2:63ebb9250f49340aece8d4ac541eaf61', '1', 'active'),
(136, 'jacob', '2348064631952', 'olaitan_ogundiran@yahoo.com', '3a732cc2:6ffacd8cd75411e785dcd9de4a3dd36a', '1', 'blocked'),
(137, 'suliababy', '234905 714 4010', 'omotosho96@gmail.com', '3a732cc2:d5fd190f23a526f818c97125fdb03b73', '9', 'active'),
(138, 'himole', '2347059769465', 'damilolasusan42@gmail.com', '3a732cc2:ff2ef62be448543f63226666cbbcdf96', '1', 'active'),
(139, 'pope', '2347080800011', 'popeken4real@gmail.com', '3a732cc2:25f9e794323b453885f5181f1b624d0b', '1', 'blocked'),
(140, 'benoniz', '2349038509341', 'awesogo@6gmail.com', '3a732cc2:98ce01374363908b420393eecd6a82e2', '4', 'active'),
(141, 'zhicky', '2347089591168', 'ezekielbnjoko@yahoo.com', '3a732cc2:7c251c91e51a9343e5f6399dfa1b7ad6', '1', 'active'),
(142, 'abidal', '2348152601509', 'abigail.betiku@yahoo.com', '3a732cc2:37a6ab47beccb87b864ed1a37d27b639', '40', 'active'),
(143, 'adewoye stephen ', '2348168594738 ', 'stephenpapidose@gmail.com', '3a732cc2:5de5ed54ddbe22e60e10d48f803e288c', '1', 'active'),
(144, 'stephendose', '2348159544286 ', 'stephenadewoye1@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'active'),
(145, 'esther omolade ', '2348140275809', 'estherakinmade70@gmail.com', '3a732cc2:65f9912a2f1b78a21421b82a0ebd8c98', '144', 'active'),
(146, 'kardy ', '2348169370112', 'ken10ky2k4@yahoo.com', '3a732cc2:844f61002f7b9bd278b605d03006c428', '1', 'active'),
(147, 'oladlan', '234807 277 1664', 'oladlan@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(148, 'operella', '2347033382976', 'olusijiopeyemimary@gmail.com', '3a732cc2:7e58951f99352e53a23f8d0eb996acca', '1', 'blocked'),
(149, 'omomummy', '2348119851364', 'arowoloaminat886@gmail.com', '3a732cc2:a8aa702f46c0dee75d69302f8e7f03fd', '31', 'active'),
(150, 'caroline eze', '2347060732046', 'ezecaroline03@gmail.com', '3a732cc2:7dc3c8270e6e3a10dc337d8bc7f3733a', '148', 'active'),
(151, 'princess t', '2348036358220', 'caroline2000@yahoo.com', '3a732cc2:7dc3c8270e6e3a10dc337d8bc7f3733a', '148', 'active'),
(152, 'shrimp', '2347033297484', 'lindaatinuke15@gmail', '3a732cc2:3a94e9148f27dda2387a436f9f26a256', '17', 'active'),
(153, 'fissy', '2348079045283', 'dewumiseun@gmail.com', '3a732cc2:3a94e9148f27dda2387a436f9f26a256', '17', 'active'),
(154, 'ibrahim ismaila ', '2347036302526', 'toppsson55@gmail.com', '3a732cc2:3e6eeed87395809b06c5ee149431c03d', '1', 'active'),
(155, 'olafoward', '2348168261591', 'olaseun4christ@gmail.com', '3a732cc2:e2ca77927715767c0f10247802229de8', '34', 'active'),
(156, 'd.magg baller', '2347053631016', 'donhaye12@gmail.com', '3a732cc2:c1b5a18cb7f1fc5f4e5b6c3c131cd4f8', '1', 'active'),
(157, 'droff', '2349066849995', 'fatokevin44@gmail.com', '3a732cc2:dc9c65ebe27d05846243ce9c5a229a76', '17', 'active'),
(158, 'pac', '2349093437375', 'awololaoluwapelumi@gmail.com', '3a732cc2:b941a5a8923b148925b6cc32cf875c13', '10', 'active'),
(159, 'Nifemi', '2348174239824', 'ifeanaeke@yahoo.com', '3a732cc2:5564f1f6c1215c6410eabeedc80fda41', '1', 'active'),
(160, 'omolara', '2348073978230', 'rukayatomolara689@email.com', '3a732cc2:9c6d9e2c6501a6a8312e84f93b518cd9', '100', 'blocked'),
(161, 'wizzy', '2348131150786', 'wizzy@yahoo.com', '3a732cc2:3901f84fd174d620ab83d59b48fb793e', '1', 'blocked'),
(162, 'young stunna', '2348057047114', 'isaacbiobaku01@yahoo.com ', '3a732cc2:6a027dbda62658e2ddba2fa7bab927ad', '10', 'active'),
(163, 'dheejay', '2348131589879', 'dheejay@yahoo.ca', '3a732cc2:61da8dbbdc58adf7e87ce85ab960a244', '17', 'active'),
(164, 'jacinta', '2348034843914', 'seejacy@gmail.com', '3a732cc2:553c63d4da2796a52508d9f87246d54c', '87', 'active'),
(165, 'princesst', 'â€­08148934281â€¬', 'adesola1@gmail.com', '3a732cc2:7dc3c8270e6e3a10dc337d8bc7f3733a', '148', 'active'),
(166, 'adejumo john olusegun', '2347032565826', 'adejumo@yahoo.com', '3a732cc2:c913aaf483c338407f5840a045c324a8', '1', 'active'),
(167, 'odunola', '2349034631799', 'olaibi689@email.com', '3a732cc2:9c6d9e2c6501a6a8312e84f93b518cd9', '160', 'blocked'),
(168, 'seunnay', '234810 272 0494', 'seunnay@yahoo.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(169, 'cpt1', '2348057793916', 'kennyrite@yahoo.com', '3a732cc2:b7b326f816ea45655822bb5e0e11ee49', '6', 'active'),
(170, 'bhadmus wura', '2348033652001', 'wuraolami2016@gmail.com', '3a732cc2:b551d371904a133eb0350d5d0d1c523c', '1', 'active'),
(171, 'owoblow', '2348060116754', 'bolasmoney@gmail.com', '3a732cc2:c9eff22cb7b542f650f608d2bd1cefcf', '19', 'blocked'),
(172, 'highzic', '2349096679534', 'highzic320@gmail.com', '3a732cc2:10f9dc94a65c08d09fb94a19ce78c7d5', '76', 'active'),
(173, 'lollytush', '2349097272956', 'ogundoyinfunmilola@gmail.com', '3a732cc2:f509a870b242d75b8a001f9196dd1cca', '19', 'blocked'),
(174, 'abakwue samuel n.', '2347081575493', 'abax4all1@gmail.com', '3a732cc2:a4c091f348cb41fcfc160901895b21f0', '10', 'blocked'),
(175, 'royetunji', '2348062569290', 'sunmbomoye@gmail.com', '3a732cc2:9df487da767c2e0275cbc9c9a6ba0f23', '34', 'active'),
(176, 'tolariyo', '2348032242892', 'tolariyo2001@gmail.com', '3a732cc2:673e970f578857fa2f2200f183aa2e41', '34', 'active'),
(177, 'mr dotun', '2348062411975', 'akinlolu.adedotun@yahoo.com', '3a732cc2:67da28abaeb786e6abbed5340e75abc2', '6', 'active'),
(178, 'james', '234818226444', 'dada@gmail.com', '3a732cc2:6d2cf3fdab44bdfc1990230f21e4c25d', '1', 'blocked'),
(179, 'pdaniel', '2348175278656', 'patiencedaniel1999@gmail.com', '3a732cc2:19c4982a848cc0b220ced4fb82d89de4', '10', 'blocked'),
(180, 'gadoo', '2348144478020', 'esekhadegad@gmail.com', '3a732cc2:a8aa702f46c0dee75d69302f8e7f03fd', '31', 'active'),
(181, 'nhero', '2348141753347', 'mhiztanhero@gmail.com', '3a732cc2:348b10ea1ebeae408e127babd65ded11', '14', 'active'),
(182, 'woman', '2348165304656', 'lookmanabidemibadmus@yahoo.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'active'),
(183, 'bose ajibade', '2348060050122', 'boseajibade@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '64', 'active'),
(184, 'oluwa aderonke temitope', '2348107752425', 'oluwa@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '64', 'active'),
(185, 'jasmine', '2340816 478 2322', 'ifeoluwa20@gmail.com', '3a732cc2:f70abaa12fc2765df23746c5309f4aa1', '1', 'active'),
(186, 'omobolanle', '2348139329997', 'omobolanleainaamadin@outlook.com', '3a732cc2:8416fff945ed440714ae0efcbd9b2b77', '3', 'blocked'),
(187, 'franklin', '2347036334604', 'franklinoladapo@outlook.com', '3a732cc2:0fe1b0954fd9c5b5d1c1fc28704543a1', '3', 'active'),
(188, 'oyemayowa', '2348138836361', 'oyemayowaajokeoye@outlook.com', '3a732cc2:beb057040b2803a110471402a724c8e0', '3', 'blocked'),
(189, 'ladiano ', '2348136355615', 'olowolayioladipupo@gmail.com', '3a732cc2:13ee28eadde3c2606dedda721941ebee', '31', 'active'),
(190, 'mhiz b', '2348160158431', 'absobab.b@gmail.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'active'),
(191, 'mhiz kraft', '2347065899087', 'soyewoo2@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '4', 'active'),
(192, 'tim', '2348153473004', 'olusijiabiodun@yahoo.com', '3a732cc2:7e58951f99352e53a23f8d0eb996acca', '148', 'active'),
(193, 'pastor', '2347065962136', 'femirichard43@gmail.com', '3a732cc2:5c8e82f0bdac09f37b0111c79f1fe0fa', '142', 'active'),
(194, 'gracendmercy', '2348023532611', 'aderonke@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '64', 'active'),
(195, 'godfather23', '2347067788941', 'j.oarowolo@gmail.com', '3a732cc2:8c5a0db76058877364ceba914d15a475', '1', 'active'),
(196, 'hefairhorluwah', '2347060647136 ', 'michaelego2011@gmail.com', '3a732cc2:d9a5c8859b59e8ded4f366324d18e287', '14', 'active'),
(197, 'mayowa', '2348074241131', 'akinpelumayowa333@gmail.com', '3a732cc2:3c3a4681a1077d6d9010438c9cd0b334', '1', 'active'),
(198, 'rayboy', '2348033875515', 'lordrayboy@gmail.com', '3a732cc2:b3cf12f0c75e6781781595d9eb8114ff', '1', 'active'),
(199, 'macqueen', '2348109741400', 'macqueenomoruyi@gmail.com', '3a732cc2:c463a8b72023ae30adac0e352565ac8c', '14', 'active'),
(200, 'scarey', '2348096408562', 'olojeoluwamotemi442@gmail.com', '3a732cc2:3de4d56cba81c0779dd1cd9102c17063', '10', 'active'),
(201, 'micheallo ', '2347068585206', 'meekky01@gmail.com', '3a732cc2:322eab8a3055ae29fa65a59264919bb4', '1', 'blocked'),
(202, 'samclef', '2347038201686', 'samclef1759@yahoo.com', '3a732cc2:6f1c9e6a991fde4c67cc953a63c61106', '121', 'active'),
(203, 'ayodeji', '2348186993535', 'young6stem@gmail.com', '3a732cc2:965fa596192a5b71ac584d2cad1fc1d0', '14', 'active'),
(204, 'infinite ', '2349030293478', 'atinsola9367@gmail.com', '3a732cc2:9973653bcbccee1bc5b133b43978979f', '14', 'active'),
(205, 'omodeleid', '2348030730649', 'omodeleid@gmail.com', '3a732cc2:e55fb5f52977e3d950069a37ec3f56ed', '1', 'active'),
(206, 'dido', '2348023325829', 'otunbaoluseun2@gmail.com', '3a732cc2:3c59dc048e8850243be8079a5c74d079', '22', 'active'),
(207, 'ndubuisi ndubuilo', '2348062312265', 'andubisi54@yahoo.com', '3a732cc2:673eb027e9c056f57140322807351dd5', '30', 'active'),
(208, 'wolex', '2348139440556', 'samuellanny411@gmail.com', '3a732cc2:dc0af47a00d9c0af366d9677117ccaa4', '3', 'active'),
(209, 'manlywold', '2348137194260', 'manlyworld2013@gmail.com', '3a732cc2:2044e5bd765497055cf4b229fd5a7022', '1', 'active'),
(210, 'spaxx', '2348147982002', 'emmanuelabalu@gmail. com', '3a732cc2:ee7e4705dd4ac06adfe650c2cdc39bdd', '7', 'active'),
(211, 'chidera dex', '2348108124081', 'gozkidprince@yahoo. com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '7', 'active'),
(212, 'sparxx', '2347068813772', 'gozkidprince@yahoo.com', '3a732cc2:5955a6b7f627938436c1983b1dffdc7d', '7', 'active'),
(213, 'clive', '2348137521636', 'chideraclive@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '7', 'active'),
(215, 'bola abass', '2348032350917', 'abassbola@yahoo.com', '3a732cc2:e10adc3949ba59abbe56e057f20f883e', '1', 'blocked'),
(216, 'aroledebby', '2348032230717', 'adeoyakolabunmi@gmail.com', '3a732cc2:2eea46d1753874c39a375513a125f2f4', '1', 'blocked'),
(217, 'nifemi01', '2349082757173', 'badanifemi16@email.com', '3a732cc2:930c131d831458a95715094d309bb26b', '1', 'active'),
(218, 'eunice kayode ', '2347031369047', 'eunicekayode@gmail.com', '3a732cc2:b2347b41642ce3977cf8eff5c760ea16', '14', 'active'),
(219, 'kidajosh ', '2348101723457', 'kidajoshforreal@gmail.com', '3a732cc2:81b3d97701789943bfa89f923181d8d7', '11', 'active'),
(220, 'kehinde', '2348130892662', 'egbebowalekehinde@gmail.com', '3a732cc2:6c65932df242e8f24d275db008a309e6', '4', 'active'),
(221, 'adekoya adewunmi', '2347058939603', 'adekoyaadewunmi2@gmail.com', '3a732cc2:4130e98b878cad1ee0e874f52563238f', '1', 'active'),
(222, 'ariyibi adewumi', '2348161516305', 'ariyibi35@yahoo.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'blocked'),
(223, 'parry', '2348034206720', 'ayodelepariola826@yahoo.com', '3a732cc2:f0e683d02c2ca43ab4a5551b7fbca458', '142', 'active'),
(224, 'orelope', '2349033515485', 'orelope91@gmail.com', '3a732cc2:a8aa702f46c0dee75d69302f8e7f03fd', '31', 'active'),
(225, 'ajibola', '2348092140632', 'ajibola282@gmail.com', '3a732cc2:bdfc660675f4818455d4655be490ba31', '33', 'active'),
(226, 'licson', '2348022800201', 'licsonjoe0@gmail.com', '3a732cc2:fbe62136c26957b5cac715c75bdf2bff', '1', 'active'),
(227, 'smarty ', '2348037747140', 'ogunjobi_tunji@yahoo.com', '3a732cc2:9d90f8a0c4888512ddd56f77d3abf746', '142', 'active'),
(228, 'jolayemi wale jacob', '2347066995716', 'jolayemi.walejacob@yahoo.com', '3a732cc2:8d01da7a224fe8e11eb6df2ec7bdbe47', '14', 'blocked'),
(229, 'gentle', '2348169319025', 'ugochukwuihejirika2016@yahoo.com', '3a732cc2:c648565ecd714357f6c65ebd64a53ae7', '2', 'active'),
(230, 'aminat ', '2348032278952', 'elizabeth4u2011@gmail.com', '3a732cc2:71787f17cdebf55a46cf316d6f6c847b', '223', 'blocked'),
(231, 'mhiz millz', '2348034566124', 'adesewaadenike7@gmail.com', '3a732cc2:b6700d1080d2a303ef08eaa06c116bc8', '33', 'active'),
(232, 'damilola', '2348154224305', 'muniruahmed@yahoo.com', '3a732cc2:738f16550d6681bab1a333642e590bfc', '8', 'active'),
(233, 'solomon ', '2348135946392', 'solomonokemona@yahoo.com', '3a732cc2:4e20ca29bc3fbd190f385817fe149e24', '1', 'active'),
(234, 'isaiah taiwo', '2348037386024', 'taiwo30@yahoo.com', '3a732cc2:b5bbc8cf472072baffe920e4e28ee29c', '59', 'active'),
(235, 'mr clint', '+2349076376180', 'azeezclinton@gmail.com', '3a732cc2:14b13c8dfec3420156262ecea203332b', '10', 'blocked'),
(236, 'owoh', '2348164179170', 'owohcybercafe@gmail.com', '3a732cc2:b090a86d882be51f9ddb90735c6e7762', '1', 'active'),
(237, 'adigun', '2348186350096', 'ademolasaheed35@yahoo.com', '3a732cc2:c1d4e10407dd7c54dbc69ff5fe49f99b', '236', 'blocked'),
(238, 'sammy', '2348141869592', 'spanama18@gmail.com', '3a732cc2:7fd48edf217ae6594a9d446c127bb6cb', '142', 'active'),
(239, 'mankind', '2348067264976', 'oladoyemakinde@yahoo.com', '3a732cc2:eb1127647b423ae13c238c1361134405', '1', 'active'),
(240, 'sunday', '2349034004497', 'aderemisodiq@yahoo.com', '3a732cc2:9d88aaac8ed1341367a19350387a1ac4', '64', 'blocked'),
(241, 'gold', '2348051671486', 'aremo4u@gmail.com', '3a732cc2:70976c11c7553bfb317e1ff874e4fd10', '33', 'active'),
(242, 'jayfirst', '2348185165823', 'olajuwonokomaamee@gmail.com', '3a732cc2:407bf5dcaf45c28c2afaf5ce74622ddf', '33', 'active'),
(243, 'kenny', '2347056072122', 'madekunlekehinde@gmail.com', '3a732cc2:51d060e8e291a8590903b5dd9c2338a8', '148', 'active'),
(244, 'anxiously101', '2349069494886', 'abiodunswagboi@yahoo.com', '3a732cc2:000ce7cbd549ab3ac00d382bf582f348', '33', 'active'),
(245, 'jazz', '2348035537645', 'jazz@gmail.com', '3a732cc2:393824864b4c0de249af5af8bdd8df70', '1', 'active'),
(246, 'doyin', '2348145315439', 'donhaye@yahoo.com', '3a732cc2:c15656c7be4a3c6fd10573adb97ee29e', '1', 'blocked'),
(247, 'tunechi', '2349032918876', 'barnabasokoji@yahoo.com', '3a732cc2:a4a5f57c4e52bfff2ba0a66570c5f483', '10', 'active'),
(248, 'olumercy', '2348065809379', 'olumercy48@gmail.com', '3a732cc2:aacdccbfcfa582ada820f50f077c57af', '121', 'active'),
(249, 'infomaniah', '2349056734665', 'mathewj4real@gmail.com', '3a732cc2:bb3ccd5881d651448ded1dac904054ac', '33', 'active'),
(250, 'oppie-lee', '2348161346984', 'adekoyejoseun@gmail.com', '3a732cc2:1ea42b2d042f5db384c5cb006eaf4edf', '1', 'active'),
(251, 'dammy', '2348145552157', 'akeemdarosa@yahoo.com', '3a732cc2:7a88a171bd1f06b5bd166a003db43898', '19', 'blocked'),
(252, 'aminat adeyanju', '2348147399966', 'elizabeth4u@yahoo.com', '3a732cc2:bd11465cbbeb763f78ce0347ea43263c', '223', 'active'),
(253, 'tunskash', '2349091153251', 'tunskash@gmail.com', '3a732cc2:8a402a3f969c4aad1ca9d91e75c83dd6', '1', 'active'),
(254, 'tokskenny', '2349091125886', 'toks@gmail.com', '3a732cc2:36d138244ee4baa93e3807b7d2be29f4', '1', 'active'),
(255, 'deotech', '2347052321545', 'deola4tech@gmail.com', '3a732cc2:6603cbf3585f5c06520841b2c11fbcd1', '1', 'blocked'),
(256, 'johnaki', '234703 015 6704', 'johnakinola54@gmail.com', '3a732cc2:36546c644ddb3bb26ae3ab71d3acd928', '33', 'active'),
(257, 'london boy', '2348148978351', 'pastorsam29@yahoo.com', '3a732cc2:645b7589e8c2bf59200e4968b8932992', '19', 'active'),
(259, 'alabi', '2348180968133', 'owolabi689@email.com', '3a732cc2:9c6d9e2c6501a6a8312e84f93b518cd9', '100', 'active'),
(260, 'olamilekan', '2348160184542', 'tosinbaba4luv@hotmail.com', '3a732cc2:bdfc660675f4818455d4655be490ba31', '1', 'active'),
(261, 'azeez ridwan olanrewaju', '2348100583289', 'azeezridwanolanrewaju@gmail.com', '3a732cc2:6d72c862a3a8ebe2897ac1c972c52468', '1', 'blocked'),
(262, 'sandy', '2349065500344', 'sandysnow@yahoo.com', '3a732cc2:5564f1f6c1215c6410eabeedc80fda41', '1', 'active'),
(263, 'jimoh abiodun ', '2349052831522', 'abianoh80@gmail.com', '3a732cc2:44cfd1180c92efbea3a7ce5c5f5cb2e2', '31', 'active'),
(264, 'ojo', '2348052136991', 'jamesdebby89@gmail.com', '3a732cc2:6fd7a1eb70813512942e134ebc8f51ff', '1', 'active'),
(265, 'clinton', '2348105461784', 'azeezclinton2000@gmail.com', '3a732cc2:220c77af02f8ad8561b150d93000ddff', '1', 'active'),
(266, 'emmyly', '2348163328533', 'emmatosh18@gmail.com', '3a732cc2:5459b797349869876ca0a32029ed900d', '1', 'active'),
(267, 'olanrewaju joseph', '2347067934890', 'olanrewaju9653@gmail.com', '3a732cc2:b7de93193532732fef1ae59243831bf7', '266', 'active'),
(268, 'emma', '2349078528453', 'emmatosh18@yahoo.com', '3a732cc2:5459b797349869876ca0a32029ed900d', '266', 'active'),
(269, 'fadi-p', '2348168072670', 'fadipe55@gmail.com', '3a732cc2:2451472c59df217439d055f05def42e0', '8', 'active'),
(270, 'olabisi', '2348136415004', 'horlabissy2017@gmail.com', '3a732cc2:9786300a0b7cc5352dc80a1756bec5f4', '1', 'active'),
(271, 'ayegbusi tope', '2347062380044', 'ayegbusitope46@yahoo.com', '3a732cc2:ed6a4e717d07486254e573ee1f3aff6a', '266', 'active'),
(272, 'omotola', '2348132419577', 'voicetotola@yahoo.com', '3a732cc2:910c0c5e777d6004b78bf8d8d92950b2', '3', 'active'),
(273, 'folu', '2348160830089', 'foludammy@gmail.com', '3a732cc2:8b3df9012ad7b76d4ffc8059f42dbd9d', '266', 'active'),
(274, 'kunle', '2347035071106', 'dekunleowolabi@yahoo.com', '3a732cc2:463bc36c05e53e5dfe2d1fdad1185793', '40', 'active'),
(275, 'owoade', '2348140362082', 'tayo_owoade@yahoo.com', '3a732cc2:6950aac2d7932e1f1a4c3cf6ada1316e', '40', 'active'),
(276, 'idriss', '2348137091000', 'ademolaidris1995@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '6', 'active'),
(277, 'skulboiy', '2349092526639', 'skulboiy@gmail.com', '3a732cc2:43e0dbebfbaa8c97d91f6b76d1d04827', '1', 'active'),
(278, 'bissy', '2348115466951', 'olubissy2017@gmail.com', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '1', 'active'),
(279, 'austine99', '2348092142551', 'ecomog100@yahoo.com', '3a732cc2:7294e9ecdbf64cfc65e57ab0538fa14d', '69', 'active'),
(280, 'akanbi rofiyat', '2348114869501', 'haywhy2015@gmail.com', '3a732cc2:c1d4e10407dd7c54dbc69ff5fe49f99b', '236', 'blocked'),
(281, 'mrs ajibade ', '2349091715642', 'emmatosh1994@yahoo.com', '3a732cc2:5459b797349869876ca0a32029ed900d', '266', 'active'),
(282, 'tiwa', '2347085639818', 'tiwa_tolulope@yahoo.com', '3a732cc2:6f1c9e6a991fde4c67cc953a63c61106', '92', 'active'),
(283, 'ade sammy', '2348141756607', 'sammy1@yahoo.com', '3a732cc2:e8c816b2230d0550292ade33ff1bd8ea', '33', 'active'),
(284, 'princeyomaice', '2348060947261', 'abayomiogundairo@yahoo.com', '3a732cc2:f8934edfcf80f336f4eaf915bfe060ab', '54', 'blocked'),
(285, 'franq', '2349022036973', 'rayowoicho@gmail.com', '3a732cc2:b3cf12f0c75e6781781595d9eb8114ff', '1', 'blocked'),
(286, 'joshua', '2348163180822', 'josunlana@yahoo.com', '3a732cc2:a5fb790df8c6d41b5f3494d330fb53aa', '40', 'active'),
(287, 'torrence', '2347032168836', 'guriyatorrence@gmail.com', '3a732cc2:8cf886b8eb038981cf9dd1c298b83727', '158', 'active'),
(288, 'boyeola', '2348139393903 ', 'boyeola77@gmail.com', '3a732cc2:1224e82a638f92935cafa90b8eac7f23', '155', 'active'),
(289, 'ola', '2348020623624 ', 'iyiolaboye2011@gmail.com', '3a732cc2:c592ee8b837e100a6c789f42baff73ba', '155', 'active'),
(290, 'victor ', '2349092468764 ', 'alphonsodiaz0@gmail.com ', '3a732cc2:ad57b5cc1d8aa5c3749affa5ac54b17f', '1', 'active'),
(291, 'charito20', '2348140428575', 'charito556@gmail.com', '3a732cc2:8b5ed1d3cd94164759de5dfd607f20a2', '1', 'blocked'),
(292, 'emeka', '2347064491689', 'manuel@gmail.com', '3a732cc2:d5c186983b52c4551ee00f72316c6eaa', '1', 'blocked'),
(293, 'saviour', '2347065238767', 'dove@gmail.com', '3a732cc2:25f9e794323b453885f5181f1b624d0b', '1', 'blocked'),
(294, 'shola123', '2348102965699', 'ogundejiholushorlar5050@gmail.com', '3a732cc2:4f8735d4bde417080a87566ef7b6a4e5', '1', 'blocked'),
(295, 'tejiwi', '2349070817854', 'aggrehoghenetejiri@gmail.com', '3a732cc2:2418e022ae89c5c6b0949e8d1ac6c5df', '1', 'active'),
(296, 'elias1', '2348133413044', 'dammyerudite@gmail.com', '3a732cc2:574dedad821bf8553fb0da7f71714bf0', '1', 'blocked'),
(297, 'kings', '2348147765083', 'certifiednawti@yahoo.com', '3a732cc2:9ea5e6f10d48803ae38499c0d5e6d93f', '1', 'active'),
(298, 'dee', '2348073910056', 'adedeji642@gmail.com', '3a732cc2:c71ad6dfcd50133b1cc67f6615a985ae', '1', 'blocked'),
(299, 'osama', '2348109438239', 'osamsbilna@gmail.com', '3a732cc2:8324d676804cf02826aaee49bc6e00f0', '1', 'active'),
(300, 'isiagu benedict uzochukwu ', '2348067656591', 'ubenedicth@gmail.com', '3a732cc2:a79965a403760a490f20d8e374c75f5e', '1', 'active'),
(301, 'joseph ambrose ', '2349036803959', 'ambrosejoseph945@gmail.com', '3a732cc2:cb07901c53218323c4ceacdea4b23c98', '1', 'blocked'),
(302, 'ufomsy', '2349077628682', 'ufuomadgreat@gmail.com', '3a732cc2:74025dc12461e440c148b516834e180b', '1', 'active'),
(303, 'tejiri', '2349030005900', 'aggrehoghenetejiri@ymail.com', '3a732cc2:ae5faf4d7237ec14c49baab745cb6c3d', '295', 'active'),
(304, 'kunny ', '2349069698514', 'kunny4me2000@gmail.com', '3a732cc2:9a4e08be41a7cf597061591379f83768', '1', 'active'),
(305, 'okpalaeke charles anayo ', '2347033357980 ', 'okpalaekecharlesanayo1@gmail.com', '3a732cc2:827ccb0eea8a706c4c34a16891f84e7b', '1', 'blocked'),
(306, 'eluebhose e', '2348034126322 ', 'evelyneluebhose@gmail.com', '3a732cc2:f1e496441daa2102936e1d2f80b040b3', '1', 'active'),
(307, 'ojekunle ', '2348050802689', 'ojekunlep123@gmail.com', '3a732cc2:0c1585aaeb53ee90169198b546ab83d7', '1', 'active'),
(308, 'bukiemie ', '2348074270113', 'oluwabukolami11@gmail.com', '3a732cc2:46ea356b2e0aef67e8e1a56f2d9ad050', '1', 'active'),
(309, 'chuba', '2348029002900', 'chuba@yahoo.com', '3a732cc2:a141c47927929bc2d1fb6d336a256df4', '1', 'blocked'),
(310, 'essien', '2349077900428', 'imeofonessien@gmail.com', '3a732cc2:1065d12d086af7fff4f68107caacfa82', '1', 'blocked'),
(311, 'giwa joseph', '2348140422462', 'giwablack@yahoo.com', '3a732cc2:dc0fa7df3d07904a09288bd2d2bb5f40', '1', 'blocked'),
(312, 'deborah', '2348136559843', 'deborahchenna@yahoo.com', '3a732cc2:186e607984950efee51b2da31a594c83', '169', 'active'),
(313, 'fikkybabe', '2348164275190', 'oyekaleb@gmail.com', '3a732cc2:abc214df04a6aa9c9a7db8d751cb3b57', '33', 'active'),
(314, '', '2347083693471', '', '3a732cc2:f8934edfcf80f336f4eaf915bfe060ab', '54', 'active'),
(315, 'akin', '+2348090205434', 'emmanuelakindele1979@yahoo.com', '3a732cc2:e8843407b1bb3bcdbb7ea1d2a0c7b272', '155', 'active'),
(316, 'ojeiwa', '', 'www', '3a732cc2:d41d8cd98f00b204e9800998ecf8427e', '1', 'active'),
(317, 'ojeiwa andrew', '2347035263231', 'www.andrew.ng.@.com', '3a732cc2:af05908de0641370ee666493a4912836', '1', 'active'),
(318, 'holuhwahtoryin', '2348119928351', 'oluwatoyinsoyewo@gmail.com', '3a732cc2:8d83d05a3eb1c2b25814781c604367e9', '4', 'active'),
(319, 'odeyemi adebowale ', '2348136663961', 'odeyemiadebowale13', '3a732cc2:0467fac3cebd3f7243abfb94d911d425', '33', 'active'),
(320, 'okay', '2349079218839', 'www.kaywise2020@gmail.com', '3a732cc2:2501e39c17485bf9dc529ef09fe06cbf', '33', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `providehelp`
--

CREATE TABLE `providehelp` (
  `ID` int(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `phID` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL DEFAULT '45% Increment',
  `amntPH` varchar(255) NOT NULL,
  `incrPH` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL DEFAULT '0',
  `amount_confirm` varchar(255) NOT NULL DEFAULT '0.00',
  `createDATE` varchar(255) NOT NULL,
  `merge_hour` varchar(255) NOT NULL,
  `releaseDATE` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL DEFAULT 'NO',
  `merge` varchar(255) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `providehelp`
--

INSERT INTO `providehelp` (`ID`, `participantID`, `phID`, `status`, `wallet`, `amntPH`, `incrPH`, `balance`, `amount_confirm`, `createDATE`, `merge_hour`, `releaseDATE`, `paid`, `merge`) VALUES
(1, '1', 'Z1163617454', 'Confirmed', '45% Increment', '14000', '4804', '0', '0.00', '04.09.2017 02:26', '', '', 'YES', 'NO'),
(2, '7', 'Z1183790520', 'Confirmed', 'Reg. Bonus', '5000', '5000', '0', '0.00', '04.09.2017 02:27', '', '', 'YES', 'NO'),
(3, '7', 'Z1183790520', 'Confirmed', '45% Increment', '20000', '24005', '0', '0.00', '04.09.2017 02:27', '', '', 'YES', 'NO'),
(4, '3', 'Z1151936938', 'Confirmed', '45% Increment', '12000', '14403', '0', '0.00', '04.09.2017 02:28', '', '', 'YES', 'NO'),
(5, '1', 'Z1193566511', 'Confirmed', '45% Increment', '4000', '1801', '0', '0.00', '04.09.2017 02:28', '', '', 'YES', 'NO'),
(6, '1', 'Z1122220945', 'Cancelled', '45% Increment', '14000', '16803.5', '0', '0.00', '04.09.2017 08:33', '', '18.09.2017 08:33', 'NO', 'Cancelled'),
(7, '1', 'Z1224825473', 'Cancelled', '45% Increment', '14000', '20163.5', '0', '0.00', '04.09.2017 08:38', '', '18.09.2017 08:38', 'NO', 'Cancelled'),
(24, '9', 'Z1221926367', 'Unconfirmed', '45% Increment', '4000', '4801', '0', '0.00', '04.09.2017 11:48', '', '18.09.2017 11:48', 'NO', 'complete'),
(25, '2', 'Z1171242230', 'Unconfirmed', '45% Increment', '4000', '4801', '0', '0.00', '04.09.2017 11:54', '', '18.09.2017 11:54', 'NO', 'complete'),
(26, '4', 'Z1112166616', 'Confirmed', '45% Increment', '10000', '12002.5', '0', '10000', '04.09.2017 11:56', '', '18.09.2017 11:56', 'YES', 'complete'),
(27, '2', 'Z1128919760', 'Unconfirmed', '45% Increment', '7000', '8401.75', '0', '0.00', '04.09.2017 11:58', '', '18.09.2017 11:58', 'NO', 'complete'),
(28, '6', 'Z1115917221', 'Unconfirmed', '45% Increment', '13000', '15603.25', '0', '0.00', '04.09.2017 11:59', '', '18.09.2017 11:59', 'NO', 'complete'),
(29, '5', 'Z1118684481', 'Unconfirmed', '45% Increment', '5000', '6001.25', '0', '0.00', '04.09.2017 12:01', '', '18.09.2017 12:01', 'NO', 'complete'),
(30, '8', 'Z1201578008', 'Unconfirmed', '45% Increment', '7000', '8401.75', '0', '0.00', '04.09.2017 12:02', '', '18.09.2017 12:02', 'NO', 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `RID` int(255) NOT NULL,
  `phID` varchar(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `referralID` varchar(255) NOT NULL,
  `referralBonus` varchar(255) NOT NULL,
  `incrbonus` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createDATE` varchar(255) NOT NULL,
  `releaseDATE` varchar(255) NOT NULL,
  `user_status` varchar(255) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `referral`
--

INSERT INTO `referral` (`RID`, `phID`, `participantID`, `referralID`, `referralBonus`, `incrbonus`, `wallet`, `status`, `createDATE`, `releaseDATE`, `user_status`) VALUES
(1, 'Z1183790520', '7', '1', '2000', '401', 'Referral Bonus', 'Confirmed', '04.09.2017 02:27', '', 'active'),
(2, 'Z1151936938', '3', '1', '1200', '440', 'Referral Bonus', 'Confirmed', '04.09.2017 02:28', '', 'active'),
(3, 'Z1221926367', '9', '1', '400', '480.1', 'Referral Bonus', 'Unconfirmed', '04.09.2017 11:48', '', 'active'),
(4, 'Z1171242230', '2', '1', '400', '480.1', 'Referral Bonus', 'Unconfirmed', '04.09.2017 11:54', '', 'active'),
(5, 'Z1112166616', '4', '1', '1000', '1200.25', 'Referral Bonus', 'Confirmed', '04.09.2017 11:56', '', 'active'),
(6, 'Z1128919760', '2', '1', '700', '840.175', 'Referral Bonus', 'Unconfirmed', '04.09.2017 11:58', '', 'active'),
(7, 'Z1115917221', '6', '1', '1300', '1560.325', 'Referral Bonus', 'Unconfirmed', '04.09.2017 11:59', '', 'active'),
(8, 'Z1118684481', '5', '1', '500', '600.125', 'Referral Bonus', 'Unconfirmed', '04.09.2017 12:01', '', 'active'),
(9, 'Z1201578008', '8', '1', '700', '840.175', 'Referral Bonus', 'Unconfirmed', '04.09.2017 12:02', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `relatedissue`
--

CREATE TABLE `relatedissue` (
  `issueid` int(255) NOT NULL,
  `option_issue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relatedissue`
--

INSERT INTO `relatedissue` (`issueid`, `option_issue`) VALUES
(1, 'OTHER QUESTIONS'),
(2, 'PARTICIPANT IS BLOCKED'),
(3, 'RECEIVER FAILS TO CONFIRM PAYMENT'),
(4, 'SENDER UPLOAD FAKE PROOF OF PAYMENT'),
(5, 'BANKING DETAIL IS INCORRECT');

-- --------------------------------------------------------

--
-- Table structure for table `reply_admin`
--

CREATE TABLE `reply_admin` (
  `replyadmin_id` int(255) NOT NULL,
  `reply_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply_admin`
--

INSERT INTO `reply_admin` (`replyadmin_id`, `reply_name`) VALUES
(1, 'JAMES PATTERSON'),
(2, 'LUKE HOWARD'),
(3, 'MICHEAL SMITH'),
(4, 'TERRA COLE '),
(5, 'Caroline Helvey'),
(6, 'Paul Johnson '),
(7, 'Eric Geranen'),
(8, 'Kelvin Woods'),
(9, 'Elias Mkalech'),
(10, 'Michael Armstrong');

-- --------------------------------------------------------

--
-- Table structure for table `reset_verify`
--

CREATE TABLE `reset_verify` (
  `resetid` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reset_verify`
--

INSERT INTO `reset_verify` (`resetid`, `email`, `code`, `status`) VALUES
(1, 'kidafaze@gmail.com', 'AT9-WLF-EF9', 'used'),
(2, 'kidafaze@gmail.com', 'VRG-2U5-K1D', 'used'),
(3, 'kidafaze@gmail.com', '0VS-ZUL-ZP2', 'used'),
(4, 'chrisbede37@gmail.com', 'NZQ-QZW-KI1', 'used'),
(5, 'chrisbede37@gmail.com', 'J2O-PPE-ROU', 'pending'),
(6, 'kidafaze@gmail.com', '62W-WO2-SPP', 'pending'),
(7, 'fathookay.ode1@hotmail.com', 'R9G-7NQ-KTN', 'pending'),
(8, 'FabulousRichy@gmail.com', '9DN-TKQ-A6G', 'used'),
(9, 'otunbaoluseun62@gmail.com', 'QJK-MZR-RCW', 'pending'),
(10, 'holorunzei@gmail.com', 'JDX-A50-UXP', 'pending'),
(11, 'FabulousRichy@gmail.com', '8LX-XBR-5HZ', 'pending'),
(12, 'omotayoomotosho97 @gmail.com', 'SOH-2ZR-PZU', 'pending'),
(13, 'toppsson55@gmail.com', 'XEO-X9M-ZDG', 'pending'),
(14, 'soyewoo2@gmail.com', 'DWR-APB-9K1', 'pending'),
(15, 'chideraabalu@yahoo.com', '05N-8KL-RRV', 'pending'),
(16, 'chideraclive@gmail.com', 'CUN-FXZ-K48', 'pending'),
(17, 'Gozkidprince@yahoo.com', 'VS1-TTA-7OY', 'pending'),
(18, 'chideraclive@gmail.com', 'VUM-KLQ-EFN', 'pending'),
(19, 'highzic320@gmail.com', 'Y9R-OFY-I8U', 'pending'),
(20, 'Tunskash@gmail.com', 'JXX-CL4-AE4', 'pending'),
(21, 'azeezclinton2000@gmail.com', 'G9M-AD3-E3J', 'pending'),
(22, 'azeezclinton2000@gmail.com', 'G4Y-6NI-Z6B', 'pending'),
(23, 'emmatosh1994@yahoo.com', 'LJK-IKC-A9Q', 'pending'),
(24, 'emmatosh1994@yahoo.com', 'ZDG-GAD-LH6', 'pending'),
(25, 'emmatosh1994@gmail.com', 'TS8-F50-4DJ', 'pending'),
(26, 'emmatosh1994@gmail.com', 'AZI-X3Y-YSL', 'pending'),
(27, 'emmatosh1994@yahoo.com', 'EH8-JR3-JI1', 'pending'),
(28, 'emmatosh1994@yahoo.com', 'QPS-CRX-VAY', 'pending'),
(29, 'emmatosh1994@yahoo.com', 'VVN-P2O-UXY', 'used'),
(30, 'okpalaekecharlesanayo1@gmail.com', 'PJD-ZFD-NZJ', 'pending'),
(31, 'ojekunlep123@gmail.com', 'J3B-5XS-WQG', 'pending'),
(32, 'kennyrite@yahoo.com', 'JFX-GRK-X8B', 'used'),
(33, 'kennyrite@yahoo.com', 'KAX-ZJP-LLR', 'used'),
(34, 'emmanuelakindele1979@yahoo.com', 'GKO-3FB-Y7H', 'used'),
(35, 'emmanuelakindele1979@yahoo.com', 'FIC-FGR-ZLU', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `testimonies`
--

CREATE TABLE `testimonies` (
  `testimonial_id` int(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `gh_letter` longtext NOT NULL,
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimonies`
--

INSERT INTO `testimonies` (`testimonial_id`, `participantID`, `gh_letter`, `date_written`) VALUES
(1, '9', 'Waooh this site is real. Just got paid today mehn', 'Mar 27, 2017 05:29:27 PM'),
(2, '1', 'I, Oluwatayo get help of N50,000 within 24hours. Giverscycler remains the best platform ever. \n\nGivers are Receiver', 'Mar 27, 2017 05:36:23 PM'),
(3, '1', 'thanks giverscycler i provided help of 1000 and i was paid back within 44hours of payment confirmation', 'Mar 27, 2017 05:53:51 PM'),
(4, '9', 'this is real, God bless the brains behind it', 'Mar 27, 2017 06:05:20 PM'),
(6, '5', 'I Azeezat from Kogi State provided  help of N1,000 and get N2,000 in return within 72hours.\r\n\r\nThanks to Giverscycler for making my day.\r\n\r\n\r\nLong live Giverscycler.\r\nGivers are Receivers', 'Mar 27, 2017 06:25:25 PM'),
(7, '3', 'thanks to giverscycler ..this platform is so real .got paid within 48hours', 'Mar 27, 2017 07:23:46 PM'),
(8, '8', 'I received 200% of my investment within 24 hours \nGC tumbs up', 'Mar 27, 2017 07:26:03 PM'),
(9, '4', 'I can\'t just believe ! Giverscycler made it when other can\'t....\r\n\r\nI provide help of N1,000 on  26-03-2017 and get help of N2,000 within 48hours on 27-03-2017\r\n\r\nGiverscycler remains the best.\r\n\r\n\r\nGivers are Receiver', 'Mar 27, 207 10:03:05 PM'),
(10, '7', 'giverscycler is the best', 'Mar 27, 2017 09:02:38 PM'),
(11, '7', 'giverscycler is the best', 'Mar 27, 2017 09:04:28 PM'),
(12, '8', 'Got 10k interest in 1Â½ days', 'Mar 27, 2017 09:22:34 PM'),
(13, '7', 'giverscycler is indeed for real.\r\n', 'Mar 27, 2017 10:09:49 PM'),
(14, '9', 'this is really working and it is real', 'Mar 28, 2017 12:20:44 AM'),
(15, '3', 'wowww am loving this pltform.. if you aint on this plantform you are missing ', 'Mar 28, 2017 12:22:24 AM'),
(16, '1', 'Giverscycler remains the best.\r\n\r\nI got paid within 48hours...... Happy mood', 'Mar 28, 2017 06:18:15 AM'),
(17, '1', 'I Oluwatayo got paid of N10,000 within 72hours. Thanks to GiversCycler.\r\n\r\nHappy Mood', 'Mar 28, 2017 06:20:41 AM'),
(18, '4', 'I  received the payment ', 'Mar 28, 2017 10:05:21 AM'),
(19, '4', 'I received payment', 'Mar 28, 2017 11:15:14 AM'),
(20, '3', 'thanks to giverscyler .i feel on top of the world ', 'Mar 28, 2017 02:18:48 PM'),
(22, '30', 'I hv seen it thanks alot', 'Mar 28, 2017 04:15:26 PM'),
(23, '30', 'i hv seen it thanks alot', 'Mar 28, 2017 04:17:33 PM'),
(24, '9', 'This system is live saving and real. Never knew I will get my money fast', 'Mar 28, 2017 05:39:40 PM'),
(25, '8', 'Daily interest........ thumbs up', 'Mar 28, 2017 06:21:37 PM'),
(26, '6', 'It was good', 'Mar 28, 2017 06:24:07 PM'),
(27, '6', 'Thanks to giverscycler', 'Mar 28, 2017 06:26:19 PM'),
(28, '5', 'You made my day worthy.... Smiling to the bank', 'Mar 28, 2017 07:32:32 PM'),
(29, '9', 'this is real working reliable \r\n', 'Mar 28, 2017 11:08:51 PM'),
(30, '3', 'Got paid within 48hours of payment this site is for real ', 'Mar 29, 2017 04:00:45 AM'),
(31, '5', 'Early morning alert, Giverscycler rock.\r\n\r\nExpecting more.\r\n\r\n\r\nThumbs UP GC\r\n\r\nGivers are Receiver', 'Mar 29, 2017 07:57:30 AM'),
(32, '30', 'yes', 'Mar 29, 2017 09:55:16 AM'),
(33, '29', 'Good', 'Mar 29, 2017 11:10:57 AM'),
(34, '2', 'i got paid, thanks to gives cycler for helping get my money back', 'Mar 29, 2017 11:27:44 AM'),
(35, '65', 'I just give a tryer i dont know is real', 'Mar 29, 2017 12:24:16 PM'),
(36, '30', 'yes am so happy', 'Mar 29, 2017 12:50:17 PM'),
(37, '30', 'yes am happy', 'Mar 29, 2017 12:50:42 PM'),
(38, '71', 'I received payment, long live  giverscycler.', 'Mar 29, 2017 04:17:37 PM'),
(39, '22', 'yessss, its works, givers are receiver', 'Mar 29, 2017 04:44:52 PM'),
(40, '31', 'so glad and happy', 'Mar 29, 2017 04:47:49 PM'),
(41, '17', 'Thank you giverscycler', 'Mar 29, 2017 05:06:31 PM'),
(42, '69', 'thanks.....i received from one person you merged with me and remain other person thanks i really appreciate ..it real', 'Mar 29, 2017 05:15:38 PM'),
(43, '34', 'Giverscycler is the best ', 'Mar 29, 2017 05:18:13 PM'),
(44, '55', 'Long live GiversCycler, It Pays.\r\nWoo.', 'Mar 29, 2017 05:20:22 PM'),
(45, '10', 'I guess  and it works', 'Mar 29, 2017 05:28:39 PM'),
(46, '30', 'yessss, its works', 'Mar 29, 2017 05:58:25 PM'),
(47, '30', 'yessss, its works', 'Mar 29, 2017 05:59:19 PM'),
(48, '30', 'yessss, its works', 'Mar 29, 2017 05:59:27 PM'),
(49, '64', 'Giverscycler is real', 'Mar 29, 2017 06:37:21 PM'),
(50, '7', 'givers cycler is unique', 'Mar 29, 2017 07:10:00 PM'),
(51, '66', 'Good', 'Mar 29, 2017 07:14:54 PM'),
(52, '54', 'Woo it great, let make d world a better place GCycler', 'Mar 29, 2017 08:32:21 PM'),
(53, '7', 'givers cycler us awesome', 'Mar 29, 2017 09:15:35 PM'),
(54, '30', 'yeah', 'Mar 29, 2017 09:40:27 PM'),
(55, '82', 'good', 'Mar 30, 2017 07:30:45 AM'),
(56, '85', 'good', 'Mar 30, 2017 07:32:18 AM'),
(57, '47', 'I believe  this  is  a very  strong   and  the  most  fastest  confirmed  ponzi  platform, if  we  the  members   can  continue  to  remain  loyal and  faithful, the  system  will  be  great.\r\n    \"I don  get  alert \"', 'Mar 30, 2017 07:46:18 AM'),
(58, '2', 'Thanks to giverscycler, I just got paid ', 'Mar 30, 2017 07:58:03 AM'),
(59, '19', '', 'Mar 30, 2017 08:35:19 AM'),
(60, '60', 'Good', 'Mar 30, 2017 10:38:21 AM'),
(61, '87', 'Love givers cycler ', 'Mar 30, 2017 11:23:11 AM'),
(62, '54', 'Long live Gcycler', 'Mar 30, 2017 11:33:24 AM'),
(63, '40', 'yeah....now I realize d platform is for real', 'Mar 30, 2017 12:02:34 PM'),
(64, '1', 'I never knew these website is real, am getting it big.\r\n\r\n\r\nThanks to Giverscycler\r\n\r\n\r\n', 'Mar 30, 2017 02:12:26 PM'),
(65, '33', 'this giverscycler is real wahooooo', 'Mar 30, 2017 03:34:04 PM'),
(66, '2', 'Thanks giverscycler.God bless all the brains behind giverscycler.Long live giverscycler', 'Mar 30, 2017 03:43:03 PM'),
(67, '67', 'I testify that Nikegreat has paid #2000 into my account ', 'Mar 30, 2017 05:24:45 PM'),
(68, '2', 'I just love this platform, they are paying', 'Mar 30, 2017 07:00:34 PM'),
(69, '9', 'This is real it works cool cash', 'Mar 31, 2017 04:42:06 AM'),
(70, '96', 'I never believed it until now, thanks to GC ', 'Mar 31, 2017 05:25:17 AM'),
(71, '2', 'Thanks to giverscycler for keeping it real ', 'Mar 31, 2017 05:30:49 AM'),
(72, '31', 'Thanks to giverscycler ', 'Mar 31, 2017 05:52:11 AM'),
(73, '8', 'Thumbs up', 'Mar 31, 2017 06:20:52 AM'),
(74, '9', 'God bless GC', 'Mar 31, 2017 08:55:01 AM'),
(75, '89', 'Givers cycler is the best place to be', 'Mar 31, 2017 01:11:18 PM'),
(76, '22', 'it real ', 'Mar 31, 2017 05:36:03 PM'),
(77, '7', 'just the best', 'Mar 31, 2017 06:09:30 PM'),
(78, '65', 'I am alonge Toyin from Ibadan I got help of 5000\n\nGivers cycler rocks......\nLong live givers cycler', 'Mar 31, 2017 06:13:06 PM'),
(79, '64', 'My name is iya super I got help of 5000\nESE eku inawo oju oni Tiyin ooo\nGivers cycler rocks', 'Mar 31, 2017 06:20:41 PM'),
(80, '66', 'It make sense alot', 'Mar 31, 2017 06:58:23 PM'),
(81, '102', 'Thank you giverscycler givers are receivers thanks', 'Mar 31, 2017 07:49:25 PM'),
(82, '87', 'Yes', 'Mar 31, 2017 08:25:10 PM'),
(83, '9', 'Good is working right', 'Mar 31, 2017 08:39:16 PM'),
(84, '106', 'Good', 'Mar 31, 2017 08:57:36 PM'),
(85, '17', 'Thanks to giverscycler', 'Apr 01, 2017 11:35:48 AM'),
(86, '7', 'Good', 'Apr 01, 2017 05:45:15 PM'),
(87, '1', 'Giverscycler is just the best\r\n\r\n\r\nMaking it real, thanks for making my day..\r\n\r\n\r\n\r\nGIVERS are RECEIVER', 'Apr 02, 2017 07:16:37 AM'),
(88, '19', 'tanks to giverscycler', 'Apr 02, 2017 02:05:09 PM'),
(89, '19', '', 'Apr 02, 2017 02:05:20 PM'),
(90, '99', 'It works and it is real', 'Apr 02, 2017 06:04:23 PM'),
(91, '130', 'it is real......tanks to giverscycler....Givers are receivers', 'Apr 02, 2017 06:49:53 PM'),
(92, '69', 'thanks ................it real..and i thank Almighty God.', 'Apr 02, 2017 07:34:39 PM'),
(93, '8', 'giverscycler is the best, am really happy ', 'Apr 03, 2017 04:20:58 AM'),
(94, '40', 'This network is very nice', 'Apr 03, 2017 06:15:52 AM'),
(95, '116', 'Giverscycler platform is real', 'Apr 03, 2017 08:08:58 AM'),
(96, '137', 'this site is okay people are paying', 'Apr 03, 2017 08:40:52 AM'),
(97, '137', '', 'Apr 03, 2017 08:41:03 AM'),
(98, '37', 'Early morning I received a payment..... So glad', 'Apr 03, 2017 09:08:27 AM'),
(99, '30', 'yes', 'Apr 03, 2017 09:45:10 AM'),
(100, '90', 'what a miraculous site .......thanks to givers cycler\r\ngivers are recievers\r\n', 'Apr 03, 2017 09:54:23 AM'),
(101, '80', 'thank you giverscycler', 'Apr 03, 2017 10:19:17 AM'),
(102, '133', 'I have seen the alert of #2000', 'Apr 03, 2017 10:44:51 AM'),
(103, '4', 'I received the payment of 2000 after a day of ph. long live giverscycler.', 'Apr 03, 2017 10:53:12 AM'),
(104, '107', 'Thanks to u guys I just receive 5000 out of my money', 'Apr 03, 2017 11:01:25 AM'),
(105, '2', 'giverscycler all the way\r\n', 'Apr 03, 2017 11:31:02 AM'),
(106, '14', 'The system works perfectly', 'Apr 03, 2017 11:44:44 AM'),
(107, '122', 'Long live giverscycler', 'Apr 03, 2017 12:34:24 PM'),
(108, '102', 'I just receive my payment thank you', 'Apr 03, 2017 12:51:45 PM'),
(109, '97', 'thanks\r\n\r\nu\r\n\r\n\r\nvery\r\n\r\nmuch', 'Apr 03, 2017 01:30:34 PM'),
(110, '126', 'thank you giverscycler ', 'Apr 03, 2017 01:36:35 PM'),
(111, '126', 'thank you giverscycler', 'Apr 03, 2017 01:44:50 PM'),
(112, '109', 'Giverscycler ride on', 'Apr 03, 2017 01:57:54 PM'),
(113, '105', 'Giverscycler best of best platform', 'Apr 03, 2017 02:00:22 PM'),
(114, '45', 'thank you giverscycler\r\n', 'Apr 03, 2017 02:13:53 PM'),
(115, '17', 'Thanks GC', 'Apr 03, 2017 02:29:03 PM'),
(116, '33', 'giverscycler is real\r\n', 'Apr 03, 2017 02:31:12 PM'),
(117, '123', 'I can now believe that giverscycler is real', 'Apr 03, 2017 02:31:42 PM'),
(118, '54', 'Woo', 'Apr 03, 2017 02:36:42 PM'),
(119, '117', 'Longlive giverscycler', 'Apr 03, 2017 02:59:45 PM'),
(120, '64', 'Long live giverscycler ,together we eradicate poverty', 'Apr 03, 2017 03:13:51 PM'),
(121, '6', 'The best ', 'Apr 03, 2017 03:39:43 PM'),
(122, '1', 'Thanks to Givers cycler for making it real...... it works like magic!', 'Apr 03, 2017 03:46:44 PM'),
(123, '119', 'Giverscycler is the best', 'Apr 03, 2017 03:47:19 PM'),
(124, '11', 'Perfect. ', 'Apr 03, 2017 03:50:20 PM'),
(125, '55', 'W', 'Apr 03, 2017 04:45:44 PM'),
(126, '33', 'giverscycler as really change my life 4rm nothing to something.', 'Apr 03, 2017 05:07:35 PM'),
(127, '54', 'Thanks Gc', 'Apr 03, 2017 05:12:40 PM'),
(128, '34', 'Kudos to the organiser of Giverscycler ', 'Apr 03, 2017 05:24:48 PM'),
(129, '30', 'yes', 'Apr 03, 2017 06:22:57 PM'),
(130, '30', 'yes', 'Apr 03, 2017 06:23:56 PM'),
(131, '127', 'giverscycler is the best', 'Apr 03, 2017 06:35:09 PM'),
(132, '100', 'giverscycler thank sir ', 'Apr 03, 2017 07:19:52 PM'),
(133, '59', 'Thank \r\n\r\nU \r\n\r\nGivers\r\n\r\nAre\r\n\r\nReceivers', 'Apr 04, 2017 05:41:24 AM'),
(134, '82', 'wonderful deal tanks', 'Apr 04, 2017 06:21:45 AM'),
(135, '101', 'Thank you gc', 'Apr 04, 2017 06:43:32 AM'),
(136, '95', 'I received payment ', 'Apr 04, 2017 06:50:10 AM'),
(137, '146', 'Happy about this...Thanks', 'Apr 04, 2017 07:19:39 AM'),
(138, '2', '         ', 'Apr 04, 2017 07:20:46 AM'),
(139, '126', 'Feeling on top of the world.. This shot is real ', 'Apr 04, 2017 07:59:09 AM'),
(140, '55', 'Thanks Gc', 'Apr 04, 2017 08:19:55 AM'),
(141, '30', 'god bless u all', 'Apr 04, 2017 08:43:17 AM'),
(142, '3', 'thank you giverscycler', 'Apr 04, 2017 08:58:08 AM'),
(143, '10', 'It might take a while but it works', 'Apr 04, 2017 10:18:52 AM'),
(144, '33', 'thanks to giverscycler', 'Apr 04, 2017 10:21:35 AM'),
(145, '54', 'Woo', 'Apr 04, 2017 10:31:02 AM'),
(146, '17', 'Thanks GC', 'Apr 04, 2017 01:11:34 PM'),
(147, '96', '       ', 'Apr 04, 2017 01:55:53 PM'),
(148, '6', 'Good ', 'Apr 04, 2017 02:00:41 PM'),
(149, '107', 'Long live giverscycler', 'Apr 04, 2017 02:03:46 PM'),
(150, '138', 'I have been paid', 'Apr 05, 2017 06:25:51 AM'),
(151, '87', 'With giverscycler we will live long..... Long live Giverscycler', 'Apr 05, 2017 07:48:51 AM'),
(152, '76', 'This is harbaryorme,\r\nThanks to giverscycler', 'Apr 05, 2017 07:49:25 AM'),
(153, '142', 'Giverscycler is for real...I just received my money now....tanks to giverscycler', 'Apr 05, 2017 08:02:11 AM'),
(154, '149', 'Am always glad to giverscycler....\r\nThanks', 'Apr 05, 2017 08:21:00 AM'),
(155, '89', 'Is good to be in giverscycler', 'Apr 05, 2017 08:30:18 AM'),
(156, '86', 'Great peer to peer', 'Apr 05, 2017 10:29:55 AM'),
(157, '80', 'thank you giverscycler\r\n', 'Apr 05, 2017 10:47:38 AM'),
(158, '148', 'I phed 20000 naira last week and I have gotten 20 000 naira back. I am still expecting the balance soon. Thank you giverscycler, I am grateful.', 'Apr 05, 2017 11:16:47 AM'),
(159, '127', '                   ', 'Apr 05, 2017 11:27:10 AM'),
(160, '9', 'It is goo d and working', 'Apr 05, 2017 11:47:21 AM'),
(161, '2', '          ', 'Apr 05, 2017 01:51:21 PM'),
(162, '3', 'thank you  giverscycler', 'Apr 05, 2017 02:00:51 PM'),
(163, '8', 'Givers are receivers', 'Apr 05, 2017 03:22:21 PM'),
(164, '76', 'A lot of thanks to d founder of this site \r\nMultiplication of money without stress is sweet alot', 'Apr 05, 2017 07:13:02 PM'),
(165, '106', 'god is great thanks\r\n', 'Apr 06, 2017 06:49:11 AM'),
(166, '163', 'Got it in one piece ', 'Apr 07, 2017 06:49:31 AM'),
(167, '1', 'Giverscycler pays, others follow....\r\n\r\nHappy to be here!', 'Apr 07, 2017 06:59:25 AM'),
(168, '10', 'It works well', 'Apr 07, 2017 09:54:12 AM'),
(169, '147', 'Best', 'Apr 07, 2017 01:34:23 PM'),
(170, '114', 'Best', 'Apr 07, 2017 01:34:51 PM'),
(171, '1', 'Mehn! Am making it big time.....\r\n\r\nGivers are Receivers', 'Apr 07, 2017 01:41:13 PM'),
(172, '55', 'Long live GC & Let make d world a better place.\nGivers are receiver.', 'Apr 07, 2017 05:34:10 PM'),
(173, '69', 'thanks.....it real', 'Apr 07, 2017 05:58:23 PM'),
(174, '4', 'I received payment..... long live giverscycler', 'Apr 07, 2017 06:02:27 PM'),
(175, '168', 'Best', 'Apr 07, 2017 06:33:06 PM'),
(176, '171', 'tanks \r\nto giverscycler........givers are receivers', 'Apr 07, 2017 06:57:19 PM'),
(177, '154', 'Am Topsson from lagos, I provided a help of 2000naira on 31th March and received a sum of 4000naira on 7th April which was paid to my bank Acct within 24hrs. \nGiverscycler pays', 'Apr 07, 2017 08:38:06 PM'),
(178, '30', 'yes dear', 'Apr 07, 2017 08:48:09 PM'),
(179, '175', 'I have been paid #2000 by Olowe Olufemi Israel ', 'Apr 07, 2017 11:01:10 PM'),
(180, '126', 'this site is so real ', 'Apr 07, 2017 11:26:44 PM'),
(181, '64', 'giverscycler is real ', 'Apr 08, 2017 07:14:55 AM'),
(182, '41', 'Incredible, they really surpise me??? Am so happy to be a partekar cos they put a smile on my face..... God bless givercycler you are indeed a Daddy yo', 'Apr 08, 2017 07:27:26 AM'),
(183, '1', 'Giverscycler pays......\r\n\r\nThanks to all participants for making it real', 'Apr 08, 2017 10:39:13 AM'),
(184, '1', ' ', 'Apr 08, 2017 10:40:12 AM'),
(185, '130', 'tanks to giverscycler......\r\ngivers are receivers', 'Apr 08, 2017 11:02:57 AM'),
(186, '130', '', 'Apr 08, 2017 11:03:08 AM'),
(187, '65', 'Long live giverscycler  together we eradicate poverty', 'Apr 08, 2017 01:34:37 PM'),
(188, '157', 'Thanks GC', 'Apr 08, 2017 01:49:29 PM'),
(189, '165', 'thank you giverscycler\r\n', 'Apr 08, 2017 02:26:36 PM'),
(190, '158', 'Good', 'Apr 08, 2017 04:46:20 PM'),
(191, '60', 'Good', 'Apr 08, 2017 05:58:57 PM'),
(192, '153', 'Thank you GC', 'Apr 10, 2017 07:21:00 AM'),
(193, '22', 'Givers cycle as been so faithful, thanks to giverscycler\r\nreally appreciate \r\n', 'Apr 10, 2017 08:30:35 AM'),
(194, '22', '', 'Apr 10, 2017 08:30:49 AM'),
(195, '3', 'Thanks to Giverscycler, its a new week with new alert balling in', 'Apr 10, 2017 09:46:27 AM'),
(196, '3', 'Payment received, early morning tinz', 'Apr 10, 2017 09:46:56 AM'),
(197, '7', 'fast pay', 'Apr 10, 2017 11:06:08 AM'),
(198, '33', 'givers are the receivers', 'Apr 10, 2017 01:10:38 PM'),
(199, '17', 'Thanks gc', 'Apr 10, 2017 04:04:34 PM'),
(200, '2', 'Giverscycler pays, keep it up dude', 'Apr 11, 2017 07:42:32 AM'),
(201, '2', '     ', 'Apr 11, 2017 04:08:15 PM'),
(202, '33', 'Despite what the system is currently facing, I still got paid.\r\n\r\nThanks', 'Apr 13, 2017 07:08:14 AM'),
(203, '33', 'givers shall never lack', 'Apr 13, 2017 08:57:23 AM'),
(204, '5', 'Giverscycler pays expecting my remaining GH', 'Apr 13, 2017 10:20:32 AM'),
(205, '33', 'givers are the receivers', 'Apr 13, 2017 11:54:47 AM'),
(206, '121', 'Yes dey are still paying.... Ooo ', 'Apr 13, 2017 01:23:42 PM'),
(207, '220', 'longlive giverscycler ', 'Apr 13, 2017 02:15:32 PM'),
(208, '241', 'Long live Giverscycler', 'Apr 13, 2017 02:46:26 PM'),
(209, '204', 'Good ', 'Apr 13, 2017 03:00:26 PM'),
(210, '218', 'Disappointed ', 'Apr 13, 2017 03:12:16 PM'),
(211, '194', 'Long live giverscycler', 'Apr 13, 2017 03:25:26 PM'),
(212, '243', 'Thanks for paying me. God bless', 'Apr 13, 2017 03:30:39 PM'),
(213, '159', '     ', 'Apr 13, 2017 03:46:42 PM'),
(214, '159', '     ', 'Apr 13, 2017 04:38:07 PM'),
(215, '234', 'Thanks\r\nGiverscycler\r\nGivers are receiver\r\n', 'Apr 13, 2017 06:52:47 PM'),
(216, '164', 'It rocks', 'Apr 13, 2017 07:35:46 PM'),
(217, '197', 'nice one', 'Apr 13, 2017 07:43:58 PM'),
(218, '22', 'tankz to giverscycler', 'Apr 14, 2017 08:33:09 AM'),
(219, '22', '', 'Apr 14, 2017 08:33:15 AM'),
(220, '213', 'long live GC', 'Apr 14, 2017 11:41:53 AM'),
(221, '208', 'ok', 'Apr 14, 2017 06:59:57 PM'),
(222, '242', 'Happy with the site', 'Apr 15, 2017 11:01:27 AM'),
(223, '231', 'thanks to giverscycler', 'Apr 15, 2017 01:38:08 PM'),
(224, '225', 'thanks to giverscycler', 'Apr 15, 2017 02:04:07 PM'),
(225, '185', 'thanks tu giverscycler....\r\n', 'Apr 15, 2017 03:40:36 PM'),
(226, '201', 'i never beleived it not until I got paid part of my outstanding GH . Keep it up GC. Thanks', 'Apr 15, 2017 04:32:06 PM'),
(227, '223', 'Grateful I received a donation of N1,000 from my outstanding N4,000.Giverscycler,u rock.You are real and reliable ', 'Apr 15, 2017 09:57:44 PM'),
(228, '43', 'tanks one love', 'Apr 16, 2017 11:54:52 AM'),
(229, '213', 'good', 'Apr 16, 2017 08:53:32 PM'),
(230, '274', 'Thank you. GC', 'Apr 17, 2017 08:25:02 AM'),
(231, '202', 'I got alart oo - giver r receivers part payment!', 'Apr 17, 2017 11:07:15 AM'),
(232, '268', 'I testify that he paid 1000naira to my account ', 'Apr 17, 2017 05:14:15 PM'),
(233, '268', '', 'Apr 17, 2017 05:14:29 PM'),
(234, '40', 'Nice platform \r\n', 'Apr 17, 2017 05:33:19 PM'),
(235, '145', 'Thanks', 'Apr 17, 2017 06:01:29 PM'),
(236, '225', 'Tenkx  alot Esther.. God bless u', 'Apr 17, 2017 07:10:49 PM'),
(237, '206', 'thanks to gc', 'Apr 17, 2017 08:36:35 PM'),
(238, '121', 'Its was good...... Hope it will be batter.... ', 'Apr 18, 2017 09:22:55 AM'),
(239, '1', 'Thanks to GC for making it real, one love', 'Apr 18, 2017 10:28:22 AM'),
(240, '130', 'indeed, gc is the best ', 'Apr 18, 2017 02:19:03 PM'),
(241, '34', 'I have received my payment few minutes ago. Long life  Giverscycler ', 'Apr 18, 2017 03:20:40 PM'),
(242, '41', 'I love giver cycler cos they really rule my world... You are the best ponzi have ever meet..... Keep it up guyz', 'Apr 18, 2017 05:23:43 PM'),
(243, '96', '    ', 'Apr 18, 2017 07:31:24 PM'),
(244, '8', 'Thanks to GC,\r\n\r\nThou it taking a longer time sha', 'Apr 19, 2017 06:55:21 AM'),
(245, '256', 'thnks 4 d payment', 'Apr 19, 2017 12:44:01 PM'),
(246, '33', 'giverscycler is real', 'Apr 19, 2017 01:36:53 PM'),
(247, '128', 'Good', 'Apr 19, 2017 02:19:29 PM'),
(248, '22', 'Gc is the best!!!!!!!!!', 'Apr 19, 2017 03:28:58 PM'),
(249, '273', 'Just received 1k out of my whole money', 'Apr 19, 2017 03:59:08 PM'),
(250, '273', '', 'Apr 19, 2017 03:59:27 PM'),
(251, '196', 'Confirmed', 'Apr 19, 2017 05:50:51 PM'),
(252, '126', 'thank you giverscycler ', 'Apr 19, 2017 09:15:26 PM'),
(253, '92', 'I collect my money... Its really working ooo ! ', 'Apr 19, 2017 09:55:46 PM'),
(254, '205', 'i got 1,000naira on 19th April, 2017', 'Apr 19, 2017 10:31:04 PM'),
(255, '247', 'You guys are owing me some money', 'Apr 19, 2017 10:41:56 PM'),
(256, '272', 'It makes sense', 'Apr 19, 2017 11:31:02 PM'),
(257, '182', 'thank\r\nyou givers\r\nare recievers\r\n', 'Apr 20, 2017 09:49:08 AM'),
(258, '181', 'Disappointed ', 'Apr 20, 2017 03:18:55 PM'),
(259, '5', 'Long live GC', 'Apr 20, 2017 06:42:09 PM'),
(260, '180', 'Always with giverscycler', 'Apr 21, 2017 06:54:38 AM'),
(261, '177', 'Thank you I have received  half of my money. Long life givescycler.', 'Apr 21, 2017 07:33:55 AM'),
(262, '67', 'confirmed', 'Apr 22, 2017 08:01:50 PM');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `tid` int(255) NOT NULL,
  `participant` varchar(255) NOT NULL,
  `report_participant` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `relatedIssue` varchar(255) NOT NULL,
  `ticketmsg` longtext NOT NULL,
  `replied` varchar(255) NOT NULL DEFAULT '0',
  `locked` varchar(255) NOT NULL DEFAULT 'NO',
  `attachment` varchar(255) NOT NULL,
  `ghID` varchar(255) NOT NULL,
  `phID` varchar(255) NOT NULL,
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`tid`, `participant`, `report_participant`, `subject`, `relatedIssue`, `ticketmsg`, `replied`, `locked`, `attachment`, `ghID`, `phID`, `date_written`) VALUES
(1, '30', '', 'please i dont know how too transfer too someone i fail too see the person account details', 'OTHER QUESTIONS', '', '1', 'YES', '', '', '', 'Mar 27, 2017 16:51:06'),
(2, '8', '', 'banking details', 'BANKING DETAIL IS INCORRECT', 'My account name is Muniru Ahmed sunkanmi not Muniru hammed Olasunkanmi', '3', 'YES', '', '', '', 'Mar 27, 2017 17:07:20'),
(3, '1', '25', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1199624947\n					\n					Provide Help ID: Z1140337702\n					\n					Amount: 10000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1199624947', 'Z1140337702', 'Mar 27, 2017 17:36:55'),
(4, '3', '25', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1217061888\n					\n					Provide Help ID: Z1160564981\n					\n					Amount: 20000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '3', 'YES', '', 'M1217061888', 'Z1160564981', 'Mar 28, 2017 00:39:49'),
(5, '3', '25', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1217061888\n					\n					Provide Help ID: Z1160564981\n					\n					Amount: 20000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '3', 'YES', '', 'M1217061888', 'Z1160564981', 'Mar 28, 2017 00:41:17'),
(6, '6', '28', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1218878059\n					\n					Provide Help ID: Z1154193430\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'YES', '', 'M1218878059', 'Z1154193430', 'Mar 28, 2017 14:00:51'),
(7, '67', '', 'Givers Cycler', 'OTHER QUESTIONS', 'I am being merged with two people at the same time?  what should I do to resolve the issue \r\n', '2', 'YES', '', '', '', 'Mar 28, 2017 15:18:13'),
(8, '6', '2', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1221843415\n					\n					Provide Help ID: Z1187575017\n					\n					Amount: 1000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'YES', '', 'M1221843415', 'Z1187575017', 'Mar 28, 2017 19:42:32'),
(9, '6', '60', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1218878059\n					\n					Provide Help ID: Z1120145622\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1218878059', 'Z1120145622', 'Mar 29, 2017 10:02:27'),
(10, '34', '2', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1162753838\n					\n					Provide Help ID: Z1165997450\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1162753838', 'Z1165997450', 'Mar 29, 2017 12:58:46'),
(11, '34', '', 'MISTAKE IN CLICKING ON FAKE POP', 'OTHER QUESTIONS', 'Good day, please I mistakenly clicked on FAKE POP instead of CONFIRM on behalf of Chiedozie Smart. Please,help to correct it. Thanks', '2', 'YES', '', '', '', 'Mar 29, 2017 13:27:29'),
(12, '33', '', 'multiple merging of ph 1 gh 3', 'OTHER QUESTIONS', 'multiple merging of ph 1 gh 3', '1', 'YES', '', '', '', 'Mar 29, 2017 18:26:46'),
(13, '75', '', 'my account is blocked,please unlock my account', 'PARTICIPANT IS BLOCKED', 'please unblock my account', '1', 'YES', '', '', '', 'Mar 29, 2017 19:58:52'),
(14, '5', '93', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1138143269\n					\n					Provide Help ID: Z1229455161\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '3', 'YES', '', 'M1138143269', 'Z1229455161', 'Mar 30, 2017 02:37:08'),
(15, '8', '', 'Blocked', 'PARTICIPANT IS BLOCKED', 'My account was blocked due to bad network in my area, i was unable to upload pop after making some payment yesterday.\r\nPlease kindly unblocked me so I can upload pop and continue as a participant.\r\nPlease kindly unblocked me sir/ma', '1', 'YES', '', '', '', 'Mar 30, 2017 05:32:24'),
(16, '59', '', 'I was match with two participant and I have paid to one', 'OTHER QUESTIONS', 'I provide help of #2000 yesterday but I was merged with two participant and I have paid one .I paid to abalu chigozie with this phone number 07085474898 please support do something and he has not confirmed me', '0', 'YES', '', '', '', 'Mar 30, 2017 06:26:45'),
(17, '92', '', 'pls help me to unblocked my personal office! I have paid now but my accout was blocked', 'PARTICIPANT IS BLOCKED', 'Dear Admin, \r\nI Fapohunda Gbenga hereby want to use this medium to please help me to unblocked my account sir.  I got the message late and the network is very bad that why and what courses the delay sir. But I have made the payment now.  I will be very greatful if my application is been granted. \r\nThanks,\r\nRegard, \r\nFapohunda Gbenga.', '2', 'YES', '', '', '', 'Mar 30, 2017 10:56:24'),
(18, '55', '79', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1205133919\n					\n					Provide Help ID: Z1208082659\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '6', 'YES', '', 'M1205133919', 'Z1208082659', 'Mar 30, 2017 11:14:47'),
(19, '102', '', 'Receiver fails to confirmed me', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'I was ask to pay Mr  omotosho #2000 and I have paid him but yet to confirm me pls note this support', '1', 'YES', '', '', '', 'Mar 30, 2017 11:34:35'),
(20, '69', '', 'payment received', 'OTHER QUESTIONS', 'hello please this name by Participant Name: ASIRU AYODELE \r\nAmount: â‚¦1,000.00 \r\nReceive From: Sunkanmi \r\nStatus: Cancelled\r\npaid into my account this early in the morning of yesterday...i want you to help me work on it ..so that you grant him not to unblocked him please have recieved alert from him this morning.', '4', 'YES', '', '', '', 'Mar 30, 2017 14:56:36'),
(21, '43', '', 'help', 'BANKING DETAIL IS INCORRECT', 'kindly assist me open my account\r\n', '1', 'YES', '', '', '', 'Mar 30, 2017 18:45:10'),
(22, '30', '', 'pls i need my 2000 naira pls i hv not been payed please u can as well match someone too me too pay me my 2000 naira', 'PARTICIPANT IS BLOCKED', 'pls can you match someone too me too pay me my money', '1', 'YES', '', '', '', 'Mar 30, 2017 22:12:41'),
(23, '113', '', 'PH undermatch', 'OTHER QUESTIONS', 'I have make pledge since yesterday, am still undermatch', '1', 'YES', '', '', '', 'Mar 31, 2017 09:16:08'),
(24, '129', '', 'Have not get paid ', 'OTHER QUESTIONS', 'Have pay one person #1000 and have not get my return,now have Marge to pay 3 people again,pls remove them and let me get returned of #2000 \r\nThanks from Olabest2017', '4', 'YES', '', '', '', 'Mar 31, 2017 12:13:24'),
(25, '10', '', 'My donation', 'OTHER QUESTIONS', 'I donated 50000 and it has been pending for me to be paired, but now its no longer there...please resolve the problem', '1', 'YES', '', '', '', 'Mar 31, 2017 13:14:19'),
(26, '29', '', 'request for account reopening', 'PARTICIPANT IS BLOCKED', 'Didnt understand what happened to my account, pls try help fix up... thanks', '2', 'YES', '', '', '', 'Mar 31, 2017 15:57:05'),
(27, '1', '6', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1128030125\n					\n					Provide Help ID: Z1157833440\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1128030125', 'Z1157833440', 'Mar 31, 2017 17:59:39'),
(28, '89', '', 'I did not received any money', 'PARTICIPANT IS BLOCKED', 'I make two account to get paid by four people...... But only one person paid me while the other one said that he has paid some one this morning waiting to be paid..... Was ask to pay again.... So three people are still owning me .....please look into this', '3', 'YES', '', '', '', 'Mar 31, 2017 18:55:04'),
(29, '87', '127', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1135744372\n					\n					Provide Help ID: Z1164265714\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1135744372', 'Z1164265714', 'Mar 31, 2017 20:21:36'),
(30, '147', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', 'Please unblock my account which was blocked due to unforeseen circumstances which I was unable to login into my personal office. Thanks in anticipation towards my request ', '2', 'YES', '', '', '', 'Mar 31, 2017 20:47:16'),
(31, '114', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', 'Please unblock my account which was blocked due to unforeseen circumstances which I was unable to login into my personal office, thanks in anticipation towards my request ', '1', 'YES', '', '', '', 'Mar 31, 2017 20:49:02'),
(32, '64', '', 'Sender up', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', '', '0', 'YES', '', '', '', 'Mar 31, 2017 20:51:47'),
(33, '64', '', 'Sender upload a fake proof of payment', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Good day the sender olabest 2017 upload a fake proof of payment kindly block him and match me with another participant', '1', 'YES', '', '', '', 'Mar 31, 2017 20:53:01'),
(34, '126', '', 'blocked ', 'PARTICIPANT IS BLOCKED', 'Hello admin I was blocked without no reason, .smh ', '1', 'YES', '', '', '', 'Mar 31, 2017 21:19:24'),
(35, '41', '', 'am account is blocked,please unblock it ', 'PARTICIPANT IS BLOCKED', 'please unblock my account', '2', 'YES', '', '', '', 'Mar 31, 2017 21:29:47'),
(36, '55', '', 'Fake', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Sender uploaded a fake proof & I made a complaint pls help rectify issue, am d victim', '1', 'YES', '', '', '', 'Mar 31, 2017 21:57:09'),
(37, '30', '', '', 'OTHER QUESTIONS', 'am innocent why block my account', '1', 'YES', '', '', '', 'Mar 31, 2017 22:07:11'),
(38, '30', '', 'am innocent pls why block my account', 'OTHER QUESTIONS', '', '0', 'YES', '', '', '', 'Mar 31, 2017 22:08:07'),
(39, '30', '', 'why block my account pls', 'OTHER QUESTIONS', '', '0', 'YES', '', '', '', 'Mar 31, 2017 22:15:43'),
(40, '144', '', 'account blocked', 'OTHER QUESTIONS', 'Hi admin, please I dont know why account was blocked and I have been paired to pay someone before 7am today. Please help me open my account back so I can make the payment this morning as soon as possible. Thanks', '2', 'YES', '', '', '', 'Mar 31, 2017 23:33:26'),
(41, '87', '', 'He cancel it', 'PARTICIPANT IS BLOCKED', 'Two was mach to pay me 5000 but only one has pay......please look in to it', '2', 'YES', '', '', '', 'Apr 01, 2017 05:16:41'),
(42, '113', '', 'Unblock account', 'OTHER QUESTIONS', 'Kindly unblock my account', '2', 'YES', '', '', '', 'Apr 01, 2017 05:47:30'),
(43, '92', '', 'Bank Detail Correction!', 'BANKING DETAIL IS INCORRECT', 'Fapohunda Oluwagbenga Kolade\r\nBank Name:Diamond Bank plc\r\nAccount No: 8880686070. \r\nRegard,\r\nGbenga,\r\nThanks.', '1', 'YES', '', '', '', 'Apr 01, 2017 13:15:50'),
(44, '100', '', 'Sender upload a fake proof of payment', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Pls match me with another participant, participant upload fake proof payment', '1', 'YES', '', '', '', 'Apr 02, 2017 15:58:38'),
(45, '64', '129', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1151935238\n					\n					Provide Help ID: Z1139699962\n					\n					Amount: 1000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '4', 'YES', '', 'M1151935238', 'Z1139699962', 'Apr 02, 2017 19:26:38'),
(46, '33', '167', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1199394636\n					\n					Provide Help ID: Z1196417546\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'YES', '', 'M1199394636', 'Z1196417546', 'Apr 02, 2017 21:39:59'),
(47, '100', '', 'Eze', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'sender name EZE upload a fake proof of payment and you are march another person to paid him sir pls not Ambali rasheed.', '1', 'YES', '', '', '', 'Apr 03, 2017 05:51:27'),
(48, '87', '', 'He refused to pay', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'I call him...... He refused to  me since yesterday ', '2', 'YES', '', '', '', 'Apr 03, 2017 07:01:08'),
(49, '65', '', 'Matched with another participant', 'OTHER QUESTIONS', 'Good day I already provided help of 2000 to mr quadrado where by my balance remained 3000 and I was matched to pay 5000 please help me', '2', 'YES', '', '', '', 'Apr 03, 2017 07:16:20'),
(50, '30', '', '', 'OTHER QUESTIONS', 'pls dear idris ayuba olalekan and eze Emmanuel hv refused too pay me 5000 respectively making it ten thousand I hv called them but there line is switched off for three days now I sent them message still yet I hv not gotten reply from them pls help me my time is almost up and I hv not seen my payment pls', '1', 'YES', '', '', '', 'Apr 03, 2017 08:32:34'),
(51, '100', '', 'rashy', 'OTHER QUESTIONS', 'you have been on merged me balance ambali raheed pls not', '1', 'YES', '', '', '', 'Apr 03, 2017 12:02:11'),
(52, '117', '', 'Sender upload a fake proof of payment', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Pls kindly help me out,wizzy upload fake proof of payment', '3', 'YES', '', '', '', 'Apr 03, 2017 15:02:13'),
(53, '96', '167', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1207851291\n					\n					Provide Help ID: Z1230346041\n					\n					Amount: 4000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'YES', '', 'M1207851291', 'Z1230346041', 'Apr 03, 2017 16:11:20'),
(54, '89', '', 'Two people hv not paid  me my money due keep giving me excuses and their time of payment  is almost  up pls help me', 'OTHER QUESTIONS', '', '1', 'YES', '', '', '', 'Apr 03, 2017 19:06:02'),
(55, '117', '161', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1122538428\n					\n					Provide Help ID: Z1191885263\n					\n					Amount: 3000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '6', 'YES', '', 'M1122538428', 'Z1191885263', 'Apr 03, 2017 19:36:28'),
(56, '121', '', 'help me to contact the receiver to confirm me!', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'The Admin,\r\nI kolade hereby want d admin to help me contact BANK NAME: FIRST BANK\r\nHOLDER NAME: TAIWO SEUN OLORUNFEMI \r\nACCOUNT NUMBER: 3110555271. With phone digit: â€Ž07018896220 to please tell him to confirm me . \r\nThanks,\r\nRegard,\r\nKolade.', '3', 'YES', '', '', '', 'Apr 04, 2017 14:46:49'),
(57, '128', '', 'my money removed from my walet', 'OTHER QUESTIONS', 'I was suppose to receive 4,000 from a participant and the person did not pay. The person was later removed. But right now it says I have no money to receive in my wallet. ', '2', 'YES', '', '', '', 'Apr 05, 2017 06:02:55'),
(58, '100', '198', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1137324994\n					\n					Provide Help ID: Z1189632466\n					\n					Amount: 5000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '12', 'NO', '', 'M1137324994', 'Z1189632466', 'Apr 05, 2017 06:30:14'),
(59, '182', '', 'Unblock my account please', 'PARTICIPANT IS BLOCKED', 'Am pleading the support to unblock my account please am unhealthy that why the time exceeded pls', '1', 'YES', '', '', '', 'Apr 05, 2017 09:08:28'),
(60, '190', '', 'Receiver fails to confirmed me', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'Receiver fail to comfirm me and I have uploaded my statement of payment and their is know out going money in my outgoing income please note. Support', '7', 'YES', '', '', '', 'Apr 05, 2017 14:37:07'),
(61, '100', '', 'Sender uploaded fake proof', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Rayboy was merge with me to pay me the sum of 5000 but he did not pay me and still uploaded fake pop and I try to call him but refused to pick my call pls note support thank for your quick response thank you sir', '1', 'YES', '', '', '', 'Apr 05, 2017 16:20:28'),
(62, '113', '', 'Unblock account', 'PARTICIPANT IS BLOCKED', 'Kindly unblock my account', '1', 'YES', '', '', '', 'Apr 05, 2017 16:23:06'),
(63, '109', '', 'Unblock account', 'PARTICIPANT IS BLOCKED', 'Kindly unblock my account', '1', 'YES', '', '', '', 'Apr 05, 2017 16:24:11'),
(64, '1', '208', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1206153252\n					\n					Provide Help ID: Z1228383639\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1206153252', 'Z1228383639', 'Apr 05, 2017 19:12:01'),
(65, '69', '', 'merge', 'OTHER QUESTIONS', 'good day sir/ma,please just to notify you about my case since Monday that have provided help you have not merge me with someone that will pay me,hope there is no problem...thanks just want to remind you....have a nice day', '2', 'YES', '', '', '', 'Apr 06, 2017 07:08:55'),
(66, '163', '76', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1223646168\n					\n					Provide Help ID: Z1115390764\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1223646168', 'Z1115390764', 'Apr 07, 2017 10:12:03'),
(67, '156', '', 'How to make this site better', 'PARTICIPANT IS BLOCKED', 'Please open it back', '2', 'YES', '', '', '', 'Apr 07, 2017 13:39:28'),
(68, '234', '', 'receiver fails to confirm payment', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'with due respect support i paid the sum of 10 thousand to one participant but refuse to confirm me please do somthing sir', '1', 'YES', '', '', '', 'Apr 07, 2017 16:09:19'),
(69, '182', '', 'receiver fails to confirm payment', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'with due respect sir support i paid the sum of 1000 naira to one participant but refuse to confirm my payment', '1', 'YES', '', '', '', 'Apr 07, 2017 16:14:11'),
(70, '177', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', 'I paid but account was till blocked  in which i uploaded proof of payment ', '3', 'YES', '', '', '', 'Apr 07, 2017 18:12:49'),
(71, '126', '207', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1136077175\n					\n					Provide Help ID: Z1122052269\n					\n					Amount: 1000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '3', 'YES', '', 'M1136077175', 'Z1122052269', 'Apr 07, 2017 22:00:20'),
(72, '10', '96', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1227218900\n					\n					Provide Help ID: Z1151750265\n					\n					Amount: 2000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '5', 'YES', '', 'M1227218900', 'Z1151750265', 'Apr 08, 2017 15:47:33'),
(73, '190', '', 'Admin please confirm', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'Admin please check my payment. It has been a while since I provided help and the recipient has refused to confirm my payment since on Wednesday and this is intimidating people on my side to join the platform, thanks.', '3', 'YES', '', '', '', 'Apr 08, 2017 17:20:06'),
(74, '30', '', 'pls dear i hv a friend who wants too enter too but seeing that i hv not be payed the recent people that i provided help too hv not payed back too me she was discouraged too and she said she wont join this group i tried talking sence too her but she refuse', 'OTHER QUESTIONS', '', '1', 'YES', '', '', '', 'Apr 08, 2017 18:00:16'),
(75, '33', '92', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1146928379\n					\n					Provide Help ID: Z1211644250\n					\n					Amount: 10000', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1146928379', 'Z1211644250', 'Apr 08, 2017 20:12:27'),
(76, '67', '', 'Givers cycler ', 'OTHER QUESTIONS', 'Why have I not been merged to pay someone since it been a while I ordered \r\n\r\n', '2', 'YES', '', '', '', 'Apr 09, 2017 06:21:48'),
(77, '231', '', 'Luther omodolapo adebola', 'BANKING DETAIL IS INCORRECT', '', '2', 'YES', '', '', '', 'Apr 09, 2017 07:32:39'),
(78, '69', '', 'about merge', 'OTHER QUESTIONS', 'good day sir/ma,please just to notify you  that have provided help on Saturday and and have paid the person and he have confirm the POP and now you have not merge me with someone that will pay me,hope there is no problem...thanks just want to remind you because i just see that u dont notifly me as before on my dashboard(merge and reward just disapeared)....have a nice day	', '7', 'YES', '', '', '', 'Apr 09, 2017 10:48:04'),
(79, '10', '', 'My donation', 'OTHER QUESTIONS', 'I requested and made payment of 40k but i am only seeing 40k to be received...please help', '1', 'YES', '', '', '', 'Apr 09, 2017 22:38:51'),
(80, '100', '', 'Biola abass', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'She never paid me since three day ago pls marge me to another person she not interest because I call her that is what she said', '1', 'YES', '', '', '', 'Apr 09, 2017 22:40:21'),
(81, '100', '', 'Ambali rasheed', 'OTHER QUESTIONS', 'I provide help of 10k since three week ago.an i received help of 5k pls take note sir.', '1', 'YES', '', '', '', 'Apr 09, 2017 22:50:50'),
(82, '31', '', 'NO GH since', 'OTHER QUESTIONS', 'Good day sir, I made a payment since last week Tuesday but I have not been GH to get paid....... Any possible solution please?\r\n\r\nThanks.', '1', 'YES', '', '', '', 'Apr 10, 2017 04:52:14'),
(83, '180', '', 'I have not been merged', 'OTHER QUESTIONS', 'Good day sir, I made a payment since last week Tuesday but I have not been GH to get paid....... Any possible solution please?\r\n\r\nThanks.', '1', 'YES', '', '', '', 'Apr 10, 2017 04:54:06'),
(84, '190', '', 'Receiver fails to confirmed me', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'My name is Badmus Bisola Nafisat, I was asked to pay to these people buh they did not confirm me buh have complain and u said the system will confirm me since last week wenesday please admin do something .This are the name of the peoples\r\n\r\nEze victor chinedu\r\n0122525824(gtb) 2,000\r\n08103374417\r\n\r\nOnaolapo timileyin abayomi\r\n3090200103(first bank)1,000\r\n08149959043 \r\n\r\nBayode Joseph\r\n2113248504(zenith)1,000\r\n09091444169\r\n\r\nIpele Joshua temitope\r\n0129058404 (gtb) 1,000\r\n08186319382\r\n\r\nIt already been a while please do something admin', '1', 'YES', '', '', '', 'Apr 10, 2017 06:55:34'),
(85, '121', '', 'why did my transaction cancelled !', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'The Admin, \r\nI kolade made a  Provide Help (Z1111147977)\r\nParticipant Name: MAYOUR22 \r\nAmount: â‚¦2,000.00 \r\nStatus: Cancelled . To A/c Name:Taiwo Seun Olorunfemi, A/c no: 3110555271. Bankname: First bank. On the 04-04-2017.  Instead of been writen paid. Pls hlp me out.', '2', 'YES', '', '', '', 'Apr 10, 2017 08:34:51'),
(86, '165', '254', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1170939858\n					\n					Provide Help ID: Z1144089514\n					\n					Amount: 5000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'NO', '', 'M1170939858', 'Z1144089514', 'Apr 10, 2017 18:46:47'),
(87, '225', '', '', 'OTHER QUESTIONS', 'I ph seens Friday and mai money is still in mai wallet pls help me to rectify it bcoz am not on qe\r\nqueue till date.', '1', 'YES', '', '', '', 'Apr 10, 2017 20:11:31'),
(88, '122', '', 'Matched with another participant', 'OTHER QUESTIONS', 'This is the 8th days GH under match', '1', 'YES', '', '', '', 'Apr 11, 2017 06:27:04'),
(89, '6', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', 'Please unblock my account which was blocked due to unforeseen circumstances ', '1', 'YES', '', '', '', 'Apr 11, 2017 06:55:22'),
(90, '129', '', 'how am i geting my retruned', 'OTHER QUESTIONS', 'how am i geting my retruned,after i have paid', '1', 'YES', '', '', '', 'Apr 11, 2017 09:35:50'),
(91, '114', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', '\r\nPlease unblock my account which was blocked due to unforeseen circumstances which I was unable to login into my personal office, thanks in anticipation towards my request ', '1', 'YES', '', '', '', 'Apr 11, 2017 10:41:15'),
(92, '100', '', 'Statement of account', 'OTHER QUESTIONS', 'With due respect sir I ambali rasheed wanted to upload my statement of of account pls thanks for the quick responds', '2', 'YES', '', '', '', 'Apr 11, 2017 11:58:04'),
(93, '198', '', 'Receiver Refused to confirm payment', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'I PH last week and receiver refused to confirm payment', '3', 'YES', '', '', '', 'Apr 11, 2017 14:42:33'),
(94, '100', '', 'Fake pop (Typed SMS) not including my name', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'Hello admin, the recipient (Rayboy) uploaded a fake typed SMS which is not including my real details, account number typed not complete. I called him but not picking it severally, he always threat me with a hidden number. Admin please kindly help me out', '2', 'YES', '', '', '', 'Apr 11, 2017 15:12:04'),
(95, '171', '', 'please unblock my account', 'PARTICIPANT IS BLOCKED', 'please unblock my account', '1', 'YES', '', '', '', 'Apr 11, 2017 15:53:11'),
(96, '171', '', 'please unblock my account ', 'PARTICIPANT IS BLOCKED', 'please unblock my account', '1', 'YES', '', '', '', 'Apr 11, 2017 15:54:45'),
(97, '2', '261', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1116779320\n					\n					Provide Help ID: Z1195232506\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'NO', '', 'M1116779320', 'Z1195232506', 'Apr 11, 2017 19:01:26'),
(98, '30', '', 'pls i am seriously afraid now i hv ph 10k and am very afraid pls it my last money i hv now pls help me out i hv not received my old payment and i   taking very serious risk now', 'OTHER QUESTIONS', 'pls help me out', '1', 'YES', '', '', '', 'Apr 11, 2017 20:00:07'),
(99, '69', '', 'merge', 'OTHER QUESTIONS', 'good day sir/ma,please i want you to explain well to me because i dont understand you any more....have provide help since lastweek now and u said i should re-provide help again when have not recieved the outstanding own....please brief me more please because i dont understand.thanks', '2', 'YES', '', '', '', 'Apr 13, 2017 13:50:06'),
(100, '40', '', '', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'I have called him to confirm me since after the payment of the sum of 1000 naira only but he ave not confirm me before his fone went off now wen I try to call him back', '1', 'YES', '', '', '', 'Apr 13, 2017 16:17:46'),
(101, '121', '', 'Please let me get my help !', 'OTHER QUESTIONS', 'The Admin,\r\nI mayour22 provide help on two occasions now. I tink dere error somewhere pls  1. I paid #2,000 and #1,000 to different account but knw to my surprise I can jst get help on only a #1,000 now in which I dnt knw why? I did the 2transaction @ d same time . Now I want to get help on remaining #2,000 which I paid. The transaction with PH id: Z1111147977. Hence, you provided help of N2,000 to BANK NAME: FIRST BANK\r\nHOLDER NAME: TAIWO SEUN OLORUNFEMI\r\nACCOUNT NUMBER: 3110555271. with PH id: Z1141856415 which has been added to GH list. Do wait while your order gets merged. Thanks. But I have not seen any thing up till now. 2: But now on d new policy I dnt undestd. I PH of #1,000 to get help of #2,000, and I have PH of #1,000 again and to my surprise now I was getting help of same #1,000. So dat means you are not standing on your words. Pls let me get help on my #2000.\r\nThanks.\r\n ', '2', 'YES', '', '', '', 'Apr 13, 2017 16:28:25'),
(102, '1', '305', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1174787045\n					\n					Provide Help ID: Z1150755020\n					\n					Amount: 7000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'NO', '', 'M1174787045', 'Z1150755020', 'Apr 13, 2017 16:44:19'),
(103, '276', '', 'Please unblock my account ', 'PARTICIPANT IS BLOCKED', 'Please unblock my account which was blocked due to unforeseen circumstances ', '1', 'YES', '', '', '', 'Apr 13, 2017 17:30:28'),
(104, '226', '305', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1212387133\n					\n					Provide Help ID: Z1150755020\n					\n					Amount: 6000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1212387133', 'Z1150755020', 'Apr 13, 2017 20:11:22'),
(105, '226', '305', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1212387133\n					\n					Provide Help ID: Z1221221226\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '2', 'YES', '', 'M1212387133', 'Z1221221226', 'Apr 13, 2017 20:11:26'),
(106, '7', '', 'chuba', 'OTHER QUESTIONS', 'hello admin..pls I was merged with chuba; a participant on GC to pay me the sum of 6k which have tried getting in touch with him but all effort wasted...pls sir do some thing..', '1', 'YES', '', '', '', 'Apr 13, 2017 22:01:45'),
(107, '159', '', 'INCOMPLETE MERGE', 'OTHER QUESTIONS', 'Good day, I have an outstanding GH of 20K and you promised 300% if Re-PH, i re-phed 5k and I was merged to receive  6k, please do something about this, NIFEMI ', '1', 'YES', '', '', '', 'Apr 14, 2017 12:18:06'),
(108, '100', '', 'Muniru ahmed', 'RECEIVER FAILS TO CONFIRM PAYMENT', 'I sender payment of  2000  pls confirm  my payment', '1', 'YES', '', '', '', 'Apr 14, 2017 15:59:30'),
(109, '232', '100', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1114558406\n					\n					Provide Help ID: Z1179340588\n					\n					Amount: 2000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'NO', '', 'M1114558406', 'Z1179340588', 'Apr 15, 2017 07:59:13'),
(110, '232', '160', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1114558406\n					\n					Provide Help ID: Z1229718934\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'NO', '', 'M1114558406', 'Z1229718934', 'Apr 15, 2017 07:59:19'),
(111, '227', '160', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1130863846\n					\n					Provide Help ID: Z1229718934\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'NO', '', 'M1130863846', 'Z1229718934', 'Apr 15, 2017 08:14:55'),
(112, '227', '', 'Wrong /fake proof of payment ', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'I never received from Omolara of 1000 she supposed to pay. The proof of payment upload is not for me. \r\n Thanks ', '1', 'YES', '', '', '', 'Apr 15, 2017 08:20:11'),
(113, '227', '', 'Wrong /fake proof of payment ', 'SENDER UPLOAD FAKE PROOF OF PAYMENT', 'I never received from Omolara of 1000 she supposed to pay. The proof of payment upload is not for me. \r\n Thanks ', '0', 'YES', '', '', '', 'Apr 15, 2017 08:21:15'),
(114, '8', '148', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1171580452\n					\n					Provide Help ID: Z1228667700\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '12', 'NO', '', 'M1171580452', 'Z1228667700', 'Apr 15, 2017 17:26:02'),
(115, '225', '6', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1135835048\n					\n					Provide Help ID: Z1192516339\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1135835048', 'Z1192516339', 'Apr 15, 2017 18:33:57'),
(116, '126', '305', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1223116484\n					\n					Provide Help ID: Z1150755020\n					\n					Amount: 7000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '1', 'NO', '', 'M1223116484', 'Z1150755020', 'Apr 15, 2017 19:14:03'),
(117, '92', '', 'Receiver did not refund my money ! ', 'OTHER QUESTIONS', 'The Admin, \r\nI Gbemtos1 made a transaction of #2,000 on d details below, Provide Help (Z1156032743)\r\nParticipant Name: GBEMTOS1 \r\nAmount: â‚¦2,000.00\r\nDate Order: 29.03.2017 16:20 \r\nStatus: Cancelled  and I was told to contact d receiver to refund my money, but to my surprise d receiver did not refund my money and now when ever I try to cal him , he never pick my calls. But I was told dat he still run an account with givers cycler. Receiver name: Odeyemi Stephen O. A/c no: 0014641967, Access bank. Pls kindly help me out . \r\nThanks', '1', 'NO', '', '', '', 'Apr 17, 2017 00:03:27'),
(118, '30', '', 'essien does not want too pay me my 20k', 'OTHER QUESTIONS', '', '1', 'YES', '', '', '', 'Apr 17, 2017 12:54:20'),
(119, '168', '', 'Remaining fund not seen', 'OTHER QUESTIONS', 'I was paid 1k out of my balance and the remaining 3k was nt seen in my wallet', '1', 'YES', '', '', '', 'Apr 17, 2017 17:47:58'),
(120, '8', '99', 'FAKE PROOF OF PAYMENT \n					\n					Get Help ID: M1171580452\n					\n					Provide Help ID: Z1198532182\n					\n					Amount: 1000', 'SENDER UPLOADED A FAKE PROOF OF PAYMENT', 'Dear participant,\n					\n					Since payment was flag as FAKE i.e. Not Received!, The two parties are to perform the following\n					\n					1. Receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\n					\n					2. Sender should upload proof of paymnent as attached to receiver.\n					\n					NOTE:\n					\n					Should any of the two parties fails to attach a proof under 48hours, then he or she will be blocked.\n					\n					THANK YOU.', '0', 'YES', '', 'M1171580452', 'Z1198532182', 'Apr 19, 2017 06:49:53'),
(121, '257', '', 'Personal office re-opening', 'OTHER QUESTIONS', 'Plz help me re-open my personal o\r\nAccount, the person merged with me to pay me did not pay and said he is no longer interested. ', '3', 'YES', '', '', '', 'Apr 19, 2017 16:22:05'),
(122, '224', '', 'changing of bank details', 'BANKING DETAIL IS INCORRECT', 'Bank name: wema bank\r\nAcct no: 0231925970\r\nAcct name: Arowolo Aliu Adekunle', '1', 'YES', '', '', '', 'Apr 20, 2017 10:22:24'),
(123, '180', '', 'changing of bank details and phone number', 'BANKING DETAIL IS INCORRECT', 'Bank name: wema bank\r\nAcct no: 0231925970\r\nAcct name: Arowolo Aliu Adekunle\r\nPhone number: 0907283447', '0', 'NO', '', '', '', 'Apr 21, 2017 06:58:06'),
(124, '129', '', 'foolish ppl', 'OTHER QUESTIONS', 'u dey all mad foolish ppl', '0', 'YES', '', '', '', 'Apr 21, 2017 11:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `replyid` int(255) NOT NULL,
  `ticketid` varchar(255) NOT NULL,
  `participantID` varchar(255) NOT NULL,
  `replymsg` longtext NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `date_written` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`replyid`, `ticketid`, `participantID`, `replymsg`, `attachment`, `date_written`) VALUES
(1, '1', 'CAROLINE HELVEY', 'thanks for contacting us  \r\n\r\nwe are sorry for the inconveniences this might have caused you, the banking details is at right Conner of the order, swipe right to view the details, or switch to another browser such as, chrome, Mozila, uc browser or desktop', '', 'Mar 27, 2017 17:58:01'),
(2, '2', 'LUKE HOWARD', 'thanks for contacting us  \r\n\r\nyour complain have been received and will be looked into \r\n\r\nwarm regards ', '', 'Mar 27, 2017 18:01:12'),
(3, '2', '8', 'Thanks', '', 'Mar 27, 2017 18:05:51'),
(4, '2', 'TERRA COLE ', 'Your request has been solved.\r\n\r\nThanks for consulting us.', '', 'Mar 27, 2017 20:42:38'),
(5, '4', '3', 'hello admin.  BAKPO5 has refused to pay me a sum of 20000.and has uploaded a fake proff of payment', '', 'Mar 28, 2017 00:59:11'),
(6, '5', '3', 'admin  BAKPO5  has repeated the same tin and refused to pay me', '', 'Mar 28, 2017 01:00:56'),
(7, '4', 'MICHAEL ARMSTRONG', 'Dear participants,\r\n\r\nKindly follow the below instruction\r\n\r\nReceiver should upload his or her bank account statement\r\nSender should upload proof of payment.\r\n\r\nShould any of the parties failed to follow the instruction? Then the defaulted party get block', '', 'Mar 28, 2017 05:48:50'),
(8, '5', 'ERIC GERANEN', 'Dear participants, Kindly follow the below instruction Receiver should upload his or her bank account statement Sender should upload proof of payment. Should any of the parties failed to follow the instruction? Then the defaulted party get block ', '', 'Mar 28, 2017 05:49:31'),
(9, '3', '1', 'Bapko5 did not pay me, here is my account details below', 'Captureddddddd.PNG', 'Mar 28, 2017 13:19:05'),
(10, '3', 'PAUL JOHNSON ', 'Your request has been resolved. \r\n\r\nThank You', '', 'Mar 28, 2017 14:17:39'),
(11, '5', 'ERIC GERANEN', 'Your request has been resolved', '', 'Mar 28, 2017 14:19:57'),
(12, '4', 'TERRA COLE ', 'Your request has been resolved', '', 'Mar 28, 2017 14:20:56'),
(13, '6', 'CAROLINE HELVEY', 'Your request has been resolved', '', 'Mar 28, 2017 14:21:24'),
(14, '7', 'ERIC GERANEN', 'How do you mean?\r\n', '', 'Mar 28, 2017 15:24:37'),
(15, '7', 'MICHAEL ARMSTRONG', 'Your issue has been resolved, pay to Topzy', '', 'Mar 28, 2017 15:47:59'),
(16, '8', 'KELVIN WOODS', 'Your request has been resolved!\r\n\r\nThank You.', '', 'Mar 28, 2017 19:43:23'),
(17, '10', '2', 'i have completed this payment', '', 'Mar 29, 2017 13:39:49'),
(18, '11', 'MICHAEL ARMSTRONG', 'Thanks for consulting us.\r\n\r\nYour request will be forwarded to the appropriate department.', '', 'Mar 29, 2017 14:12:10'),
(19, '9', '60', '', 'melissa.htm', 'Mar 29, 2017 16:21:08'),
(20, '11', 'MICHAEL ARMSTRONG', 'Dear Nikegreat, Kindly confirm the order. Issue has been resolved.\r\n\r\nThank You.', '', 'Mar 29, 2017 16:29:34'),
(21, '10', 'CAROLINE HELVEY', 'Your issue has been resolved, please inform your match to confirm your payment.\r\n\r\nThanks', '', 'Mar 29, 2017 16:30:53'),
(22, '9', 'TERRA COLE ', 'Your issue has been resolved. Kindly inform your match to confirm your payment.', '', 'Mar 29, 2017 16:32:07'),
(23, '13', 'TERRA COLE ', 'Your request is accepted for solution.\r\n\r\nThanks', '', 'Mar 30, 2017 02:23:19'),
(24, '14', '5', 'Payment not received also, I cant see your teller', '', 'Mar 30, 2017 02:38:12'),
(25, '16', 'JAMES PATTERSON', 'Thanks for contacting us, your request has been resolved.\r\n\r\nDo wait while the participant confirms your payment. Also, try and inform the participant about your payment.\r\n\r\nTHANKS.', '', 'Mar 30, 2017 07:09:08'),
(26, '15', 'ERIC GERANEN', 'Dear participant, kindly inform your match to refund you as the system wont be able to handle a refund case.', '', 'Mar 30, 2017 07:14:31'),
(27, '12', 'TERRA COLE ', 'Issue resolved', '', 'Mar 30, 2017 07:15:05'),
(28, '14', 'ERIC GERANEN', 'Your complain have been received and forwarded to the appropriate department. Thank you... ', '', 'Mar 30, 2017 07:28:49'),
(29, '18', '55', 'Went to d bank already no payment was made.', 'Screenshot_20170330-121621.png', 'Mar 30, 2017 11:36:02'),
(30, '18', '55', 'This is the teller he uploaded', '', 'Mar 30, 2017 11:37:38'),
(31, '18', '55', 'This is d proof of d teller he uploaded, was not even clear.', 'Screenshot_20170330-123648.png', 'Mar 30, 2017 12:46:54'),
(32, '19', 'PAUL JOHNSON ', 'Thanks for consulting us.\r\n\r\nThe system is designed to handle such issue only when receiver fails to confirm payment after 72hours of payment execpt it was flag as fake payment.\r\n\r\nThank You.', '', 'Mar 30, 2017 14:05:44'),
(33, '18', 'MICHEAL SMITH', 'Your issue will be resolved within 48hours if sender refuses to attend to the issue or make payment.', '', 'Mar 30, 2017 14:06:58'),
(34, '17', 'ERIC GERANEN', 'Dear Gbemtos1,\r\n\r\nYou failed to make payment, hence your account get blocked. \r\n\r\nShould you make payment and fail to upload proof? Contact receiver for a refund.\r\n\r\nHoping to hear from you.', '', 'Mar 30, 2017 14:09:04'),
(35, '21', 'CAROLINE HELVEY', 'Thank you for contacting us.\r\n\r\nYour issue has been resolved.', '', 'Mar 30, 2017 19:54:19'),
(36, '22', 'PAUL JOHNSON ', 'Dear participant, I believe you understands how the system works, its a peer to peer donation, everyone get paid. \r\n\r\nIn your transaction log, I can see you are not new in the system, when it gets to your turn you get merged.', '', 'Mar 31, 2017 01:54:53'),
(37, '20', 'ELIAS MKALECH', 'Kindly refund the participant your order has been re-merged.\r\n\r\nThank you.', '', 'Mar 31, 2017 01:55:37'),
(38, '14', 'MICHAEL ARMSTRONG', 'Your issue has been resolved.', '', 'Mar 31, 2017 01:56:13'),
(39, '20', '69', 'ok sir....thanks....i will do that this morning', '', 'Mar 31, 2017 06:43:51'),
(40, '23', 'CAROLINE HELVEY', 'Thanks for contacting support... The PH request is greater than GH request, this means that the system is very much healthy, be calm it will get to your turn....keep inviting people and keep PHing. Thanks  ', '', 'Mar 31, 2017 12:31:04'),
(41, '24', 'TERRA COLE ', 'Thanks for contacting support, Your request have been forwarded to the appropriate department.', '', 'Mar 31, 2017 12:33:07'),
(42, '20', '69', 'have refund the money back sir...thanks', '', 'Mar 31, 2017 16:01:00'),
(43, '26', 'LUKE HOWARD', 'Thanks for contacting support. please how can we be of help to you?', '', 'Mar 31, 2017 16:12:19'),
(44, '25', 'LUKE HOWARD', 'Your request have been resolved.thanks', '', 'Mar 31, 2017 16:15:17'),
(45, '28', 'JAMES PATTERSON', 'Dear Olucukwu ufondu, kindly send your other account details while we make a run on your account.\r\n\r\nThanks', '', 'Mar 31, 2017 18:57:23'),
(46, '28', '89', 'Out of four people I received only one .....please look into this', '', 'Mar 31, 2017 18:58:09'),
(47, '18', '55', 'Am the victim & my account was supposed to b credited and it was not \r\nAv made a complaint already & y is it dat it my account that was blocked.', '', 'Mar 31, 2017 21:51:04'),
(48, '36', 'JAMES PATTERSON', 'Dear participant, your issue has been escalated to the appropriate department', '', 'Mar 31, 2017 23:11:10'),
(49, '37', 'ELIAS MKALECH', 'Issue resolved', '', 'Mar 31, 2017 23:25:58'),
(50, '40', 'ERIC GERANEN', 'Dear participant, thanks for contacting us, your issue will be resolve soon.\r\n\r\nThanks', '', 'Mar 31, 2017 23:36:06'),
(51, '42', 'CAROLINE HELVEY', 'Your request will be look into.\r\n\r\nThanks', '', 'Apr 01, 2017 06:25:57'),
(52, '41', 'PAUL JOHNSON ', 'Your request will be look into.\r\n\r\nThanks', '', 'Apr 01, 2017 06:26:16'),
(53, '35', 'JAMES PATTERSON', 'Your request will be look into.\r\n\r\nThanks', '', 'Apr 01, 2017 06:26:34'),
(54, '30', 'LUKE HOWARD', 'Your request will be look into.\r\n\r\nThanks', '', 'Apr 01, 2017 06:27:01'),
(55, '40', 'MICHAEL ARMSTRONG', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 07:02:10'),
(56, '18', 'KELVIN WOODS', 'Your request has been resolved', '', 'Apr 01, 2017 08:13:09'),
(57, '42', 'CAROLINE HELVEY', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:50:56'),
(58, '41', 'PAUL JOHNSON ', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:52:41'),
(59, '35', 'JAMES PATTERSON', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:53:42'),
(60, '34', 'JAMES PATTERSON', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:54:08'),
(61, '33', 'KELVIN WOODS', 'Dear participant,\r\n\r\nKindly click on fake POP on your portal else the system confirms the payment automatically on your behalf after 72hours (3days)', '', 'Apr 01, 2017 08:55:28'),
(62, '31', 'MICHEAL SMITH', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:55:52'),
(63, '30', 'CAROLINE HELVEY', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:56:33'),
(64, '28', 'MICHEAL SMITH', 'Was the payment made to you or did any of the payment upload a fake POP to you if yes, click on FAKE POP in order to flag the payment', '', 'Apr 01, 2017 08:58:02'),
(65, '26', 'LUKE HOWARD', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 08:58:28'),
(66, '24', 'TERRA COLE ', 'Dear olabest2017, I made a run on your account and could see you provide help of N1,000 which is to be paid to Iyasuper.\r\n\r\nKindly honor your match so as not to get blocked and loose your wallet.\r\n\r\nThanks', '', 'Apr 01, 2017 09:03:21'),
(67, '20', 'CAROLINE HELVEY', 'Thanks for your loyalty and generosity, We love you.', '', 'Apr 01, 2017 09:04:55'),
(68, '17', 'LUKE HOWARD', 'Your request has been resolved. \r\n\r\nThanks', '', 'Apr 01, 2017 09:05:39'),
(69, '43', 'ERIC GERANEN', 'Your request has been resolved.', '', 'Apr 02, 2017 17:24:11'),
(70, '46', '33', '', 'Screenshot_2017-04-02-23-12-16.png', 'Apr 02, 2017 23:14:06'),
(71, '45', 'TERRA COLE ', 'Dear participant, your request have received and forwarded to the appropriate department.   \r\n\r\nThanks   ', '', 'Apr 03, 2017 00:46:28'),
(72, '44', 'KELVIN WOODS', 'Thanks for contacting support, please FLAG as fake POP and we will take it from there. thanks', '', 'Apr 03, 2017 00:50:08'),
(73, '48', '87', 'He has not paid ', '', 'Apr 03, 2017 09:14:37'),
(74, '49', 'LUKE HOWARD', 'Dear participant,\r\n\r\nKindly upload proof of payment you used in paying Quadrado. Once we confirm that the payment was made, a sum of  \"N2000\" will be added to your current wallet, this was due to server glitch.  kindly bear with us.\r\n\r\nkindly fulfill your', '', 'Apr 03, 2017 09:25:19'),
(75, '50', 'LUKE HOWARD', 'Dear participant,\r\n\r\nThanks for contacting Giverscycler, kindly wait for their time to elapse, if any participant fails to fulfill his/her pledge, the participant  will be blocked and the receiver will be re-merged.\r\n\r\nThanks   ', '', 'Apr 03, 2017 09:33:46'),
(76, '47', 'PAUL JOHNSON ', 'Thanks for contacting Giverscycler,\r\n\r\nkindly flag the payment as FAKE POP. A ticket will be created between the sender and the receiver.\r\nyou will be directed on what to do after the ticket has been created.\r\n\r\nTHANKS', '', 'Apr 03, 2017 09:41:04'),
(77, '49', 'JAMES PATTERSON', 'Your request has been resolved. We do apologize for any inconvenience.\r\n\r\n\r\nThanks', '', 'Apr 03, 2017 10:22:18'),
(78, '48', 'TERRA COLE ', 'Thanks for contacting us.\r\n\r\nthe system will automatically merge you with another participant if one refuses to pay you \r\n.', '', 'Apr 03, 2017 11:29:47'),
(79, '51', 'MICHEAL SMITH', 'Sir, can you please explain better?', '', 'Apr 03, 2017 15:29:23'),
(80, '52', 'TERRA COLE ', 'Dear participant, kindly click on fake POP icon else the system confirms the payment on your behalf after 72hours of uploaded POP', '', 'Apr 03, 2017 15:31:04'),
(81, '53', 'LUKE HOWARD', 'Dear participant,\r\n\r\nSender should upload proof of payment and receiver should upload his or her statement of account starting from a week before expecting payment plus a week of payment expiration.\r\n\r\nShould any of the parties fails to follow the procedu', '', 'Apr 03, 2017 16:39:47'),
(82, '24', '129', 'i get the message late,I need to visit my bank on wednesday before I can uplaodmy bank statement', '', 'Apr 03, 2017 18:48:57'),
(83, '45', '64', 'I have submitted the screen shot of the false payment', 'Screenshot_2017-04-03-21-09-38.png', 'Apr 03, 2017 20:11:35'),
(84, '55', '117', 'Pls attend to !e quickly', 'Screenshot_2017-04-03-21-15-53.png', 'Apr 03, 2017 20:16:45'),
(85, '54', 'PAUL JOHNSON ', 'Dear Oluchukwu ufondu, Once their time is up, you will be re-merged. \r\n\r\nThe system is as stable as rock, fearless.\r\n\r\nRe-merging is only done once sender did not fulfil his pledge.\r\n\r\nTHANKS.', '', 'Apr 03, 2017 20:19:12'),
(86, '55', 'PAUL JOHNSON ', 'Dear Alonge, is this your bank account statement?', '', 'Apr 03, 2017 20:20:12'),
(87, '55', '117', 'That is wizzy proof of payment', '', 'Apr 04, 2017 09:11:23'),
(88, '55', 'PAUL JOHNSON ', 'Send your bank account statement while Sender (wizzy) sends his own payment receipt.\r\n\r\nThanks', '', 'Apr 04, 2017 12:43:55'),
(89, '56', 'CAROLINE HELVEY', 'Dear participant, once your payment has been made, confirm your match to do that for you. Should receiver fails to confirm your payment, the system then confirms the payment after 72hours.\r\n\r\nFearless,  all is under control.', '', 'Apr 04, 2017 14:59:39'),
(90, '56', '121', 'Ok thank so much, am very greatful. ', '', 'Apr 05, 2017 06:18:46'),
(91, '58', '198', '', 'givers pay.png', 'Apr 05, 2017 06:36:55'),
(92, '58', '100', 'Have not been see alert from you and I can see you that you upload POP ...and your number is not going', '', 'Apr 05, 2017 06:55:34'),
(93, '57', 'ELIAS MKALECH', 'Thanks for consulting us. Your request will be looked into.\r\n\r\nPlease hold.', '', 'Apr 05, 2017 07:35:32'),
(94, '57', 'ELIAS MKALECH', 'Your request has been resolved.\r\n\r\nThanks', '', 'Apr 05, 2017 07:41:37'),
(95, '45', 'JAMES PATTERSON', 'Thanks for contacting us, send your bank account statement as these will be the only way we can resolve these issue.\r\n\r\nTHANKS', '', 'Apr 05, 2017 07:46:11'),
(96, '58', '198', 'My Number Is Active', '', 'Apr 05, 2017 07:48:44'),
(97, '59', 'KELVIN WOODS', 'Your request has been accepted for solution. \r\n\r\nThanks.', '', 'Apr 05, 2017 09:31:36'),
(98, '56', 'JAMES PATTERSON', 'You are welcome,\r\n\r\nWe are happy to help you always.', '', 'Apr 05, 2017 09:33:59'),
(99, '58', '100', 'you not  active call my no 08059299439 or 08180968133 now', '', 'Apr 05, 2017 09:44:14'),
(100, '63', 'ELIAS MKALECH', 'Dear participant, your request has been accepted for solution.\r\n\r\nThanks', '', 'Apr 05, 2017 19:02:00'),
(101, '62', 'ELIAS MKALECH', 'Dear participant, your request has been accepted for solution.\r\n\r\nThanks', '', 'Apr 05, 2017 19:02:25'),
(102, '61', 'ELIAS MKALECH', 'Dear participant, your issue will be looked into after 48hours, If sender fails to make payment.\r\n\r\nThanks', '', 'Apr 05, 2017 19:04:31'),
(103, '60', 'ERIC GERANEN', 'Dear participant, kindly upload your proof of payment.\r\n\r\nThanks', '', 'Apr 05, 2017 19:07:09'),
(104, '60', '190', 'I have uploaded it before the time run out please support am pleading check they gave me four participants I should pay to and others have confirmed me remains only eze victor chinedu did not confirm me pls note it support .and the system automatic confir', '', 'Apr 05, 2017 19:48:48'),
(105, '60', '190', 'This is my proof of  payment', 'IMG_20170405_210541.jpg', 'Apr 05, 2017 20:07:35'),
(106, '60', 'JAMES PATTERSON', 'Dear participant, kindly inform your match to confirm his payment or inform your match to flag your order has FAKE POP so as to resolve the issue with both of you.\r\n\r\nThanks', '', 'Apr 05, 2017 22:09:38'),
(107, '60', '190', 'I have being calling his number but he did not pick my calls pls do something support Sir resolve it so that many people can come in givers are receiver thank you for your quick respond.', '', 'Apr 06, 2017 05:40:32'),
(108, '60', 'JAMES PATTERSON', 'Dear participant, kindly wait while receiver confirms your payment. Should receiver fails to confirm payment, the system confirms your payment after 72hours of upload.\r\n\r\n\r\nThanks', '', 'Apr 06, 2017 06:00:03'),
(109, '60', '190', 'OK thanks  for your understanding', '', 'Apr 06, 2017 06:10:17'),
(110, '65', 'TERRA COLE ', 'Dear participant, Your GH date starts after 24hours your match confirms your order.\r\n\r\nThe system is working perfectly as participant are getting paid every day.\r\n\r\nDo wait while the systems gets to your turn and merges you.\r\n\r\nThanks', '', 'Apr 06, 2017 07:36:46'),
(111, '65', '69', 'ok...thanks', '', 'Apr 06, 2017 12:31:17'),
(112, '24', 'KELVIN WOODS', 'Kindly upload your bank account statement.', '', 'Apr 06, 2017 12:46:30'),
(113, '52', 'MICHEAL SMITH', 'Dear participant, your time is almost up, your case wont be resolved if both parties fails to comply with the instruction given.', '', 'Apr 06, 2017 21:01:55'),
(114, '67', 'ERIC GERANEN', 'Can you explain in full?', '', 'Apr 07, 2017 14:38:14'),
(115, '68', 'MICHEAL SMITH', 'Dear participant, your request has been received and forwarded to the appropriate department.', '', 'Apr 07, 2017 19:48:38'),
(116, '69', 'ELIAS MKALECH', 'Your request has been resolved.', '', 'Apr 07, 2017 19:49:25'),
(117, '70', 'ERIC GERANEN', 'Dear participant, your request has been received and forwarded to the appropriate department.', '', 'Apr 07, 2017 19:50:35'),
(118, '58', 'TERRA COLE ', 'Dear rashy,\r\n   Failure to upload your bank statement within 72 hours ,will lead to auto confirmation of the payee.', '', 'Apr 07, 2017 20:12:09'),
(119, '45', 'ELIAS MKALECH', 'Your request has been resolved. Thanks', '', 'Apr 07, 2017 20:16:04'),
(120, '71', '126', 'i dint receive any money from the payee\r\n', '', 'Apr 07, 2017 22:01:21'),
(121, '71', '207', 'I paid too u this is my wasapp number so dat i can show u d prove of payment 08175174131', 'JPEG_20160925_112044_-2024357156.jpg', 'Apr 08, 2017 09:35:48'),
(122, '72', '10', 'I dont have any means of sending my statement of account...please check with the sender if she will pay or be blocked..thank you', '', 'Apr 08, 2017 15:51:30'),
(123, '74', 'PAUL JOHNSON ', 'Dear Lucy, We really appreciate your effort towards the growth of the community. Defaulters (FAKE PARTICIPANT) are the one causing the delay. Some defaulters will PH and refuse to pay hence the system return the receiver back to the Queue in order to get re-merged. Our developer has been working round the clock to get the issue resolved hence a solution was discovered. Any participant in any package can pay anyone on any participant so as to limit the burden on which package.\n\nKeep inviting your friends and promote GIVERSCYCLER in the best way you can.\n\nWe won\'t disappoint You.\n\nThanks', '', 'Apr 08, 2017 19:56:05'),
(124, '73', 'CAROLINE HELVEY', 'Dear participant, kindly inform receiver to confirm your payment. Should receiver refuses to confirm your payment? Kindly upload your proof of payment.\r\nThanks', '', 'Apr 08, 2017 20:03:56'),
(125, '72', 'TERRA COLE ', 'Dear silvio, your request has been received, we wont be  able to resolve these issue if you fail to send your bank account statement. Hence, the system confirms payee after 72hours.', '', 'Apr 08, 2017 20:06:39'),
(126, '71', 'TERRA COLE ', 'Dear Ndubuisi ndubuilo, upload your proof of payment. Thanks, ', '', 'Apr 08, 2017 20:08:01'),
(127, '55', 'PAUL JOHNSON ', 'Dear Alonge adenike islamiyat, kindly upload your proof of payment on Monday so as to get these issue resolved THanks', '', 'Apr 08, 2017 20:10:31'),
(128, '76', 'TERRA COLE ', 'Dear participants, this occur when PH is greater than Ghost. ', '', 'Apr 09, 2017 07:06:26'),
(129, '77', 'KELVIN WOODS', 'Dear Mhiz millz, what exactly do you want?', '', 'Apr 09, 2017 07:39:00'),
(130, '76', 'LUKE HOWARD', 'Dear Emmatosh, I can see it has gotten to your turn. Do fulfill your pledge and invite your friends here.', '', 'Apr 09, 2017 07:45:07'),
(131, '70', 'JAMES PATTERSON', 'Dear Mr dotun, you provided help of N2,000. Your order was merged on the 05.04.2017 03:31PM which was not paid. \r\n\r\nDo inform receiver to refund your payment if you actually make the payment.\r\n\r\nThanks.', '', 'Apr 09, 2017 10:48:23'),
(132, '78', '69', 'i mean return inward notification disapear and no notification of merge on my dashboard..thanks', '', 'Apr 09, 2017 10:50:03'),
(133, '78', 'ERIC GERANEN', 'We are making a check on your account, please hold....', '', 'Apr 09, 2017 10:53:31'),
(134, '78', 'JAMES PATTERSON', 'Your issue has been resolved. Your fund has been credited back to your wallet.\r\n\r\nThanks.', '', 'Apr 09, 2017 10:56:23'),
(135, '52', 'MICHAEL ARMSTRONG', 'Dear Alonge adenike islamiyat, kindly upload your bank account statement starting from day of payment expectation till date.\r\n\r\nThanks', '', 'Apr 09, 2017 11:02:31'),
(136, '77', 'JAMES PATTERSON', 'Your request has been resolved. Thanks', '', 'Apr 09, 2017 13:17:53'),
(137, '78', '69', 'thanks ...i really appreciate\r\n', '', 'Apr 09, 2017 14:06:37'),
(138, '78', '69', 'thanks....but why not merge since yesterday morning...i think is up to 24hours', '', 'Apr 09, 2017 14:08:44'),
(139, '72', '10', 'The person doesnt want to pay', 'Screenshot_2017-04-09-16-35-06.png', 'Apr 09, 2017 15:36:27'),
(140, '78', 'ERIC GERANEN', 'Dear Asiru ayodele , once it gets to your turn, you will be merged.\r\n\r\nThanks', '', 'Apr 09, 2017 16:44:49'),
(141, '78', '69', 'thanks sir...i really appreciate', '', 'Apr 09, 2017 16:52:19'),
(142, '70', 'MICHEAL SMITH', 'Your request has been resolved', '', 'Apr 09, 2017 17:58:05'),
(143, '79', 'MICHEAL SMITH', 'your fund should be in your current wallet \r\n\r\nThanks ', '', 'Apr 10, 2017 01:40:57'),
(144, '80', 'KELVIN WOODS', 'Please note that whenever you are been merge on Friday, you have 72hours, during to bank not working on weekends. \r\n\r\nRemerging will be done once your time elapse.\r\n\r\nThanks ', '', 'Apr 10, 2017 01:43:37'),
(145, '72', 'MICHAEL ARMSTRONG', 'this shows your transactions in March only,.', '', 'Apr 10, 2017 01:47:55'),
(146, '83', 'ERIC GERANEN', 'All is working fine, once it gets to your turn, you get merged.\r\nThanks.', '', 'Apr 10, 2017 05:55:27'),
(147, '82', 'ERIC GERANEN', 'All is working fine, once it gets to your turn, you get merged.\r\nThanks.', '', 'Apr 10, 2017 05:56:04'),
(148, '73', '190', 'This is my proof of payment thank you support', 'IMG_20170405_210541.jpg', 'Apr 10, 2017 06:10:09'),
(149, '81', 'TERRA COLE ', 'Dear Rashy , Rayboy was merged to pay you. Endeavor to upload your bank account statement today else the system confirms the payment automatically.\r\n\r\nTHanks', '', 'Apr 10, 2017 06:44:01'),
(150, '84', 'JAMES PATTERSON', 'Dear mhiz b, your payment was confirmed. Kindly check your current wallet. Your fund is now active. Thanks', '', 'Apr 10, 2017 07:54:28'),
(151, '85', 'JAMES PATTERSON', 'We will get back to you soon...\r\n\r\nThanks ', '', 'Apr 10, 2017 08:59:29'),
(152, '85', 'JAMES PATTERSON', 'Dear Mayour22, The transaction with PH id: Z1111147977 was cancelled by You. Hence, you provided help of N2,000 to Seun with PH id: Z1141856415 which has been added to GH list. Do wait while your order gets merged.\r\n\r\nThanks.', '', 'Apr 10, 2017 10:38:42'),
(153, '75', 'ERIC GERANEN', 'Dear Holluphix, Kindly upload your bank account statement while sender (GBEMTOS1) should upload proof of payment within 48hours.', '', 'Apr 10, 2017 10:42:39'),
(154, '67', 'TERRA COLE ', 'Your request has been resolved. ', '', 'Apr 10, 2017 10:43:06'),
(155, '75', '92', 'The Admin,\r\nI Gbemtos1 was to paid my receiver but I called him more dan 22 times , sent him a text and there was no response. And I dnt wanted to be blocked so I just have to upload something, so if he got it, he will have to call me and we can talk better. Because dis has happen to me before I paid someone and I was not confirm and now my money was not refund to me up till dis moment. Thanks here are d proof of payment been uplolad. \r\nRegard,\r\nGbenga.', 'olowe%20olufemi.jpg', 'Apr 10, 2017 10:43:20'),
(156, '72', '96', '', 'Screenshot_20170410-120752.png', 'Apr 10, 2017 13:21:30'),
(157, '55', 'TERRA COLE ', 'Your request has been resolved.', '', 'Apr 10, 2017 19:17:11'),
(158, '87', 'PAUL JOHNSON ', 'Thanks for contacting us,  your request has been escalated to the appropriate department.\r\n\r\nThanks', '', 'Apr 10, 2017 21:48:30'),
(159, '86', '254', '', 'Screenshot_2017-04-08-06-24-57.png', 'Apr 11, 2017 04:52:47'),
(160, '89', 'MICHEAL SMITH', 'Your request has been resolved. Thanks.', '', 'Apr 11, 2017 07:15:20'),
(161, '58', '198', '', 'IMG-20170405-00427.png', 'Apr 11, 2017 08:08:22'),
(162, '90', 'MICHAEL ARMSTRONG', 'Due to low PH in the system and participant GHing without PHing back to the community,  we have resulted to PH to GH. PH any amount and get 200percent  of your new PH plus 100percent  of your old GH, to make 300percent  GH.\r\n\r\nFor instance: \r\nOustanding GH: N40,000\r\nNew PH: N10,000\r\n\r\nGet Help Order: N30,000 New PH x 300 percent \r\nOutstanding GH balance: N40,000 - N10, 000 = N30,000\r\n\r\nRecommitment is the Key.\r\n\r\nGivers are Receivers', '', 'Apr 11, 2017 09:46:17'),
(163, '88', 'MICHAEL ARMSTRONG', 'Due to low PH in the system and participant GHing without PHing back to the community,  we have resulted to PH to GH. PH any amount and get 200percent  of your new PH plus 100percent  of your old GH, to make 300percent  GH.\r\n\r\nFor instance: \r\nOustanding GH: N40,000\r\nNew PH: N10,000\r\n\r\nGet Help Order: N30,000 New PH x 300 percent \r\nOutstanding GH balance: N40,000 - N10, 000 = N30,000\r\n\r\nRecommitment is the Key.\r\n\r\nGivers are Receivers', '', 'Apr 11, 2017 09:46:47'),
(164, '91', 'JAMES PATTERSON', 'Your request has been resolved.', '', 'Apr 11, 2017 11:07:53'),
(165, '92', '100', 'This is my statement of account sir pls thanks for the quick responds', 'C360_2017-04-11-12-44-33-953.jpg', 'Apr 11, 2017 11:59:29'),
(166, '92', 'LUKE HOWARD', 'Dear Rashy, upload it to the ticket needed.  Thanks ', '', 'Apr 11, 2017 12:19:17'),
(167, '58', '100', 'Hello admin this is the statement of my account, the recipient uploaded a fake transfer statement. It is a typed SMS. Thanks', 'C360_2017-04-11-12-44-33-953.jpg', 'Apr 11, 2017 14:58:28'),
(168, '58', '100', 'Hello admin, the recipient (Rayboy) uploaded a fake typed SMS which is not including my real details, account number typed not complete. I called him but not picking it severally, he always threat me with a hidden number. Admin please kindly help me out. Attached is the statement of my account. Thanks.', 'C360_2017-04-11-12-44-33-953.jpg', 'Apr 11, 2017 15:14:39'),
(169, '94', 'ERIC GERANEN', 'Thanks for consulting us, your request has been forwarded to the appropriate department.', '', 'Apr 11, 2017 16:21:26'),
(170, '95', 'ELIAS MKALECH', 'Your request has been accepted for solution.', '', 'Apr 11, 2017 16:22:06'),
(171, '96', 'ELIAS MKALECH', 'Your request has been accepted for solution.', '', 'Apr 11, 2017 16:22:47'),
(172, '98', 'ELIAS MKALECH', 'Like we\'ve always said, No one is going to loose his or her fund.\r\n\r\nThanks.', '', 'Apr 11, 2017 20:04:36'),
(173, '93', 'PAUL JOHNSON ', 'Kindly upload your proof of payment to the ticket assigned for the issue.\r\n\r\nThanks', '', 'Apr 12, 2017 00:09:52'),
(174, '94', 'CAROLINE HELVEY', '\r\nKindly upload your bank account statement to the ticket assigned for the issue. Thanks	', '', 'Apr 12, 2017 00:11:16'),
(175, '93', '198', 'HERE IS PROOF OF PAYMENT', 'IMG-20170405-00427.jpg', 'Apr 12, 2017 08:43:40'),
(176, '93', 'ELIAS MKALECH', 'Dear Rayboy, since you make the payment through bank transfer, we hereby request for your bank account statement showing the transaction in details\r\n\r\nThanks.', '', 'Apr 12, 2017 14:20:35'),
(177, '73', 'ERIC GERANEN', 'Has issue been resolved?', '', 'Apr 12, 2017 14:21:42'),
(178, '58', 'TERRA COLE ', 'Dear Rayboy,We hereby request for your bank account statement within 24hours since payment was made through bank transfer.\r\n\r\nThanks', '', 'Apr 12, 2017 14:25:40'),
(179, '86', 'TERRA COLE ', 'Dear Tokskenny, we  hereby request for your bank account statement since you made a bank transfer while paying\r\n\r\nThanks.', '', 'Apr 12, 2017 14:28:00'),
(180, '58', '198', 'i threatened you with a hidden number?\r\nyou are a lier and a thief', '', 'Apr 13, 2017 10:39:33'),
(181, '102', '305', '', 'IMG_20170413_174533.jpg', 'Apr 13, 2017 16:45:56'),
(182, '102', '1', 'Charles, what is the meaning of all these? Admin abeg do something oooo', '', 'Apr 13, 2017 16:56:44'),
(183, '103', 'ERIC GERANEN', 'Your request has been accepted for solution. Thanks', '', 'Apr 13, 2017 19:33:10'),
(184, '101', 'MICHAEL ARMSTRONG', 'We will resolve your issue soonest. Thanks', '', 'Apr 13, 2017 19:34:18'),
(185, '99', 'MICHEAL SMITH', 'Participant are getting help without re-phing leaving the system into doubtness by participant. Hence, before you GH, you need to Re-PH and get 300% of your new PH. Thanks', '', 'Apr 13, 2017 19:35:49'),
(186, '100', 'MICHEAL SMITH', 'Do wait while receiver confirms your payment. Should receiver fails to confirm your payment, the system confirms the payment after 72hours except it was flag as fake. Thanks', '', 'Apr 13, 2017 19:37:08'),
(187, '101', '121', 'Thanks I will be so much glad. Here is d detail of d payment. ', 'seun%20o%20gc.jpg', 'Apr 13, 2017 20:12:54'),
(188, '58', '100', 'The is my statement ', 'C360_2017-04-11-12-44-33-953.jpg', 'Apr 14, 2017 05:31:04'),
(189, '106', 'KELVIN WOODS', 'Once the time elapse, you will be re-merged.\r\n\r\nThanks.', '', 'Apr 14, 2017 07:58:38'),
(190, '105', '226', 'this person didnt pay when called he said he did not no anything about givers cycler pls help ooo', '2.jpeg', 'Apr 14, 2017 10:30:58'),
(191, '104', '226', 'fund not received the say i called the wrong person', '1.jpeg', 'Apr 14, 2017 10:33:06'),
(192, '107', 'ERIC GERANEN', 'While the merging was on, your new PH was in your wallet, once a new set of merge comes on, you get merged for the remaining balance.\r\n\r\nThanks', '', 'Apr 14, 2017 14:40:04'),
(193, '99', '69', 'but have already ph and paid the person since lastweek but i never GH back since then and they said i should re PH..how would collect the outstanding own now.please', '', 'Apr 14, 2017 17:22:34'),
(194, '108', 'PAUL JOHNSON ', 'Kindly inform receiver to confirm your payment. Thanks', '', 'Apr 15, 2017 13:01:25'),
(195, '112', 'MICHAEL ARMSTRONG', 'Dear Smarty, Kindly click on FAKE POP if payment was not received. Should  you fail to flag payment, the system confirms the payment on your behalf.\r\n\r\nThanks.', '', 'Apr 15, 2017 13:02:40'),
(196, '58', 'TERRA COLE ', 'Dear sender, should you fail to upload proof of paymen within 48hours, these issue will be resolved. Thanks.', '', 'Apr 15, 2017 13:07:49'),
(197, '114', '148', 'Please check the debit alert the bank sent to me and tell the receiver to confirm my payment or do something about his bank.', 'Screenshot_2017-04-13-16-21-58~2.png', 'Apr 16, 2017 19:43:07'),
(198, '118', 'ELIAS MKALECH', 'Dear participant, once the time elapse, you will be re-merged. What was his response?', '', 'Apr 17, 2017 13:08:42'),
(199, '117', 'PAUL JOHNSON ', 'Your request has been escalated to the appropriate department.\r\n\r\nThanks', '', 'Apr 17, 2017 19:18:04'),
(200, '104', 'KELVIN WOODS', 'Your request has been resolved.\r\n\r\nThanks.', '', 'Apr 17, 2017 19:20:06'),
(201, '105', 'ELIAS MKALECH', 'Your request has been resolved.\r\n\r\nThanks.', '', 'Apr 17, 2017 19:20:58'),
(202, '119', 'ELIAS MKALECH', 'Your request has been resolved. Thanks', '', 'Apr 18, 2017 05:36:05'),
(203, '114', '148', 'When will you address this matter?', '', 'Apr 18, 2017 20:45:55'),
(204, '114', '8', 'Nothing was deposited to my account', 'bank statement.pdf', 'Apr 19, 2017 01:57:48'),
(205, '110', '232', 'Nothing was deposited to my account', 'bank statement.pdf', 'Apr 19, 2017 02:03:36'),
(206, '114', 'ELIAS MKALECH', 'Dear participant,\r\nFollowing condition should be put in place.\r\n\r\nSince payment was made through transfer, upload your bank account statement. According to the bank account, receiver didn\'t receive payment.\r\n\r\nThanks.\r\n', '', 'Apr 19, 2017 07:01:35'),
(207, '114', '148', '', 'Screenshot_2017-04-19-08-52-04.png', 'Apr 19, 2017 07:53:36'),
(208, '114', '148', '', 'Screenshot_2017-04-19-08-52-17.png', 'Apr 19, 2017 07:54:14'),
(209, '121', 'KELVIN WOODS', 'You were merged to pay a participant which you did not fulfil your pledge.  Are you ready to abide with the rules and regulations of Giverscycler? ', '', 'Apr 19, 2017 17:27:59'),
(210, '114', 'PAUL JOHNSON ', 'Dear participant, we need your bank account statement.\r\n\r\nThanks.', '', 'Apr 19, 2017 17:32:19'),
(211, '116', '126', 'the nigga pay me ', 'Screenshot_2017-04-19-14-20-01.png', 'Apr 19, 2017 18:21:42'),
(212, '114', '148', '', 'Screenshot_2017-04-19-22-42-29.png', 'Apr 19, 2017 21:44:29'),
(213, '114', '148', '', 'Screenshot_2017-04-19-22-42-42.png', 'Apr 19, 2017 21:45:18'),
(214, '114', '148', '', 'Screenshot_2017-04-19-22-43-14.png', 'Apr 19, 2017 21:46:07'),
(215, '114', '148', '', 'Screenshot_2017-04-19-22-43-37.png', 'Apr 19, 2017 21:46:53'),
(216, '122', 'JAMES PATTERSON', 'Your request has been resolved. Thanks.', '', 'Apr 20, 2017 12:41:38'),
(217, '121', '257', 'Yes i will obey by the rules', '', 'Apr 20, 2017 20:48:58'),
(218, '121', 'MICHAEL ARMSTRONG', 'Your request has been accepted for solution ', '', 'Apr 21, 2017 06:47:04'),
(219, '114', '148', 'You are yet to resolve the issue', '', 'Apr 21, 2017 09:21:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankaccount`
--
ALTER TABLE `bankaccount`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `downline`
--
ALTER TABLE `downline`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `executive`
--
ALTER TABLE `executive`
  ADD PRIMARY KEY (`executive_id`);

--
-- Indexes for table `firstlogin`
--
ALTER TABLE `firstlogin`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `forumreply`
--
ALTER TABLE `forumreply`
  ADD PRIMARY KEY (`replyid`);

--
-- Indexes for table `forumtopics`
--
ALTER TABLE `forumtopics`
  ADD PRIMARY KEY (`topicid`);

--
-- Indexes for table `gethelp`
--
ALTER TABLE `gethelp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `leftover`
--
ALTER TABLE `leftover`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leftover_admin`
--
ALTER TABLE `leftover_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merge_gh`
--
ALTER TABLE `merge_gh`
  ADD PRIMARY KEY (`mergeID`);

--
-- Indexes for table `newslogged`
--
ALTER TABLE `newslogged`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `newsupdate`
--
ALTER TABLE `newsupdate`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `providehelp`
--
ALTER TABLE `providehelp`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`RID`);

--
-- Indexes for table `relatedissue`
--
ALTER TABLE `relatedissue`
  ADD PRIMARY KEY (`issueid`);

--
-- Indexes for table `reply_admin`
--
ALTER TABLE `reply_admin`
  ADD PRIMARY KEY (`replyadmin_id`);

--
-- Indexes for table `reset_verify`
--
ALTER TABLE `reset_verify`
  ADD PRIMARY KEY (`resetid`);

--
-- Indexes for table `testimonies`
--
ALTER TABLE `testimonies`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`replyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bankaccount`
--
ALTER TABLE `bankaccount`
  MODIFY `bid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT for table `downline`
--
ALTER TABLE `downline`
  MODIFY `d_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `executive`
--
ALTER TABLE `executive`
  MODIFY `executive_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `firstlogin`
--
ALTER TABLE `firstlogin`
  MODIFY `logid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;
--
-- AUTO_INCREMENT for table `forumreply`
--
ALTER TABLE `forumreply`
  MODIFY `replyid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `forumtopics`
--
ALTER TABLE `forumtopics`
  MODIFY `topicid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gethelp`
--
ALTER TABLE `gethelp`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `leftover`
--
ALTER TABLE `leftover`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `leftover_admin`
--
ALTER TABLE `leftover_admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `merge_gh`
--
ALTER TABLE `merge_gh`
  MODIFY `mergeID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `newslogged`
--
ALTER TABLE `newslogged`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsupdate`
--
ALTER TABLE `newsupdate`
  MODIFY `news_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `pid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
--
-- AUTO_INCREMENT for table `providehelp`
--
ALTER TABLE `providehelp`
  MODIFY `ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `referral`
--
ALTER TABLE `referral`
  MODIFY `RID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `relatedissue`
--
ALTER TABLE `relatedissue`
  MODIFY `issueid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `reply_admin`
--
ALTER TABLE `reply_admin`
  MODIFY `replyadmin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reset_verify`
--
ALTER TABLE `reset_verify`
  MODIFY `resetid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `testimonies`
--
ALTER TABLE `testimonies`
  MODIFY `testimonial_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `tid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `replyid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
