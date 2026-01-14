-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2026 at 01:14 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topmate1`
--

-- --------------------------------------------------------

--
-- Table structure for table `airtime`
--

CREATE TABLE `airtime` (
  `aId` int NOT NULL,
  `aNetwork` varchar(10) NOT NULL,
  `aBuyDiscount` float NOT NULL DEFAULT '96',
  `aUserDiscount` float NOT NULL,
  `aAgentDiscount` float NOT NULL,
  `aVendorDiscount` float NOT NULL,
  `aType` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airtime`
--

INSERT INTO `airtime` (`aId`, `aNetwork`, `aBuyDiscount`, `aUserDiscount`, `aAgentDiscount`, `aVendorDiscount`, `aType`) VALUES
(1, '1', 97.3, 98, 98, 97.4, 'VTU'),
(2, '2', 94.1, 97, 97, 94.5, 'VTU'),
(3, '3', 94.9, 97, 97, 95.2, 'VTU'),
(4, '4', 97.1, 98, 97.5, 97.3, 'VTU'),
(5, '1', 95, 97.5, 97, 97.5, 'Share And Sell'),
(6, '2', 94, 97, 96, 95.5, 'Share And Sell'),
(7, '3', 95, 97, 97, 96, 'Share And Sell'),
(8, '4', 97, 98, 98, 97.5, 'Share And Sell');

-- --------------------------------------------------------

--
-- Table structure for table `airtimepin`
--

CREATE TABLE `airtimepin` (
  `aId` int NOT NULL,
  `planid` varchar(10) NOT NULL,
  `aNetwork` varchar(10) NOT NULL,
  `planSize` varchar(10) NOT NULL,
  `aBuyPrice` float NOT NULL,
  `aUserPrice` float NOT NULL,
  `aAgentPrice` float NOT NULL,
  `aVendorPrice` float NOT NULL,
  `aDealerPrice` float NOT NULL,
  `loadpin` varchar(20) NOT NULL DEFAULT '*311*',
  `checkbalance` varchar(20) NOT NULL DEFAULT '*310#'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airtimepin`
--

INSERT INTO `airtimepin` (`aId`, `planid`, `aNetwork`, `planSize`, `aBuyPrice`, `aUserPrice`, `aAgentPrice`, `aVendorPrice`, `aDealerPrice`, `loadpin`, `checkbalance`) VALUES
(1, '2', '1', '100', 99, 100, 98, 98, 99, '*311*Pin#', '*310#'),
(2, '2', '1', '200', 195, 198, 198, 198, 197, '*311*', '*310#'),
(3, '3', '1', '500', 487.8, 495, 494, 492, 492, '*311*', '*310#'),
(4, '11', '1', '1000', 976, 994, 990, 985, 0, '*311*', '*310#'),
(145, '7', '3', '100', 97, 98, 98, 97.5, 0, '*311*pin#', '*310#'),
(146, '8', '3', '200', 195, 197, 196.8, 196.5, 0, '*311*pin#', '*310#'),
(147, '9', '3', '500', 492, 495, 492.6, 492.5, 0, '*310*Pin#', '*310#'),
(148, '13', '3', '1000', 970, 975, 973, 972, 0, '*311*Pin#', '*310#'),
(149, '14', '4', '100', 97, 98, 97.6, 97.5, 0, '*311*Pin#', '*310#'),
(150, '15', '4', '200', 196, 198, 197, 196.8, 0, '*311*Pin#', '*310#'),
(151, '16', '4', '500', 485, 490, 487, 486, 0, '*311*Pin#', '*310#'),
(152, '17', '4', '1000', 970, 990, 980, 975.5, 0, '*311*Pin#', '*310#'),
(153, '2', '2', '100', 97.5, 98, 97.5, 97.5, 0, '*311*Pin#', '*310#'),
(154, '5', '2', '200', 195, 197, 196, 196, 0, '*311*Pin #', '*310#'),
(155, '6', '2', '500', 485, 495, 492, 491, 0, '*311*Pin#', '*310#'),
(156, '12', '2', '1000', 985, 990, 988, 987, 0, '*311*Pin#', '*310#');

-- --------------------------------------------------------

--
-- Table structure for table `airtimepinprice`
--

CREATE TABLE `airtimepinprice` (
  `aId` int NOT NULL,
  `aNetwork` varchar(10) NOT NULL,
  `aUserDiscount` float NOT NULL,
  `aAgentDiscount` float NOT NULL,
  `aVendorDiscount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airtimepinprice`
--

INSERT INTO `airtimepinprice` (`aId`, `aNetwork`, `aUserDiscount`, `aAgentDiscount`, `aVendorDiscount`) VALUES
(1, '1', 99, 98, 97),
(2, '2', 99, 98, 97),
(3, '3', 99, 98, 97),
(4, '4', 99, 98, 97);

-- --------------------------------------------------------

--
-- Table structure for table `airtimepinstock`
--

CREATE TABLE `airtimepinstock` (
  `tId` int NOT NULL,
  `network` varchar(10) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `serial` text NOT NULL,
  `tokens` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `soldto` varchar(200) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `airtimetokens`
--

CREATE TABLE `airtimetokens` (
  `tId` int NOT NULL,
  `sId` int NOT NULL,
  `tRef` varchar(255) NOT NULL,
  `business` varchar(30) NOT NULL,
  `network` varchar(10) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `loadpin` varchar(30) DEFAULT NULL,
  `checkbalance` varchar(30) DEFAULT NULL,
  `quantity` int NOT NULL,
  `serial` text NOT NULL,
  `tokens` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airtimetokens`
--

INSERT INTO `airtimetokens` (`tId`, `sId`, `tRef`, `business`, `network`, `amount`, `loadpin`, `checkbalance`, `quantity`, `serial`, `tokens`, `date`) VALUES
(1, 182, 'AIRTIMEPIN842_23291716210069', 'Databservices', 'GLO', '100', '*311*', '*310#', 1, '4999983077204698', '496383698853943', '2024-05-20 14:01:39'),
(2, 182, 'AIRTIMEPIN178_80151718809840', 'Datab', 'GLO', '100', '*311*', '*310#', 1, '20681390396075159989', '1859873254718095', '2024-06-19 16:11:19'),
(3, 182, 'AIRTIMEPIN825_18251718809987', 'Datab', 'GLO', '100', '*311*', '*310#', 1, '20681390406075160009', '1759544593454421', '2024-06-19 16:13:30'),
(4, 182, 'AIRTIMEPIN828_53791719641127', 'Datab ', 'MTN', '200', '*311*', '*310#', 1, '00000025492479893', '32928147794835884', '2024-06-29 07:06:05'),
(5, 182, 'AIRTIMEPIN212_68061721504050', 'Databservices', 'MTN', '200', '*311*', '*310#', 1, '00000028139231687', '52308667705160643', '2024-07-20 20:34:47'),
(6, 182, 'AIRTIMEPIN637_67201721598340', 'Datab', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000028462171187', '62718457542355310', '2024-07-21 22:46:27'),
(7, 182, 'AIRTIMEPIN301_93481721598507', 'Data', 'AIRTEL', '100', '*311*Pin#', '*310#', 1, '20687149089141333680', '1772878663517537', '2024-07-21 22:49:01'),
(8, 182, 'AIRTIMEPIN519_74461721719854', 'Datab', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000028462397737', '72748965462877207', '2024-07-23 08:31:22'),
(9, 182, 'AIRTIMEPIN553_59151721719962', 'Databservices ', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000028462397652', '02984465109336857', '2024-07-23 08:33:08'),
(10, 256, 'AIRTIMEPIN799_34151722695285', 'PAID NG', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000028462172740', '33248982198166105', '2024-08-03 15:28:46'),
(11, 182, 'AIRTIMEPIN268_10991724078620', 'Databservices', 'MTN', '200', '*311*', '*310#', 1, '00000029571062632', '24603426056080827', '2024-08-19 15:44:01'),
(12, 219, 'AIRTIMEPIN952_93861724497255', 'Jess', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000029559817728', '98654277678439641', '2024-08-24 12:01:26'),
(13, 182, 'AIRTIMEPIN907_82491724766974', 'Datab', 'MTN', '500', '*311*', '*310#', 1, '00000028571768410', '13087177218717260', '2024-08-27 14:56:38'),
(14, 182, 'AIRTIMEPIN947_42681725256184', 'Databservices ', 'MTN', '200', '*311*', '*310#', 1, '00000028708431121', '62732070864920042', '2024-09-02 06:50:07'),
(15, 67, 'AIRTIMEPIN343_97971733529879', 'Good', 'GLO', '100', '*311*pin#', '*310#', 1, '5199983465600383', '511413001385914', '2024-12-07 01:05:16'),
(16, 67, 'AIRTIMEPIN494_40931733622304', 'Datab', 'MTN', '100', '*311*Pin#', '*310#', 1, ' 00000030066341515 ', ' 47292439101001144 ', '2024-12-08 02:45:46'),
(17, 58, 'AIRTIMEPIN959_22851735112917', 'Databservices ', 'MTN', '200', '*311*', '*310#', 1, ' 00000030657073188 ', ' 55937179189828600 ', '2024-12-25 08:48:57'),
(18, 96, 'AIRTIMEPIN672_62891735510936', 'Mtn', 'MTN', '100', '*311*Pin#', '*310#', 1, ' 00000030306739215 ', ' 88974348251083383 ', '2024-12-29 23:23:19'),
(19, 104, 'AIRTIMEPIN235_75341738670769', 'Datab', 'GLO', '100', '*311*pin#', '*310#', 1, '5199983473600625', '514223848652823', '2025-02-04 13:07:09'),
(20, 9, 'AIRTIMEPIN645_98571739551204', 'Wosman', 'MTN', '200', '*311*', '*310#', 1, ' 00000021257665698 ', ' 10958464874433225 ', '2025-02-14 17:41:03'),
(21, 9, 'AIRTIMEPIN883_65371739551495', 'Wosman', 'MTN', '100', '*311*Pin#', '*310#', 1, ' 00000031004686808 ', ' 19722913240778416 ', '2025-02-14 17:45:20'),
(22, 132, 'AIRTIMEPIN464_42341750060215', 'Databservices', 'MTN', '100', '*311*Pin#', '*310#', 1, '00000033731990572', '57903022168459836', '2025-06-16 08:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `alphatopupprice`
--

CREATE TABLE `alphatopupprice` (
  `alphaId` int NOT NULL,
  `buyingPrice` int NOT NULL,
  `sellingPrice` int NOT NULL,
  `agent` int NOT NULL,
  `vendor` int NOT NULL,
  `dPosted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `apiconfigs`
--

CREATE TABLE `apiconfigs` (
  `aId` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `updateOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apiconfigs`
--

INSERT INTO `apiconfigs` (`aId`, `name`, `value`, `updateOn`) VALUES
(1, 'monifyCharges', '2', '2024-12-05 22:01:47'),
(2, 'monifyApi', 'MK_P', '2024-12-05 22:01:47'),
(3, 'monifySecrete', '#', '2024-12-05 22:01:47'),
(4, 'monifyContract', '#', '2024-12-05 22:01:47'),
(5, 'monifyWeStatus', 'On', '2024-12-05 22:01:47'),
(6, 'monifyMoStatus', 'On', '2024-12-05 22:01:47'),
(7, 'monifyFeStatus', 'On', '2024-12-05 22:01:47'),
(8, 'monifySaStatus', 'On', '2024-12-05 22:01:47'),
(9, 'monifyStatus', 'Off', '2024-12-05 22:01:47'),
(10, 'paystackCharges', '0.5', '2024-12-05 22:01:47'),
(11, 'paystackApi', '#', '2024-12-05 22:01:47'),
(12, 'paystackStatus', 'Off', '2024-12-05 22:01:47'),
(13, 'mtnVtuKey', 'username:password', '2024-12-05 22:01:47'),
(14, 'mtnVtuProvider', 'https://www.api.ringo.ng/api/agent/p2', '2024-12-05 22:01:47'),
(15, 'mtnSharesellKey', '#', '2024-12-05 22:01:47'),
(16, 'mtnSharesellProvider', 'https://autopilotng.com/api/live/v1/airtime', '2024-12-05 22:01:47'),
(17, 'airtelVtuKey', '#', '2024-12-05 22:01:47'),
(18, 'airtelVtuProvider', 'https://autopilotng.com/api/live/v1/airtime', '2024-12-05 22:01:47'),
(19, 'airtelSharesellKey', '#', '2024-12-05 22:01:47'),
(20, 'airtelSharesellProvider', 'https://alrahuzdata.com.ng/api/topup/', '2024-12-05 22:01:47'),
(21, 'gloVtuKey', '#', '2024-12-05 22:01:47'),
(22, 'gloVtuProvider', 'https://autopilotng.com/api/live/v1/airtime', '2024-12-05 22:01:47'),
(23, 'gloSharesellKey', '#', '2024-12-05 22:01:47'),
(24, 'gloSharesellProvider', 'https://alrahuzdata.com.ng/api/topup/', '2024-12-05 22:01:47'),
(25, '9mobileVtuKey', '#', '2024-12-05 22:01:47'),
(26, '9mobileVtuProvider', 'https://autopilotng.com/api/live/v1/airtime', '2024-12-05 22:01:47'),
(27, '9mobileSharesellKey', '#', '2024-12-05 22:01:47'),
(28, '9mobileSharesellProvider', 'https://alrahuzdata.com.ng/api/topup/', '2024-12-05 22:01:47'),
(29, 'mtnSmeApi', '#', '2024-12-05 22:01:47'),
(30, 'mtnSmeProvider', 'https://smeplug.ng/api/v1/data/purchase', '2024-12-05 22:01:47'),
(31, 'mtnGiftingApi', '#', '2024-12-05 22:01:47'),
(32, 'mtnGiftingProvider', 'https://smeplug.ng/api/v1/data/purchase', '2024-12-05 22:01:47'),
(33, 'mtnCorporateApi', '#', '2024-12-05 22:01:47'),
(34, 'mtnCorporateProvider', 'https://rossytechs.com/api/data/', '2024-12-05 22:01:47'),
(35, 'airtelSmeApi', '#', '2024-12-05 22:01:47'),
(36, 'airtelSmeProvider', 'https://www.gladtidingsdata.com/api/data/', '2024-12-05 22:01:47'),
(37, 'airtelGiftingApi', '#', '2024-12-05 22:01:47'),
(38, 'airtelGiftingProvider', 'https://smeplug.ng/api/v1/data/purchase', '2024-12-05 22:01:47'),
(39, 'airtelCorporateApi', '#', '2024-12-05 22:01:47'),
(40, 'airtelCorporateProvider', 'https://rbsdataapi.com.ng/api/data', '2024-12-05 22:01:47'),
(41, 'gloSmeApi', '#', '2024-12-05 22:01:47'),
(42, 'gloSmeProvider', 'https://smeplug.ng/api/v1/data/purchase', '2024-12-05 22:01:47'),
(43, 'gloGiftingApi', '#', '2024-12-05 22:01:47'),
(44, 'gloGiftingProvider', 'https://smeplug.ng/api/v1/data/purchase', '2024-12-05 22:01:47'),
(45, 'gloCorporateApi', '#', '2024-12-05 22:01:47'),
(46, 'gloCorporateProvider', 'https://www.gladtidingsdata.com/api/data/', '2024-12-05 22:01:47'),
(47, '9mobileSmeApi', '#', '2024-12-05 22:01:47'),
(48, '9mobileSmeProvider', 'https://datastationapi.com/api/data/', '2024-12-05 22:01:47'),
(49, '9mobileGiftingApi', '#', '2024-12-05 22:01:47'),
(50, '9mobileGiftingProvider', 'https://autopilotng.com/api/live/v1/data', '2024-12-05 22:01:47'),
(51, '9mobileCorporateApi', '#', '2024-12-05 22:01:47'),
(52, '9mobileCorporateProvider', 'https://dataplus.ng/api/data/', '2024-12-05 22:01:47'),
(53, 'cableVerificationApi', '6700924ee9eff8dda2f6e39750e8a44d99662b37', '2024-12-05 22:01:47'),
(54, 'cableVerificationProvider', 'https://alrahuzdata.com.ng/api/validateiuc', '2024-12-05 22:01:47'),
(55, 'cableApi', 'dfc0e600a50ff504df72c6f47682f80bf31cec32', '2024-12-05 22:01:47'),
(56, 'cableProvider', 'https://alrahuzdata.com.ng/api/cablesub/', '2024-12-05 22:01:47'),
(57, 'meterVerificationApi', 'TG9yZHJhdmVuOm15b3duZGV5bmE=', '2024-12-05 22:01:47'),
(58, 'meterVerificationProvider', 'https://legitdataway.com/api/bill/bill-validation', '2024-12-05 22:01:47'),
(59, 'meterApi', 'dfc0e600a50ff504df72c6f47682f80bf31cec32', '2024-12-05 22:01:47'),
(60, 'meterProvider', 'https://alrahuzdata.com.ng/api/billpayment/', '2024-12-05 22:01:47'),
(61, 'examApi', 'TG9yZHJhdmVuOm15b3duZGV5bmE=', '2024-12-05 22:01:47'),
(62, 'examProvider', 'https://legitdataway.com/api/exam', '2024-12-05 22:01:47'),
(63, 'rechargePinApi', '1763|C8oztbiRbVHXo5s9AheiAvu6pATRNJ4NgDflJY4O2b070485', '2024-12-05 22:01:47'),
(64, 'rechargePinProvider', 'https://eccdcsub.com.ng/api/rechargepin/', '2024-12-05 22:01:47'),
(65, 'walletOneApi', '#', '2024-12-05 22:01:47'),
(66, 'walletOneProvider', 'https://autopilotng.com/api/live/v1/load/wallet-balance', '2024-12-05 22:01:47'),
(67, 'walletOneProviderName', 'Autopilot Simhosting', '2024-12-05 22:01:47'),
(68, 'walletTwoApi', '#', '2024-12-05 22:01:47'),
(69, 'walletTwoProvider', 'https://www.gladtidingsdata.com/api/user/', '2024-12-05 22:01:47'),
(70, 'walletTwoProviderName', 'Dataplus', '2024-12-05 22:01:47'),
(71, 'walletThreeApi', '#', '2024-12-05 22:01:47'),
(72, 'walletThreeProvider', 'https://legitdataway.com/api/user/', '2024-12-05 22:01:47'),
(73, 'walletThreeProviderName', 'Legitdataway', '2024-12-05 22:01:47'),
(74, 'walletFourApi', '#', '2024-12-05 22:01:47'),
(75, 'walletFourProvider', 'https://rbsdataapi.com.ng/api/user', '2024-12-05 22:01:47'),
(76, 'walletFourProviderName', 'Rbsdataapi', '2024-12-05 22:01:47'),
(77, 'walletFiveApi', '#', '2024-12-05 22:01:47'),
(78, 'walletFiveProvider', 'https://zkydata.com/api/user/', '2024-12-05 22:01:47'),
(79, 'walletFiveProviderName', 'Zkydata', '2024-12-05 22:01:47'),
(80, 'walletSixApi', '#', '2024-12-05 22:01:47'),
(81, 'walletSixProvider', 'https://alrahuzdata.com.ng/api/user/', '2024-12-05 22:01:47'),
(82, 'walletSixProviderName', 'Arahuzdata', '2024-12-05 22:01:47'),
(83, 'dataPinApi', '', '2024-12-05 22:01:47'),
(84, 'dataPinProvider', 'https://legitdataway.com/api/data_card', '2024-12-05 22:01:47'),
(85, 'alphaApi', '', '2024-12-05 22:01:47'),
(86, 'alphaProvider', '', '2024-12-05 22:01:47'),
(87, 'kudaEmail', '', '2024-12-05 22:01:47'),
(88, 'kudaApi', '', '2024-12-05 22:01:47'),
(89, 'kudaWebhookUser', '', '2024-12-05 22:01:47'),
(90, 'kudaWebhookPass', '', '2024-12-05 22:01:47'),
(91, 'kudaChargesType', 'per', '2024-12-05 22:01:47'),
(92, 'kudaCharges', '10', '2024-12-05 22:01:47'),
(93, 'kudaStatus', 'Off', '2024-12-05 22:01:47'),
(94, 'monifyGtStatus', 'Off', '2024-12-05 22:01:47'),
(95, 'airtime2cashstatus', 'Off', '2024-12-05 22:01:47'),
(96, 'airtime2cashmtnno', '09011111111', '2024-12-05 22:01:47'),
(97, 'airtime2cashmtnrate', '80', '2024-12-05 22:01:47'),
(98, 'airtime2cashairtelno', '09011111111', '2024-12-05 22:01:47'),
(99, 'airtime2cashairtelrate', '80', '2024-12-05 22:01:47'),
(100, 'airtime2cashglono', '09011111111', '2024-12-05 22:01:47'),
(101, 'airtime2cashglorate', '80', '2024-12-05 22:01:47'),
(102, 'airtime2cash9mobileno', '09011111111', '2024-12-05 22:01:47'),
(103, 'airtime2cash9mobilerate', '80', '2024-12-05 22:01:47'),
(104, 'payvesselStatus', 'Off', '2024-12-05 22:01:47'),
(105, 'payvesselSecret', '#', '2024-12-05 22:01:47'),
(106, 'payvesselApiKey', '#', '2024-12-05 22:01:47'),
(107, 'payvesselBusinessId', '#', '2024-12-05 22:01:47'),
(108, 'payvesselCharges', '1.1', '2024-12-05 22:01:47'),
(109, 'payvesselChargesType', 'per', '2024-12-05 22:01:47'),
(110, 'payvesselStatus', 'Off', '2024-12-05 22:01:47'),
(111, 'payvesselSecret', '#', '2024-12-05 22:01:47'),
(112, 'payvesselApiKey', '#', '2024-12-05 22:01:47'),
(113, 'payvesselBusinessId', '#', '2024-12-05 22:01:47'),
(114, 'payvesselCharges', '1.1', '2024-12-05 22:01:47'),
(115, 'payvesselChargesType', 'per', '2024-12-05 22:01:47'),
(116, '9mobileVtuProvider', 'https://autopilotng.com/api/live/v1/airtime', '2024-12-05 22:01:47'),
(117, 'mtnSme2Api', '#', '2024-12-05 22:01:47'),
(118, 'mtnSme2Provider', 'https://www.gladtidingsdata.com/api/data/', '2024-12-05 22:01:47'),
(119, 'gloSme2Api', '#', '2024-12-05 22:01:47'),
(120, 'gloSme2Provider', 'https://masuddatasub.com/api/data/', '2024-12-05 22:01:47'),
(121, 'airtelSme2Api', '#', '2024-12-05 22:01:47'),
(122, 'airtelSme2Provider', 'https://dataplus.ng/api/data/', '2024-12-05 22:01:47'),
(123, '9mobileSme2Api', '#', '2024-12-05 22:01:47'),
(124, '9mobileSme2Provider', 'https://strongmb.ng/api/v1/data/', '2024-12-05 22:01:47'),
(125, 'rechargePinMethod', 'EXTERNAL', '2024-12-05 22:01:47'),
(126, 'dataPinMethod', 'INTERNAL', '2024-12-05 22:01:47'),
(127, 'billstackPublicKey', '#', '2024-12-05 22:01:47'),
(128, 'billstackSecretKey', '#', '2024-12-05 22:01:47'),
(129, 'billstackCharges', '1', '2024-12-05 22:01:47'),
(130, 'billstackStatus', 'Off', '2024-12-05 22:01:47'),
(131, 'billstack9PSBStatus', 'Off', '2024-12-05 22:01:47'),
(132, 'billstackSHStatus', 'Off', '2024-12-05 22:01:47'),
(133, 'billstackBanklyStatus', 'Off', '2024-12-05 22:01:47'),
(134, 'billstackChargesType', 'per', '2024-12-05 22:01:47'),
(135, 'mtnCouponProvider', 'https://rbsdataapi.com.ng/api/data', '2024-12-05 22:01:47'),
(136, 'mtnCouponApi', '#', '2024-12-05 22:01:47'),
(137, 'gloCouponProvider', 'https://www.gladtidingsdata.com/api/data/', '2024-12-05 22:01:47'),
(138, 'gloCouponApi', '#', '2024-12-05 22:01:47'),
(139, 'airtelCouponProvider', 'https://autopilotng.com/api/live/v1/data', '2024-12-05 22:01:47'),
(140, 'airtelCouponApi', '#', '2024-12-05 22:01:47'),
(141, '9mobileCouponProvider', 'https://kvdataapi.net/api/data/', '2024-12-05 22:01:47'),
(142, '9mobileCouponApi', '#', '2024-12-05 22:01:47'),
(143, 'mtndataProvider', 'https://masuddatasub.com/api/data/', '2024-12-05 22:01:47'),
(144, 'mtndataApi', '#', '2024-12-05 22:01:47'),
(147, 'banklyStatus', 'Off', '2024-12-05 22:01:47'),
(148, 'strowalletChargesType', 'per', '2024-12-05 22:01:47'),
(149, 'strowalletCharges', '0', '2024-12-05 22:01:47'),
(150, 'strowalletBanklyUrl', 'https://strowallet.com/api/virtual-bank/bankly', '2024-12-05 22:01:47'),
(151, 'strowalletPublicKey', '#', '2024-12-05 22:01:47'),
(152, 'strowalletSafehavenUrl', 'https://strowallet.com/api/virtual-bank/safehaven', '2024-12-05 22:01:47'),
(153, 'strowalletPagaUrl', 'https://strowallet.com/api/virtual-bank/paga', '2024-12-05 22:01:47'),
(154, 'safehavenStatus', 'Off', '2024-12-05 22:01:47'),
(155, 'pagaStatus', 'Off', '2024-12-05 22:01:47'),
(156, 'strowalletWebhookUrl', 'https://app.databservices.com.ng/webhook/strowallet/index.php', '2024-12-05 22:01:47'),
(157, 'strowalletStatus', 'Off', '2024-12-05 22:01:47'),
(158, 'billstackPalmpayStatus', 'On', '2024-12-05 22:01:47'),
(159, 'asfiyChargesType', 'per', '2024-12-05 22:01:47'),
(160, 'asfiyCharges', '1', '2024-12-05 22:01:47'),
(161, 'asfiyStatus', 'On', '2024-12-05 22:01:47'),
(162, 'asfiyWebhook', 'https://app.databservices.com.ng/webhook/aspfiy/index.php', '2024-12-05 22:01:47'),
(163, 'asfiyApi', '#', '2024-12-05 22:01:47'),
(164, 'bellbankChargesType', 'per', '2025-03-09 16:01:58'),
(165, 'bellbankStatus', 'Off', '2025-03-09 16:01:58'),
(166, 'bellbankApiToken', '#', '2025-03-09 16:01:58'),
(167, 'bellbankCharges', '25', '2025-03-09 16:01:58'),
(169, 'glodataProvider', 'https://smeplug.ng/api/v1/data/purchase', '2025-04-12 11:47:39'),
(170, 'airteldataProvider', 'https://alrahuzdata.com.ng/api/data/', '2025-04-12 11:47:39'),
(171, 'glodataApi', '#', '2025-04-12 11:47:39'),
(172, 'airteldataApi', '#', '2025-04-12 11:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `apilinks`
--

CREATE TABLE `apilinks` (
  `aId` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apilinks`
--

INSERT INTO `apilinks` (`aId`, `name`, `value`, `type`) VALUES
(1, 'Datamoresub', 'https://datamoresub.com/api/user/', 'Wallet'),
(2, 'Datamoresub', 'https://datamoresub.com/api/topup/', 'Airtime'),
(3, 'Datamoresub', 'https://datamoresub.com/api/data', 'Data'),
(4, 'Datamoresub', 'https://datamoresub.com/api/cable/cable-validation?iuc=12345555&cable=1', 'CableVer'),
(5, 'Datamoresub', 'https://datamoresub.com/api/cable', 'Cable'),
(6, 'Datamoresub', 'https://datamoresub.com/api/electricity/verify/', 'ElectricityVer'),
(7, 'Datamoresub', 'https://datamoresub.com/api/electricity/', 'Electricity'),
(8, 'Datamoresub', 'https://datamoresub.com/api/exam', 'Exam'),
(9, 'Datastationapi', 'https://datastationapi.com/api/user/', 'Wallet'),
(10, 'Datastationapi', 'https://datastationapi.com/api/topup/', 'Airtime'),
(11, 'Datastationapi', 'https://datastationapi.com/api/data/', 'Data'),
(12, 'Datastationapi', 'https://datastationapi.com/ajax/validate_iuc', 'CableVer'),
(13, 'Datastationapi', 'https://datastationapi.com/api/cablesub', 'Cable'),
(14, 'Datastationapi', 'https://datastationapi.com/ajax/validate_meter', 'ElectricityVer'),
(15, 'Datastationapi', 'https://datastationapi.com/api/billpayment/', 'Electricity'),
(16, 'Datastationapi', 'https://datastationapi.com/api/epin/', 'Exam'),
(17, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/user', 'Wallet'),
(18, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/topup', 'Airtime'),
(19, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/data', 'Data'),
(20, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/cable/cable-validation', 'CableVer'),
(21, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/cable/', 'Cable'),
(22, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/bill/bill-validation', 'ElectricityVer'),
(23, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/bill/', 'Electricity'),
(24, 'Easyaccessapi', 'https://easyaccessapi.com.ng/api/exam/', 'Exam'),
(25, 'Legitdataway', 'https://legitdataway.com/api/user/', 'Wallet'),
(26, 'Legitdataway', 'https://legitdataway.com/api/topup/', 'Airtime'),
(27, 'Legitdataway', 'https://legitdataway.com/api/data', 'Data'),
(28, 'Legitdataway', 'https://legitdataway.com/api/cable/cable-validation', 'CableVer'),
(29, 'Legitdataway', 'https://legitdataway.com/api/cable', 'Cable'),
(30, 'Legitdataway', 'https://legitdataway.com/api/bill/bill-validation', 'ElectricityVer'),
(31, 'Legitdataway', 'https://legitdataway.com/api/bill', 'Electricity'),
(32, 'Legitdataway', 'https://legitdataway.com/api/exam', 'Exam'),
(33, 'Maskawasub', 'https://maskawasub.com/api/user/', 'Wallet'),
(34, 'Maskawasub', 'https://maskawasub.com/api/topup/', 'Airtime'),
(35, 'Maskawasub', 'https://maskawasub.com/api/data/', 'Data'),
(36, 'Maskawasub', 'https://www.maskawasub.com/api/validateiuc?smart_card_number=iuc& cablename=id', 'CableVer'),
(37, 'Maskawasub', 'https://maskawasub.com/api/cablesub/', 'Cable'),
(38, 'Maskawasub', 'https://maskawasub.com/api/validatemeter', 'ElectricityVer'),
(39, 'Maskawasub', 'https://maskawasub.com/api/billpayment/', 'Electricity'),
(40, 'Maskawasub', 'https://maskawasub.com/api/epin/', 'Exam'),
(41, 'Husmodataapi', 'https://husmodataapi.com/api/user/', 'Wallet'),
(42, 'Husmodataapi', 'https://husmodataapi.com/api/topup/', 'Airtime'),
(43, 'Husmodataapi', 'https://husmodataapi.com/api/data/', 'Data'),
(44, 'Husmodataapi', 'https://husmodataapi.com/api/validateiuc', 'CableVer'),
(45, 'Husmodataapi', 'https://husmodataapi.com/api/cablesub/', 'Cable'),
(46, 'Husmodataapi', 'https://husmodataapi.com/api/validatemeter', 'ElectricityVer'),
(47, 'Husmodataapi', 'https://husmodataapi.com/api/billpayment/', 'Electricity'),
(48, 'Husmodataapi', 'https://husmodataapi.com/api/epin/', 'Exam'),
(49, 'Gongozconcept', 'https://gongozconcept.com/api/user/', 'Wallet'),
(50, 'Gongozconcept', 'https://gongozconcept.com/api/topup/', 'Airtime'),
(51, 'Gongozconcept', 'https://gongozconcept.com/api/data/', 'Data'),
(52, 'Gongozconcept', 'https://gongozconcept.com/api/validateiuc', 'CableVer'),
(53, 'Gongozconcept', 'https://gongozconcept.com/api/cablesub/', 'Cable'),
(54, 'Gongozconcept', 'https://gongozconcept.com/api/validatemeter', 'ElectricityVer'),
(55, 'Gongozconcept', 'https://gongozconcept.com/api/billpayment/', 'Electricity'),
(56, 'Gongozconcept', 'https://gongozconcept.com/api/epin/', 'Exam'),
(57, 'Sabrdataapi', 'https://sabrdataapi.com/api/user/', 'Wallet'),
(58, 'Sabrdataapi', 'https://sabrdataapi.com/api/topup/', 'Airtime'),
(59, 'Sabrdataapi', 'https://sabrdataapi.com/api/data/', 'Data'),
(60, 'Sabrdataapi', 'https://sabrdataapi.com/ajax/validate_iuc', 'CableVer'),
(61, 'Sabrdataapi', 'https://sabrdataapi.com/api/cablesub/', 'Cable'),
(62, 'Sabrdataapi', 'https://sabrdataapi.com/api/validatemeter', 'ElectricityVer'),
(63, 'Sabrdataapi', 'https://sabrdataapi.com/api/billpayment/', 'Electricity'),
(64, 'Sabrdataapi', 'https://sabrdataapi.com/api/epin/', 'Exam'),
(74, 'VtuNaija', 'https://vtunaija.com.ng/api/datapin/', 'Data Pin'),
(75, 'VtuNaija', 'https://vtunaija.com.ng/alphatopup', 'Alpha Topup'),
(76, 'NcWallet', 'https://ncwallet.ng/api/data_card/', 'Data Pin'),
(77, 'Kvdata', 'https://kvdata.net/api/user/', 'Wallet'),
(78, 'Kvdata', 'https://kvdata.net/api/data/', 'Data'),
(79, 'Kvdata', 'https://kvdata.net/api/data_pin/', 'Datapin'),
(80, 'Kvdata', 'https://kvdata.net/api/rechargepin/', 'Rechargepin'),
(81, 'Kvdata', 'https://kvdata.net/api/epin/', 'Exam'),
(83, 'Kvdata', 'https://kvdata.net/api/data/58', 'Data query'),
(84, 'Kvdata ', 'https://kvdata.net/api/topup/', 'Airtime'),
(85, 'Kvdata', 'https://kvdata.net/api/data/id', 'Data id'),
(86, 'Kvdata', 'https://kvdata.net/api/billpayment/', 'Electricity'),
(87, 'Kvdata', 'https://kvdata.net/api/billpayment/id', 'Billpayment'),
(88, 'Kvdata', 'https://kvdata.net/api/cablesub/', 'Cable'),
(89, 'Kvdata', 'https://kvdata.net/api/cablesub/id', 'Cableid'),
(90, 'Kvdata', 'https://kvdata.net/api/validateiuc?smart_card_number=iuc& &cablename=id', 'CableVer'),
(91, 'Kvdata', 'https://kvdata.net/api/validatemeter?meternumber=meter&disconame=id&mtype=metertype &cablename=id', 'ElectricityVer'),
(92, 'Ncwallet', 'https://ncwallet.ng/api/user/', 'Wallet'),
(102, 'Legitdataway', 'https://legitdataway.com/api/bill/bill-validation?meter_number=12345555&disco=1&meter_type=postpaid', 'ElectricityVer'),
(104, 'Ulama', 'https://app.ulamadata.ng/api/airtime/', 'Airtime'),
(105, 'Ulama', 'https://app.ulamadata.ng/api/data/', 'Data'),
(106, 'Ulama', 'https://app.ulamadata.ng/api/cable/', 'Cable'),
(107, 'Ulama', 'https://app.ulamadata.ng/api/verify-cable/', 'CableVer'),
(108, 'Ulama', 'https://app.ulamadata.ng/api/electricity/', 'Electricity'),
(109, 'Ulama', 'https://app.ulamadata.ng /api/verify-electricity/', 'ElectricityVer'),
(110, 'Ulama', 'https://app.ulamadata.ng/api/data-pin/', 'Data Pin'),
(111, 'Husmodataapi', 'https://husmodataapi.com/api/datarechargepin/', 'Data Pin'),
(112, 'Datastationapi', 'https://datastationapi.com/api/data/58', 'Data'),
(113, 'Legitdataway', 'https://legitdataway.com/api/data_card', 'Data Pin'),
(114, 'SMEs', 'https://strongmb.ng/api/v1/user/', 'Wallet'),
(115, 'SMEs', 'https://strongmb.ng/api/v1/data/', 'Data'),
(116, 'SMEs', 'https://strongmb.ng/api/v1/airtime/', 'Airtime'),
(117, 'Babspay ', 'https://babspay.com.ng/api/rechargepin/', 'Recharge Card'),
(118, 'Husmo ', 'https://husmodataapi.com/api/rechargepin/', 'Recharge Card'),
(119, 'Alrachuzdata', 'https://alrahuzdata.com.ng/api/user/', 'Wallet'),
(120, 'Alrachuzdata', 'https://alrahuzdata.com.ng/api/rechargepin/', 'Recharge Card'),
(121, 'Simpleprice', 'https://simplepricetelecom.com/api/user/', 'Wallet'),
(122, 'Simpleprice', 'https://simplepricetelecom.com/api/data', 'Data'),
(123, 'Simpleprice', 'https://simplepricetelecom.com/api/recharge_card', 'Recharge Card'),
(124, 'Simpleprice', 'https://simplepricetelecom.com/api/topup/', 'Airtime'),
(125, 'Simpleprice', 'https://simplepricetelecom.com/api/exam', 'Exam'),
(126, 'Simpleprice ', 'https://simplepricetelecom.com/api/cable', 'Cable'),
(127, 'Simpleprice', 'https://simplepricetelecom.com/api/bill', 'Electricity'),
(128, 'Simpleprice ', 'https://simplepricetelecom.com/api/bill/bill-validation?meter_number=12345555&disco=1&meter_type=pos', 'ElectricityVer'),
(129, 'Simpleprice ', 'https://simplepricetelecom.com/api/cable/cable-validation?iuc=12345555&cable=1', 'CableVer'),
(130, 'Simpleprice 2', 'https://simpleprice.com.ng/api/user/', 'Wallet'),
(131, 'Simpleprice 2', 'https://simpleprice.com.ng/api/data/', 'Data'),
(132, 'TopPay', 'https://toppay.com.ng/api/user/', 'Wallet'),
(133, 'TopPay', 'https://toppay.com.ng/api/data/', 'Data'),
(134, 'TopPay', 'https://toppay.com.ng/api/cabletv/verify/', 'CableVer'),
(135, 'TopPay', 'https://toppay.com.ng/api/cabletv/', 'Cable'),
(136, 'Ausadvtu', 'https://ausadvtu.com/api/user/', 'Wallet'),
(137, 'Ausadvtu', 'https://ausadvtu.com/api/data/', 'Data'),
(138, 'Babspay', 'https://babspay.com.ng/api/user/', 'Wallet'),
(139, 'Babspay', 'https://babspay.com.ng/api/data/', 'Data'),
(140, 'Eccdcsub', 'https://eccdcsub.com.ng/api/user/', 'Wallet'),
(141, 'Eccdcsub', 'https://eccdcsub.com.ng/api/data/', 'Data'),
(142, 'Eccdcsub ', 'https://eccdcsub.com.ng/api/rechargepin/', 'Recharge Card'),
(143, 'Unitedapi', 'https://app.unitedapi.ng/wp-json/v1/api/user/', 'Wallet'),
(144, 'Unitedapi', 'https://app.unitedapi.ng/wp-json/v1/api/data/', 'Data'),
(145, 'Eccdcsub', 'https://eccdcsub.com.ng/api/airtime/', 'Airtime'),
(146, 'Alrachuzdata', 'https://alrahuzdata.com.ng/api/data/', 'Data'),
(147, 'Alrachuzdata ', 'https://alrahuzdata.com.ng/api/topup/', 'Airtime'),
(148, 'Alrachuzdata', 'https://alrahuzdata.com.ng/api/epin/', 'Exam'),
(149, 'Alrachuzdata ', 'https://alrahuzdata.com.ng/api/billpayment/', 'Electricity'),
(150, 'Alrachuzdata ', 'https://alrahuzdata.com.ng/api/validatemeter', 'ElectricityVer'),
(151, 'Alrachuzdata ', 'https://alrahuzdata.com.ng/api/cablesub/', 'Cable'),
(152, 'Alrachuzdata', 'https://alrahuzdata.com.ng/api/validateiuc', 'CableVer'),
(153, 'Kvdataapi', 'https://kvdataapi.net/api/user/', 'Wallet'),
(154, 'Kvdataapi', 'https://kvdataapi.net/api/data/', 'Data'),
(155, 'Kvdataapi', 'https://kvdataapi.net/api/data_pin/', 'Data Pin'),
(156, 'Kvdataapi', 'https://kvdataapi.net/api/rechargepin/', 'Recharge Card'),
(157, 'Kvdataapi', 'https://kvdataapi.net/api/epin/', 'Exam'),
(158, 'Kvdataapi', 'https://kvdataapi.net/api/topup/', 'Airtime'),
(159, 'Kvdataapi', 'https://kvdataapi.net/api/billpayment/', 'Electricity'),
(160, 'Kvdataapi', 'https://kvdataapi.net/api/cablesub/', 'Cable'),
(161, 'Kvdataapi', 'https://kvdataapi.net/api/validateiuc?smart_card_number=iuc& &cablename=id', 'CableVer'),
(162, 'Kvdataapi', 'https://kvdataapi.net/api/validatemeter?meternumber=meter&disconame=id&mtype=metertype', 'ElectricityVer'),
(163, 'Firedata', 'https://firedata.com.ng/api/balance', 'Wallet'),
(164, 'Surulere', 'https://suruleredatacom.com.ng/api/user/', 'Wallet'),
(165, 'Surulere', 'https://suruleredatacom.com.ng/api/data/', 'Data'),
(166, 'Swiftdataapi', 'https://swiftdataapi.com.ng/api/user/', 'Wallet'),
(167, 'Swiftdataapi', 'https://swiftdataapi.com.ng/api/data/', 'Data'),
(168, 'Swiftdataapi', 'https://swiftdataapi.com.ng/api/topup/', 'Airtime'),
(169, 'Mansurdata', 'https://mansurdata.net/api/user', 'Wallet'),
(170, 'Legitdataway', 'https://legitdataway.com/api/recharge_card', 'Recharge Card'),
(171, 'Dataplus ', 'https://dataplus.ng/api/user/', 'Wallet'),
(172, 'Dataplus', 'https://dataplus.ng/api/data/', 'Data'),
(173, 'Dataplus', 'https://dataplus.ng/api/cablesub/', 'Cable'),
(174, 'Dataplus ', 'https://dataplus.ng/ajax/validate_iuc', 'CableVer'),
(175, 'VTUNAIJA', 'https://vtunaija.com.ng/api/user/', 'Wallet'),
(176, 'VTUNAIJA', 'https://vtunaija.com.ng/api/data/', 'Data'),
(177, 'Billpluse', 'https://api.billpluse.ng/user/', 'Wallet'),
(178, 'Gsubz', 'https://gsubz.com/api/balance/', 'Wallet'),
(179, 'Billpluse', 'https://api.billpluse.ng/data/', 'Data'),
(180, 'Benazdata', 'https://benazdata.com.ng/api/user/', 'Wallet'),
(181, 'Benazdata', 'https://benazdata.com.ng/api/data/', 'Data'),
(182, 'Gigbiller', 'https://gigbiller.com.ng/api/user', 'Wallet'),
(183, 'Masuddatasub', 'https://masuddatasub.com/api/user/', 'Wallet'),
(184, 'Masuddatasub', 'https://masuddatasub.com/api/data/', 'Data'),
(185, 'Gladtidings', 'https://www.gladtidingsdata.com/api/user/', 'Wallet'),
(186, 'Gladtidings', 'https://www.gladtidingsdata.com/api/data/', 'Data'),
(187, 'Gladtidings', 'https://www.gladtidingsdata.com/api/data-card/', 'Data Pin'),
(188, 'Gladtidings', 'https://www.gladtidingsdata.com/api/topup/', 'Airtime'),
(189, 'Gladtidings', 'https://www.gladtidingsdata.com/api/cablesub/', 'Cable'),
(190, 'Gladtidings', 'https://www.gladtidingsdata.com/api/v2/validateiuc/', 'CableVer'),
(191, 'Gladtidings', 'https://www.gladtidingsdata.com/api/rechargepin/', 'Recharge Card'),
(192, 'Gladtidings', 'https://www.gladtidingsdata.com/api/epin/', 'Exam'),
(193, 'Massolution', 'https://massolution.com.ng/site/api/data', 'Data'),
(194, 'Swiftrecharge', 'https://swiftrechargenow.com/api/user/', 'Wallet'),
(195, 'Swiftrecharge', 'https://swiftrechargenow.com/api/data/', 'Data'),
(196, 'Zemabizdata', 'https://zeemabizdata.com/api/user/', 'Wallet'),
(197, 'Zemabizdata', 'https://zeemabizdata.com/api/data/', 'Data'),
(198, 'Peacesub', 'https://peacesub.com.ng/api/user/', 'Wallet'),
(199, 'Peacesub', 'https://peacesub.com.ng/api/data/', 'Data'),
(200, 'Peacesub', 'https://peacesub.com.ng/api/topup/', 'Airtime'),
(201, 'Peacesub', 'https://peacesub.com.ng/api/billpayment/', 'Electricity'),
(202, 'Peacesub', 'https://peacesub.com.ng/api/validatemeter', 'ElectricityVer'),
(203, 'Peacesub', 'https://peacesub.com.ng/api/cablesub/', 'Cable'),
(204, 'Peacesub', 'https://peacesub.com.ng/api/validateiuc', 'CableVer'),
(205, 'Bsplug ', 'https://bsplug.net/api/user/', 'Wallet'),
(206, 'Bsplug ', 'https://bsplug.net/api/data/', 'Data'),
(207, 'Bsplug ', 'https://bsplug.net/api/billpayment/', 'Electricity'),
(208, 'Bsplug ', 'https://bsplug.net/api/validatemeter', 'ElectricityVer'),
(209, 'Bsplug ', 'https://bsplug.net/api/validateiuc', 'CableVer'),
(210, 'Bsplug ', 'https://bsplug.net/api/cablesub/', 'Cable'),
(211, 'Bsplug ', 'https://bsplug.net/api/topup/', 'Airtime'),
(212, 'Bsplug ', 'https://bsplug.net/api/data_pin/', 'Data Pin'),
(213, 'Datapea', 'https://datapea.com/api/details', 'Wallet'),
(214, 'Datapea', 'https://datapea.com/api/data', 'Data'),
(215, 'Bello-Ventures', 'https://bello-ventures.com/api/user/', 'Wallet'),
(216, 'Bello-Ventures', 'https://Bello-ventures.com/api/data/', 'Data'),
(217, 'Datapea', 'https://datapea.com/api/verifyiuc', 'CableVer'),
(218, 'Datapea', 'https://datapea.com/api/tv', 'Cable'),
(219, 'Datapea', 'https://datapea.com/api/verifymeter', 'ElectricityVer'),
(220, 'Datapea', 'https://datapea.com/api/electricity', 'Electricity'),
(221, 'Datapea', 'https://datapea.com/api/datacard', 'Data Pin'),
(222, 'Datapea', 'https://datapea.com/api/airtime', 'Airtime'),
(223, 'Datapea', 'https://datapea.com/api/vtupin', 'Recharge Card'),
(224, 'Datapea', 'https://datapea.com/api/education', 'Exam'),
(225, 'Myaabaxztech', 'https://myaabaxztech.com/api/user/', 'Wallet'),
(226, 'Myaabaxztech', 'https://myaabaxztech.com/api/data/', 'Data'),
(227, 'Myaabaxztech', 'https://myaabaxztech.com/api/topup/', 'Airtime'),
(228, 'Databservices', 'https://databservices.com.ng/api/user/', 'Wallet'),
(229, 'Databservices', 'https://databservices.com.ng/api/data/', 'Data'),
(230, 'Autopilot Simhosting', 'https://autopilotng.com/api/live/v1/data', 'Data'),
(231, 'Autopilot Simhosting', 'https://autopilotng.com/api/live/v1/load/wallet-balance', 'Wallet'),
(232, 'Autopilot Simhosting', 'https://autopilotng.com/api/live/v1/airtime', 'Airtime'),
(233, 'Wapay', 'https://wapay.com.ng/api//user/', 'Wallet'),
(234, 'Wapay', 'https://wapay.com.ng/api/data/', 'Data'),
(235, 'Rossytechs', 'https://rossytechs.com/api/user/', 'Wallet'),
(236, 'Rossytechs', 'https://rossytechs.com/api/data/', 'Data'),
(237, 'Emysdata', 'https://emysdata.com.ng/api/user/', 'Wallet'),
(238, 'Emysdata', 'https://emysdata.com.ng/api/data/', 'Data'),
(239, 'SMEPLUG', 'https://smeplug.ng/api/v1/data/purchase', 'Data'),
(240, 'SMEPLUG', 'https://smeplug.ng/api/v1/airtime/purchase', 'Airtime'),
(241, 'Strowallet ', 'https://strowallet.com/api/buy_epin/\r\n', 'Recharge Card'),
(242, 'Primebiller', 'https://primebiller.com/api/v1/rechargepin/', 'Recharge Card'),
(243, 'Zkydata', 'https://zkydata.com/api/user/', 'Wallet'),
(244, 'zkydata', 'https://zkydata.com/api/data/', 'Data'),
(245, 'Rbsdataapi', 'https://rbsdataapi.com.ng/api/user', 'Wallet'),
(246, 'Rbsdataapi', 'https://rbsdataapi.com.ng/api/data', 'Data'),
(247, 'Rbsdataapi', 'https://rbsdataapi.com.ng/api/recharge_card', 'Recharge Card'),
(248, 'Rbsdataapi', 'https://rbsdataapi.com.ng/api/data_card', 'Data Pin'),
(249, 'Ringo', 'https://www.api.ringo.ng/api/agent/p2', 'Wallet'),
(250, 'Ringo', 'https://www.api.ringo.ng/api/agent/p2', 'Airtime');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

CREATE TABLE `beneficiary` (
  `id` int NOT NULL,
  `sId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `billstack_accounts`
--

CREATE TABLE `billstack_accounts` (
  `id` int NOT NULL,
  `userid` int DEFAULT NULL,
  `active` int NOT NULL DEFAULT '0',
  `psb` varchar(100) DEFAULT NULL,
  `providus` varchar(100) DEFAULT NULL,
  `safehaven` varchar(200) DEFAULT NULL,
  `bankly` varchar(200) DEFAULT NULL,
  `palmpay` varchar(200) NOT NULL,
  `account_reference` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cableid`
--

CREATE TABLE `cableid` (
  `cId` int NOT NULL,
  `cableid` varchar(10) DEFAULT NULL,
  `provider` varchar(10) NOT NULL,
  `providerStatus` varchar(10) NOT NULL DEFAULT 'On'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cableid`
--

INSERT INTO `cableid` (`cId`, `cableid`, `provider`, `providerStatus`) VALUES
(1, '1', 'GOTV', 'On'),
(2, '2', 'DSTV', 'On'),
(3, '3', 'STARTIMES', 'On');

-- --------------------------------------------------------

--
-- Table structure for table `cableplans`
--

CREATE TABLE `cableplans` (
  `cpId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cableprovider` tinyint NOT NULL,
  `day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cableplans`
--

INSERT INTO `cableplans` (`cpId`, `name`, `price`, `userprice`, `agentprice`, `vendorprice`, `planid`, `type`, `cableprovider`, `day`) VALUES
(203, 'Gotv Smallie', '1575', '1575', '1575', '1575', '34', NULL, 1, '30'),
(204, 'Gotv Jinja', '3300', '3300', '3300', '3300', '61', NULL, 1, '30'),
(205, 'Gotv Jolli', '4850', '4850', '4850', '4850', '17', NULL, 1, '30'),
(226, 'Gotv Max', '7200', '7200', '7200', '7200', '2', NULL, 1, '30'),
(227, 'Gotv Supa', '9600', '9600', '9600', '9600', '47', NULL, 1, '30'),
(228, 'Gotv Supa Plus', '15700', '15700', '15700', '15700', '48', NULL, 1, '30'),
(229, 'Gotv Smallie ', '4175', '4475', '4175', '4175', '35', NULL, 1, '180'),
(230, 'DStv Padi', '2950', '2950', '2950', '2950', '20', NULL, 2, '30'),
(231, 'DStv Yanga', '5100', '5100', '5100', '5100', '6', NULL, 2, '30'),
(232, 'DStv Confam', '9300', '9300', '9300', '9300', '19', NULL, 2, '30'),
(233, 'DStv Compact', '15700', '15700', '15700', '15700', '7', NULL, 2, '30'),
(234, 'Padi+Extraview ', '8600', '8600', '8600', '8600', '28', NULL, 2, '30'),
(235, 'DStv Extraview Access', '5000', '5000', '5000', '5000', '33', NULL, 2, '30'),
(236, 'DStv Compact+ Extra View', '20700', '20700', '20700', '20700', '31', NULL, 2, '30'),
(237, 'DStv Yanga+ Extraview', '10100', '10100', '10100', '10100', '27', NULL, 2, '30'),
(238, 'DStv Confam + Extraview ', '14300', '14300', '14300', '14300', '26', NULL, 2, '30'),
(239, 'Startimes Classic (Antenna)', '5500', '5500', '5500', '5500', '11', NULL, 3, '30'),
(240, 'Startimes Smart (Antenna)', '4700', '4700', '4700', '4700', '13', NULL, 3, '30'),
(241, 'Startimes Nova (Antenna)', '1900', '1900', '1900', '1900', '14', NULL, 3, '30'),
(242, 'Startimes Super (Antenna)', '9000', '9000', '9000', '9000', '15', NULL, 3, '30'),
(243, 'Startimes Basic (Antenna) ', '3700', '3700', '3700', '3700', '12', NULL, 3, '30'),
(244, 'Startimes Basic (Antenna)', '1250', '1250', '1250', '1250', '38', NULL, 3, '7'),
(245, 'Startimes Smart (Antenna)', '1550', '1550', '1550', '1550', '39', NULL, 3, '7'),
(246, 'Startimes Classic (Antenna)', '1900', '1900', '1900', '1900', '40', NULL, 3, '7'),
(247, 'Startimes Supa (Antenna)', '3000', '3000', '3000', '3000', '41', NULL, 3, '7'),
(249, 'Startimes Nova (Antenna)', '600', '600', '600', '600', '37', NULL, 3, '7'),
(250, 'Gotv Smallie Yearly', '12300', '12300', '12300', '12300', '36', NULL, 1, '365'),
(251, 'Startimes ', '300', '300', '300', '300', '77', NULL, 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `msgId` int NOT NULL,
  `sId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `dPosted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datapins`
--

CREATE TABLE `datapins` (
  `dpId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `datanetwork` tinyint NOT NULL,
  `day` varchar(255) NOT NULL,
  `loadpin` varchar(20) NOT NULL,
  `checkbal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datapins`
--

INSERT INTO `datapins` (`dpId`, `name`, `price`, `userprice`, `agentprice`, `vendorprice`, `planid`, `type`, `datanetwork`, `day`, `loadpin`, `checkbal`) VALUES
(39, '500MB', '140', '150', '145', '143', '8', 'Corporate', 2, '30', '*347*119*Pin#', '*323*4#'),
(40, '1GB', '280', '290', '285', '283', '9', 'Corporate', 2, '30', '*347*119*Pin#', '*323*4#'),
(41, '2GB', '560', '580', '570', '565', '10', 'Corporate', 2, '30', '*347*119*Pin#', '*323*4#'),
(42, '5GB', '1400', '1450', '1440', '1410', '11', 'Corporate', 2, '30', '*347*119*Pin#', '*323*4#'),
(50, '500MB', '300', '320', '320', '320', '2', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(51, '1.0GB', '600', '630', '630', '630', '3', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(52, '2.0GB', '1200', '1260', '1260', '1260', '4', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(53, '3.0GB', '1800', '1890', '1890', '1980', '5', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(54, '5GB', '1375', '1400', '1425', '1400', '6', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(55, '10.0GB', '6000', '6300', '6300', '6300', '7', 'SME', 1, '30', '*347*119*pin#', '*461*4#'),
(56, '500MB', '300', '320', '320', '320', '8', 'Corporate', 4, '30', '*347*119*pin#', '*323#'),
(57, '1GB', '570', '600', '600', '600', '9', 'Corporate', 4, '30', '*347*119*pin#', '*323#'),
(58, '2GB', '1140', '1200', '1200', '1200', '10', 'Corporate', 4, '30', '*347*119*pin#', '*323#'),
(59, '5GB', '2850', '3000', '3000', '3000', '11', 'Corporate', 4, '30', '*347*119*Pin#', '*323#'),
(60, '500MB', '146', '166', '166', '166', '12', 'Corporate', 3, '30', '*347*119*pin#', '*323#'),
(61, '1GB', '274', '285', '284', '284', '13', 'Corporate', 3, '30', '*347*119*pin#', '*323#');

-- --------------------------------------------------------

--
-- Table structure for table `dataplans`
--

CREATE TABLE `dataplans` (
  `pId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `userprice` varchar(255) NOT NULL,
  `agentprice` varchar(255) NOT NULL,
  `vendorprice` varchar(255) NOT NULL,
  `planid` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `datanetwork` tinyint NOT NULL,
  `day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataplans`
--

INSERT INTO `dataplans` (`pId`, `name`, `price`, `userprice`, `agentprice`, `vendorprice`, `planid`, `type`, `datanetwork`, `day`) VALUES
(1, '1 GB', '100', '250', '250', '200', '452', 'SME', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `datatokens`
--

CREATE TABLE `datatokens` (
  `tId` int NOT NULL,
  `sId` int NOT NULL,
  `tRef` varchar(255) NOT NULL,
  `business` varchar(30) NOT NULL,
  `network` varchar(10) DEFAULT NULL,
  `datasize` varchar(10) DEFAULT NULL,
  `loadpin` varchar(30) DEFAULT NULL,
  `checkbalance` varchar(30) DEFAULT NULL,
  `quantity` int NOT NULL,
  `serial` text NOT NULL,
  `tokens` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datatokens`
--

INSERT INTO `datatokens` (`tId`, `sId`, `tRef`, `business`, `network`, `datasize`, `loadpin`, `checkbalance`, `quantity`, `serial`, `tokens`, `date`) VALUES
(1, 182, 'DATAPIN420_84921716624693', 'Databservices', 'MTN', '500MB', '*347*119*pin#', '*461*4#', 1, 'SN63307815A', '1603292814', '2024-05-25 09:12:33'),
(2, 214, 'DATAPIN937_39071718023588', 'PURE LIFE DATA WORLD @JI ADMIN', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN06337928A', '1686515612', '2024-06-10 13:48:05'),
(3, 228, 'DATAPIN563_40381720796331', 'Ireti data', 'MTN', '500MB', '*347*119*pin#', '*461*4#', 1, 'SN97307318A', '1650187963', '2024-07-12 15:59:41'),
(4, 228, 'DATAPIN150_98061720796795', 'Ireti data', 'GLO', '500MB', '*347*119*pin#', '*127*0#', 1, 'SN84104169A', '1687291643', '2024-07-12 16:10:08'),
(5, 182, 'DATAPIN820_15211720993411', 'Databservices', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN48572318A', '1665774124', '2024-07-14 22:43:57'),
(6, 251, 'DATAPIN365_67431721721527', 'Data4me ', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN86158033A', '1606139812', '2024-07-23 08:59:39'),
(7, 182, 'DATAPIN362_51841722418898', 'Databservices LTD', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN49156649A', '1678247052', '2024-07-31 10:42:29'),
(8, 101, 'DATAPIN703_24171722510658', 'Tier3VTU', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 2, 'SN40136887A,SN57321861A', '1628560396,1686783631', '2024-08-01 12:13:28'),
(9, 236, 'DATAPIN177_35881723841207', 'Kay', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN27396418A', '1683312521', '2024-08-16 21:47:34'),
(10, 236, 'DATAPIN575_45661723975942', 'Kay', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN02639765A', '1625638015', '2024-08-18 11:12:54'),
(11, 101, 'DATAPIN694_99461724106535', '9jadata', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN68110257A', '1622894806', '2024-08-19 23:30:45'),
(12, 105, 'DATAPIN351_23311724381268', 'Clinton', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN21290563A', '1622684136', '2024-08-23 03:49:07'),
(13, 101, 'DATAPIN768_27211724407559', 'Bellamygreat', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN38712923A', '1648340895', '2024-08-23 11:07:27'),
(14, 108, 'DATAPIN639_15591724497976', 'Gp', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 2, 'SN96048781A,SN85506449A', '1628075939,1635217605', '2024-08-24 12:14:05'),
(15, 182, 'DATAPIN789_36581724580567', 'Witmon ', 'GLO', '500MB', '*347*119*pin#', '*127*0#', 1, 'SN57696180A', '1625941480', '2024-08-25 11:09:49'),
(16, 108, 'DATAPIN734_82501724609968', 'Goar', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN89692730A', '1618102068', '2024-08-25 19:20:32'),
(17, 101, 'DATAPIN274_86061725317390', 'VladimirCore', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN83592611A', '1685784679', '2024-09-02 23:50:50'),
(18, 101, 'DATAPIN146_28531725532612', 'Gb', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN62933028A', '1653449129', '2024-09-05 11:37:39'),
(19, 101, 'DATAPIN681_25891725927462', 'Ijk', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN08656393A', '1645237827', '2024-09-10 01:18:53'),
(20, 108, 'DATAPIN533_30991725943940', 'Hi I am very deeply', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN38130521A', '1602719885', '2024-09-10 05:53:05'),
(21, 214, 'DATAPIN216_59081726613338', 'Pure-life int', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN17593921A', '1674657225', '2024-09-17 23:50:07'),
(22, 214, 'DATAPIN892_14281726958804', 'Pure life ', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN02795421A', '1618475063', '2024-09-21 23:47:24'),
(23, 15, 'DATAPIN752_93001729951343', 'Berryks enterprise ', 'MTN', '500MB', '*347*119*pin#', '*461*4#', 1, 'SN12793417A', '1626985974', '2024-10-26 15:04:01'),
(24, 67, 'DATAPIN323_69741732909611', 'Datab', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN17599028A', '1696351049', '2024-11-29 20:48:47'),
(25, 67, 'DATAPIN444_87821733530068', 'Datab', 'GLO', '1GB', '*347*119*pin#', '*127*0#', 1, 'SN90860839A', '1643159702', '2024-12-07 01:08:23'),
(26, 118, 'DATAPIN663_29531741285055', 'Marvelous ', 'MTN', '1GB', '*347*119*pin#', '*461*4#', 1, 'SN54103239A', '1695820151', '2025-03-06 19:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `data_type_mapping`
--

CREATE TABLE `data_type_mapping` (
  `id` int NOT NULL,
  `data_type` varchar(50) NOT NULL,
  `mapped_value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_type_mapping`
--

INSERT INTO `data_type_mapping` (`id`, `data_type`, `mapped_value`, `created_at`, `updated_at`) VALUES
(1, 'SME', 'SME', '2025-03-07 21:08:31', '2025-06-23 11:35:08'),
(2, 'Gifting', 'DIRECT GIFTING', '2025-03-07 21:08:31', '2025-04-01 07:05:57'),
(3, 'Sme2', '', '2025-03-07 21:08:31', '2025-03-31 20:15:16'),
(4, 'Data Share', '', '2025-03-07 21:08:31', '2025-03-31 20:15:54'),
(5, 'Coupon', '', '2025-03-07 21:08:31', '2025-03-31 20:16:12'),
(6, 'Corporate', 'Corporate', '2025-03-07 21:08:31', '2025-04-01 05:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `electricityid`
--

CREATE TABLE `electricityid` (
  `eId` int NOT NULL,
  `electricityid` varchar(50) DEFAULT NULL,
  `provider` varchar(50) NOT NULL,
  `abbreviation` varchar(5) NOT NULL,
  `providerStatus` varchar(10) NOT NULL DEFAULT 'On'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electricityid`
--

INSERT INTO `electricityid` (`eId`, `electricityid`, `provider`, `abbreviation`, `providerStatus`) VALUES
(1, '1', 'Ikeja Electric', 'IE', 'On'),
(2, '2', 'Eko Electric', 'EKEDC', 'On'),
(3, '4', 'Kano Electric', 'KEDCO', 'On'),
(4, '6', 'Port Harcourt Electric', 'PHEDC', 'On'),
(5, '9', 'Jos Electric', 'JED', 'On'),
(6, '7', 'Ibadan Electric', 'IBEDC', 'On'),
(7, '8', 'Kaduna Electric', 'KEDC', 'On'),
(8, '3', 'Abuja Electric', 'AEDC', 'On'),
(9, '5', 'Enugu Electric', 'ENUGU', 'On'),
(10, '10', 'Benin Electric', 'BENIN', 'On'),
(11, '11', 'Yola Electric', 'YOLA', 'On');

-- --------------------------------------------------------

--
-- Table structure for table `examid`
--

CREATE TABLE `examid` (
  `eId` int NOT NULL,
  `examid` varchar(10) DEFAULT NULL,
  `provider` varchar(50) NOT NULL,
  `price` int NOT NULL DEFAULT '0',
  `buying_price` int NOT NULL DEFAULT '0',
  `providerStatus` varchar(10) NOT NULL DEFAULT 'On'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examid`
--

INSERT INTO `examid` (`eId`, `examid`, `provider`, `price`, `buying_price`, `providerStatus`) VALUES
(1, '1', 'WAEC', 3500, 3400, 'On'),
(2, '2', 'NECO', 1350, 1220, 'On'),
(3, '3', 'NABTEB', 900, 800, 'Off');

-- --------------------------------------------------------

--
-- Table structure for table `flash_noti`
--

CREATE TABLE `flash_noti` (
  `msgId` int NOT NULL,
  `msgfor` tinyint NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `dPosted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flash_noti`
--

INSERT INTO `flash_noti` (`msgId`, `msgfor`, `subject`, `message`, `status`, `dPosted`) VALUES
(208, 0, 'Hello there ', 'You can always Reach Out On Us whenever you encountered any issue On WhatsApp Via 09022016434 ðŸ™', 0, '2025-01-24 22:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int NOT NULL,
  `sId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `query` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `userEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_read` tinyint(1) DEFAULT '0',
  `admin_read` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manualfunds`
--

CREATE TABLE `manualfunds` (
  `tId` int NOT NULL,
  `sId` int NOT NULL,
  `amount` varchar(20) NOT NULL,
  `account` varchar(200) NOT NULL,
  `method` varchar(200) NOT NULL,
  `status` varchar(50) NOT NULL,
  `dPosted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manualfunds`
--

INSERT INTO `manualfunds` (`tId`, `sId`, `amount`, `account`, `method`, `status`, `dPosted`) VALUES
(1, 583, '2500', 'Wema lawal ', 'Ussd', 'success', '2024-02-07 04:34:34'),
(2, 82, '2000', 'Adesina Fatimoh omolara wema bank', 'Transfer ', 'success', '2024-02-07 07:20:41'),
(3, 631, '2000', 'Opay', 'Transfer ', 'success', '2024-02-08 09:44:33'),
(4, 631, '1000', 'Opay', 'Transfer ', 'success', '2024-02-09 13:36:19'),
(5, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-09 14:58:44'),
(6, 82, '1500', 'Adesina Fatimoh omolara opay', 'Transfer ', 'success', '2024-02-10 15:36:53'),
(7, 73, '1000', 'Isah Abdulkarim umar', 'Transfer', 'failed', '2024-02-10 20:12:32'),
(8, 639, '1000', 'Nimat jimoh palmpay ', 'Manual', 'failed', '2024-02-11 17:36:12'),
(9, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-13 11:02:07'),
(10, 82, '2000', 'Adesina Fatimoh omolara opay', 'Transfer ', 'success', '2024-02-14 15:41:01'),
(11, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-17 13:57:17'),
(12, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-02-17 14:13:27'),
(13, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-02-20 01:52:45'),
(14, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-20 05:40:53'),
(15, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-21 16:23:01'),
(16, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-23 07:00:01'),
(17, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-02-23 07:09:00'),
(18, 86, '6000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile app', 'success', '2024-02-24 18:09:11'),
(19, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-24 19:16:20'),
(20, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-02-24 19:22:43'),
(21, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-02-24 19:28:16'),
(22, 241, '1100', 'Ajiboye Abigael   Opay', 'Transfer ', 'success', '2024-02-26 08:55:08'),
(23, 82, '950', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-27 10:39:36'),
(24, 82, '1200', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-27 21:32:33'),
(25, 128, '1400', 'Rasheed Ayofe Ibitoye (OPAY) ', 'Transfer', 'success', '2024-02-28 16:41:31'),
(26, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-02-29 06:59:34'),
(27, 82, '750', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-01 07:15:15'),
(28, 86, '5000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile app', 'success', '2024-03-01 10:37:08'),
(29, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-01 10:48:41'),
(30, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-01 10:51:47'),
(31, 86, '3000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile app', 'success', '2024-03-03 11:24:51'),
(32, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-03 12:20:11'),
(33, 297, '1500', 'Famujimi Mary. O,  palmpay ', 'Manual ', 'success', '2024-03-03 14:48:34'),
(34, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-05 09:15:27'),
(35, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-05 14:44:32'),
(36, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-08 11:13:34'),
(37, 662, '500', '8148052180 opay bank', 'Opay ', 'failed', '2024-03-09 17:36:49'),
(38, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-10 13:09:25'),
(39, 369, '400', 'Isaleti kabiru akinwale kuda bank', 'Bank transy', 'success', '2024-03-10 17:44:18'),
(40, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-10 18:27:06'),
(41, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-10 18:27:18'),
(42, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-10 18:43:08'),
(43, 665, '160', '7015393805 OPay ', 'Transfer', 'success', '2024-03-11 14:52:40'),
(44, 86, '5000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-03-11 16:53:57'),
(45, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-12 09:32:26'),
(46, 86, '4000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-03-13 15:19:45'),
(47, 82, '1200', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-13 15:46:59'),
(48, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-14 11:15:51'),
(49, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-14 11:19:35'),
(50, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-14 11:31:04'),
(51, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-17 17:31:31'),
(52, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-20 19:32:59'),
(53, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-20 19:33:23'),
(54, 82, '1200', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-22 09:07:10'),
(55, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-22 20:01:42'),
(56, 297, '2000', '9065256523, palmpay ', 'Manual, transfer ', 'failed', '2024-03-23 11:38:22'),
(57, 297, '2000', '8137000125, palmpay ', 'Transfer ', 'success', '2024-03-23 11:46:48'),
(58, 86, '5000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-03-26 16:56:48'),
(59, 86, '5000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'failed', '2024-03-26 17:09:37'),
(60, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-28 05:03:26'),
(61, 86, '4000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-03-29 11:27:16'),
(62, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-03-29 16:55:11'),
(63, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-03-29 17:00:40'),
(64, 82, '1800', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-01 15:56:45'),
(65, 128, '900', 'Rasheed Above Ibitoye (okay) ', 'Transfer', 'success', '2024-04-02 16:52:37'),
(66, 86, '4000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-04-03 09:30:16'),
(67, 118, '1100', 'Ajiboye Segun Opay', 'Transfer ', 'success', '2024-04-03 17:47:00'),
(68, 86, '3000', ' Ochiagha Anselem somtochukwu  first bank', 'Mobile banking ', 'success', '2024-04-04 18:26:02'),
(69, 82, '1300', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-04-04 18:46:15'),
(70, 82, '1300', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-04 18:46:36'),
(71, 82, '1900', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-05 18:10:01'),
(72, 118, '1000', 'Ajiboye Segun Opay', 'Transfer ', 'success', '2024-04-07 08:51:53'),
(73, 118, '1000', 'Ajiboye Segun Opay', 'Transfer ', 'failed', '2024-04-07 08:53:27'),
(74, 297, '1500', '9065256523, palmpay ', 'Transfer ', 'success', '2024-04-07 17:26:01'),
(75, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-10 12:17:37'),
(76, 86, '5000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-04-10 16:04:53'),
(77, 297, '1500', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-04-11 13:50:02'),
(78, 118, '750', 'Ajiboye Segun Opay', 'Transfer ', 'failed', '2024-04-11 22:09:13'),
(79, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-12 14:15:37'),
(80, 82, '1400', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-04-12 14:16:09'),
(81, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-13 18:36:47'),
(82, 118, '1200', 'Ajiboye Segun Opay', 'Transfer ', 'success', '2024-04-15 16:55:23'),
(83, 297, '1500', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-04-16 17:09:06'),
(84, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-16 19:33:05'),
(85, 86, '3500', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-04-17 11:40:37'),
(86, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-18 09:00:47'),
(87, 86, '4000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-04-19 17:01:18'),
(88, 82, '1800', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-21 15:57:02'),
(89, 297, '1500', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-04-21 22:53:09'),
(90, 114, '1000', 'TOSIN AJISAFE, GTBANK', 'TRANSFER ', 'success', '2024-04-24 14:49:29'),
(91, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-24 14:53:50'),
(92, 118, '1200', 'Ajiboye Segun Opay', 'Transfer ', 'success', '2024-04-24 19:53:35'),
(93, 297, '1000', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-04-25 16:21:14'),
(94, 114, '2000', 'HASSAN RUKAYAT OMOSHALEWA, WEMA BANK', 'TRANSFER ', 'success', '2024-04-25 18:51:23'),
(95, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-26 10:54:57'),
(96, 114, '2100', 'UNUAFE MERCY GTBANK', 'TRANSFER ', 'success', '2024-04-26 15:41:20'),
(97, 114, '3000', 'HASSAN HADIJAT AYOMIDE UBA BANK', 'TRANSFER ', 'success', '2024-04-27 15:25:36'),
(98, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-28 12:34:17'),
(99, 114, '1000', 'HASSAN RUKAYAT OMOSHALEWA, WEMA BANK', 'TRANSFER ', 'success', '2024-04-29 14:41:02'),
(100, 297, '1000', 'Famujimi Mary, palmpay ', 'Transfer ', 'failed', '2024-04-29 16:44:00'),
(101, 297, '1000', 'Famujimi Mary palmpay ', 'Transfer ', 'success', '2024-04-29 16:56:25'),
(102, 118, '1500', 'Ajiboye Segun Access', 'Transfer ', 'success', '2024-04-30 09:31:08'),
(103, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-04-30 20:59:55'),
(104, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-04-30 21:00:10'),
(105, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-05-01 10:26:38'),
(106, 82, '1500', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-05-03 08:03:57'),
(107, 114, '1300', 'HASSAN RUKAYAT OMOSHALEWA, WEMA BANK', 'TRANSFER ', 'failed', '2024-05-03 15:30:31'),
(108, 114, '2000', 'HASSAN RUKAYAT OMOSHALEWA, WEMA BANK', 'TRANSFER ', 'success', '2024-05-03 15:39:25'),
(109, 297, '800', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-05-04 22:47:02'),
(110, 82, '1200', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-05-06 07:23:11'),
(111, 497, '1000', 'Opay', 'Transfer ', 'failed', '2024-05-06 20:39:18'),
(112, 497, '1000', 'Opay ', 'Transfer ', 'success', '2024-05-06 20:41:26'),
(113, 631, '1000', 'Opay', 'Transfer ', 'success', '2024-05-08 08:14:34'),
(114, 82, '1000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-05-08 18:46:19'),
(115, 297, '1000', 'Famujimi Mary O, palmpay ', '1000', 'success', '2024-05-08 18:48:02'),
(116, 114, '1750', 'UNUAFE MERCY GTBANK', 'TRANSFER ', 'success', '2024-05-09 16:39:04'),
(117, 694, '300', 'popoola iseoluwa, opay', 'transfer', 'success', '2024-05-09 18:26:45'),
(118, 57, '2300', 'Quadril babatunde lawal & palm pay ', 'transfer', 'success', '2024-05-09 19:43:14'),
(119, 751, '1000', 'Efa Asibong Eni and Palmpay', 'Bank transfer', 'success', '2024-05-10 11:02:45'),
(120, 118, '1000', 'Ajiboye Segun Opay', 'Transfer ', 'success', '2024-05-10 23:44:55'),
(121, 118, '1000', 'Ajiboye Segun Opay', 'Transfer ', 'failed', '2024-05-10 23:45:48'),
(122, 583, '1000', 'Lawal quadri opay', 'Bank', 'success', '2024-05-11 03:30:30'),
(123, 583, '1000', 'La', 'Pa', 'failed', '2024-05-11 03:35:52'),
(124, 583, '2000', 'Ad', 'Pay', 'failed', '2024-05-11 03:45:16'),
(125, 583, '150', 'Rs', 'As', 'failed', '2024-05-11 03:48:17'),
(126, 583, '150', 'Ad', 'Ad', 'failed', '2024-05-11 03:51:58'),
(127, 583, '45', 'A', 'Ff', 'success', '2024-05-11 03:56:44'),
(128, 583, '580', 'Opay lawal quadri ', 'Transfer ', 'success', '2024-05-11 04:00:17'),
(129, 765, '340', '7041922790. Muritadoh abdullahi', 'Transfer', 'success', '2024-05-12 10:52:34'),
(130, 694, '300', 'popoola iseoluwa opay', 'transfer', 'success', '2024-05-12 17:07:56'),
(131, 297, '700', 'Taiwo votu, Polaris ', 'Bank transfer ', 'failed', '2024-05-13 09:19:11'),
(132, 297, '700', 'Taiwo votu, Polaris ', 'Bank transfer ', 'success', '2024-05-13 09:22:49'),
(133, 297, '700', 'Taiwo votu, Polaris ', 'Bank transfer ', 'failed', '2024-05-13 09:29:18'),
(134, 297, '700', 'Taiwo votu, Polaris ', 'Bank transfer ', 'failed', '2024-05-13 10:30:11'),
(135, 86, '3000', 'Ochiagha Anselem somtochukwu first bank ', 'Mobile banking ', 'success', '2024-05-13 11:41:32'),
(136, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-05-13 16:20:03'),
(137, 765, '300', 'Muritadoh abdullahi opay ', 'Transfer', 'success', '2024-05-14 14:12:52'),
(138, 773, '1000', 'Wakilat Abiola palmpay ', 'Transfer ', 'success', '2024-05-14 22:37:23'),
(139, 297, '1000', 'Famujimi Mary, palmpay ', 'Transfer ', 'success', '2024-05-15 09:34:33'),
(140, 774, '300', 'Opay', 'Transfer ', 'failed', '2024-05-15 11:28:29'),
(141, 774, '300', '9134256578 Opay', 'Transfer ', 'success', '2024-05-15 11:28:59'),
(142, 774, '230', '9134256578 Opay', 'Transfer ', 'success', '2024-05-15 12:14:59'),
(143, 779, '1000', 'Buhari suliyat opeyemi, palmpay ', 'Transfer', 'success', '2024-05-15 20:55:57'),
(144, 86, '4000', 'Ochiagha Anselem somtochukwu first bank', 'Mobile banking ', 'success', '2024-05-16 08:30:37'),
(145, 765, '600', 'Muritadoh abdullahi opay', 'Transfer', 'success', '2024-05-18 12:55:37'),
(146, 789, '5000', 'Opay happiness Maryanne David ', 'Transfer ', 'failed', '2024-05-18 12:56:15'),
(147, 789, '500', 'Opay happiness Maryanne David ', 'Transfer ', 'success', '2024-05-18 12:59:46'),
(148, 787, '2000', 'Jerome precious Omaojo ', '2000', 'success', '2024-05-18 13:03:06'),
(149, 297, '1500', 'Famujimi Mary, palmpay ', 'Transfer ', 'failed', '2024-05-18 18:55:08'),
(150, 297, '1000', 'Famujimi Mary, palmpay ', 'Transfer ', 'failed', '2024-05-18 18:57:06'),
(151, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'success', '2024-05-19 19:02:30'),
(152, 82, '2000', 'Adesina Fatimoh omolara opay ', 'Transfer ', 'failed', '2024-05-19 19:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `monnify_accounts`
--

CREATE TABLE `monnify_accounts` (
  `id` int NOT NULL,
  `accountReference` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monnify_accounts`
--

INSERT INTO `monnify_accounts` (`id`, `accountReference`, `email`) VALUES
(1, '6604078fbcdac5325', 'abdullahiiaminu15@gmail.com'),
(2, '65ff484b1b40d3827', 'Abdullateefaremu915@gmail.com'),
(3, '65a6f48550bac4678', 'abdulsalamabdulkadir2005@gmail.com'),
(4, '65eb5132ab7b81829', 'agbamusunday90@gmail.com'),
(5, '660011ee9e72a6867', 'ahmeddosumu1@gmail.com'),
(6, '65ee926f8a5831895', 'ajuwonoluwa@gmail.com'),
(7, '6589ffe7b26441355', 'akponeclinton6@gmail.com'),
(8, '65ff394b7fffa3461', 'Amakapuritynwa2023@gmail.com'),
(9, '6590828cae8414211', 'amutadichioma1@gmail.com'),
(10, '6585e6b0014838677', 'anthonia1022@gmail.com'),
(11, '65a81a27a4ca71480', 'asuquomiracle7@gmail.com'),
(12, '65f227a848c0e6215', 'ayemerepraise408@gmail.com'),
(13, '66068b88dcaf58412', 'bashiribrahim09061460655@gmail.com'),
(14, '65e769183cabe1962', 'bitfundia@gmail.com'),
(15, '65bcc5bb8a6631115', 'blessingoshancletus@gmail.com'),
(16, '65f86a956ac957972', 'Chideraobiemezieuzo2021@gmail.com'),
(17, '6591b0fda5a3e1207', 'chidijeffery7@gmail.com'),
(18, '65fb1d8c921ee7549', 'Chidimigweka@gmail.com'),
(19, '65facea08f7887019', 'chidimmanwoye50@gmail.com'),
(20, '65fad7a21b8382453', 'chikwenduchiemelie12@gmail.com'),
(21, '65acf658256527778', 'chiomastevenjoy@gmail.com'),
(22, '658bab4fc5d2f2290', 'chocowire7@gmail.com'),
(23, '65adb613eee4e7185', 'chukwudiemmanuel135@gmail.com'),
(24, '6596dc7211e6f5990', 'cjude0700@gmail.com'),
(25, '660339105b31b3348', 'danielvictordaniel766@gmail.com'),
(26, '658b2dd81f30f1949', 'ebinumgodspower7@gmail.com'),
(27, '6583d832378007100', 'ebinumgreat92@gmail.com'),
(28, '6605419aa85bd4892', 'ebinumromeo30@gmail.com'),
(29, '65b251c83f8bf6438', 'Emekeosagwu892@gmail.com'),
(30, '658a153f4bfda7685', 'emryskido@gmail.com'),
(31, '659918d6203dd2083', 'enumahphilip79@gmail.com'),
(32, '65ff03dc014f22325', 'festusokeremeta@gmail.com'),
(33, '659bb1c6a97e32197', 'fidelismiracle33@gmail.com'),
(34, '65f1dde7c20925243', 'frankmelody515@gmail.com'),
(35, '65998f6d744a57626', 'fridaychristopher0808@gmail.com'),
(36, '6589357b6176f7642', 'gabriel251252@gmail.com'),
(37, '65908c89984711390', 'ggkkgkfjndn@gmail.com'),
(38, '65a6649ac716e6829', 'godstimeaillson5@gmail.com'),
(39, '658c5316b043a3416', 'greatasohro246@gmail.com'),
(40, '6597bcaf75eed3328', 'hfhfgjwisdom@gmail.com'),
(41, '658015f1ddf246394', 'hollypeerz@gmail.com'),
(42, '65ee938de5d653883', 'hussainigaddafi65@gmail.com'),
(43, '65a95a6b337a68143', 'idublessingchukuyenum@gmail.com'),
(44, '658fdf70c75406571', 'ikpejeffrey@gmail.com'),
(45, '070469946002035', 'imosemidaniel2026@gmail.com'),
(46, '657cd7b307a541156', 'investordc23@gmail.com'),
(47, '65f7e8b6f3b5f7306', 'isaacpatrick884@gmail.com'),
(48, '65b03dc606aa98380', 'isrealosham9@gmail.com'),
(49, '65919d92131a12772', 'jamiyu08@gmail.com'),
(50, '65da56c625cb18255', 'jbytess@gmail.com'),
(51, '65fdc2019e5a47001', 'jonathanfolorunsho01@gmail.com'),
(52, '65ec26c109f028680', 'Josephjidon@gmail.com'),
(53, '65ec27248ab1e6258', 'Josephjidono@gmail.com'),
(54, '6596d3fa1beb56013', 'Kelechianoke518@gmail.com'),
(55, '65feb7997ef2d5726', 'kelechilove6@gmail.com'),
(56, '65c16411745c86888', 'lanreoloworibi@gmail.con'),
(57, '65ab1a2e79f2c4118', 'lastb8421@gmail.com'),
(58, '65faf4177022b6749', 'lovinaobiekwe@gmail.com'),
(59, '658b1974830bb1494', 'luckyperdro@gmail.com'),
(60, '65ef592b55d683683', 'lucyakpere@gmail.com'),
(61, '65b017d7066801986', 'mackenziephilli67@gmail.com'),
(62, '65a6e814975f14150', 'marvelousjohn741@gmail.com'),
(63, '6592c368624eb7698', 'mbaerichukwubuikem@gmail.com'),
(64, '65f855a12af264488', 'michtopupvtutelecommunication@gmail.com'),
(65, '6600085e5d9e52945', 'mkcreativephotographer@gmail.com'),
(66, '65889b06860ca3970', 'muskidambassador@gmail.com'),
(67, '65c4134c2008b3543', 'namikesh6@gmail.com'),
(68, '65f6956bc0c326692', 'ngopress617@gmail.com'),
(69, '659d46fda0b528207', 'ngwuangel0@gmail.com'),
(70, '65b7cae55edc07084', 'ocheliprosperzar@gmail.com'),
(71, '658e8f640a7758562', 'ogbeidedivine9@gmail.com'),
(72, '659bb3c00f7af8892', 'ogunleyeolawaleezekiel@gmail.com'),
(73, '65ad51f0ee59c6959', 'ojugbelingozi5@gmail.com'),
(74, '658c538051a531465', 'okonyemadu@gmail.com'),
(75, '65ec9fb676ebb2879', 'olacoycompany@gmail.com'),
(76, '65d51ca57e9642671', 'olisehebube6@gmail.com'),
(77, '65f6969d01c7c2789', 'omelezepascal@gmail.com'),
(78, '65ce2d0e0cb8c5377', 'omowumitobiloba547@gmail.com'),
(79, '65b7cb4d35d0b7209', 'onyechichiboy64@gmail.com'),
(80, '65f73d061c0df5350', 'onyemadestiny9@gmail.com'),
(81, '6599cbbbad3341657', 'owolabiifeoluwa202@gmail.com'),
(82, '659328a9ae1954331', 'pencomylik@gmail.com'),
(83, '6596d8fc61f9d4601', 'Princejames4576@gmail.com'),
(84, '65a667fcdc36d1288', 'prosperpius97@gmail.com'),
(85, '65d1f832e6c845306', 'raptep02@gmail.com'),
(86, '65905a466f8f27647', 'rubinhoodinvestmentcompany@gmail.com'),
(87, '65edb1a2d87001119', 'salawuhamid96@gmail.com'),
(88, '65971dfbd47ef4054', 'samuelabraham915@gmail.com'),
(89, '65bb634f2b40b7361', 'shuaibui695@gmail.com'),
(90, '65e660b932bd57942', 'tepballers01@gmail.com'),
(91, '65ca9116017958432', 'ubongdemaga@yahoo.com'),
(92, '65ed95638569c7180', 'ulehmargaret5@gmail.com'),
(93, '65941de7d21282447', 'victoriaokoedion@gmail.com'),
(94, '65ab002fa0d615392', 'wintosam@gmail.com'),
(95, '659958f62a17f7086', 'youngscott960@gmail.com'),
(96, '65f1e68e824273692', 'yungextprof@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `networkid`
--

CREATE TABLE `networkid` (
  `nId` int NOT NULL,
  `networkid` varchar(10) NOT NULL,
  `smeId` varchar(10) NOT NULL,
  `giftingId` varchar(10) NOT NULL,
  `corporateId` varchar(10) NOT NULL,
  `vtuId` varchar(10) NOT NULL,
  `sharesellId` varchar(10) NOT NULL,
  `network` varchar(20) NOT NULL,
  `networkStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `vtuStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `sharesellStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `airtimepinStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `smeStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `giftingStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `corporateStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `datapinStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `manualOrderStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `momoStatus` varchar(10) NOT NULL DEFAULT 'Off',
  `sme2Id` varchar(20) NOT NULL,
  `sme2Status` varchar(20) NOT NULL,
  `rId` varchar(10) NOT NULL,
  `dId` varchar(10) NOT NULL,
  `couponStatus` varchar(10) NOT NULL,
  `couponId` varchar(10) NOT NULL,
  `dataId` varchar(10) NOT NULL,
  `dataStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `networkid`
--

INSERT INTO `networkid` (`nId`, `networkid`, `smeId`, `giftingId`, `corporateId`, `vtuId`, `sharesellId`, `network`, `networkStatus`, `vtuStatus`, `sharesellStatus`, `airtimepinStatus`, `smeStatus`, `giftingStatus`, `corporateStatus`, `datapinStatus`, `manualOrderStatus`, `momoStatus`, `sme2Id`, `sme2Status`, `rId`, `dId`, `couponStatus`, `couponId`, `dataId`, `dataStatus`) VALUES
(1, '1', '1', '1', '1', '1', '1', 'MTN', 'On', 'On', 'Off', 'On', 'On', 'On', 'On', 'On', '', '1', '1', 'On', '1', '1', 'On', '1', '1', 'On'),
(2, '2', '4', '4', '2', '3', '2', 'GLO', 'On', 'On', 'Off', 'On', 'On', 'On', 'On', 'On', '', '3', '2', 'On', '2', '3', 'On', '2', '4', 'On'),
(3, '4', '3', '4', '3', '4', '3', '9MOBILE', 'On', 'On', 'Off', 'On', 'Off', 'Off', 'On', 'Off', 'Off', 'Off', '3', 'Off', '5', '5', 'Off', '3', '1', 'Off'),
(4, '3', '3', '2', '2', '2', '4', 'AIRTEL', 'On', 'On', 'Off', 'On', 'On', 'On', 'On', 'On', '', '4', '4', 'On', '4', '4', 'On', '2', '4', 'On');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `msgId` int NOT NULL,
  `msgfor` tinyint NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `dPosted` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`msgId`, `msgfor`, `subject`, `message`, `status`, `dPosted`) VALUES
(331, 3, 'Good Day Business Partners ', 'Welcome Back!!!', 0, '2025-06-06 05:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `transid` varchar(255) NOT NULL,
  `placeholder` varchar(255) NOT NULL,
  `idNumber` varchar(100) NOT NULL,
  `response` text NOT NULL,
  `slip` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sitesettings`
--

CREATE TABLE `sitesettings` (
  `sId` int NOT NULL,
  `sitename` varchar(20) DEFAULT NULL,
  `siteurl` varchar(100) DEFAULT NULL,
  `agentupgrade` varchar(20) DEFAULT NULL,
  `vendorupgrade` varchar(20) DEFAULT NULL,
  `apidocumentation` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `whatsappgroup` varchar(100) DEFAULT NULL,
  `facebook` varchar(1000) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `telegram` varchar(100) DEFAULT NULL,
  `referalupgradebonus` float NOT NULL DEFAULT '100',
  `referalairtimebonus` float NOT NULL DEFAULT '1',
  `referaldatabonus` float NOT NULL DEFAULT '1',
  `referalwalletbonus` float NOT NULL DEFAULT '1',
  `referalcablebonus` float NOT NULL DEFAULT '1',
  `referalexambonus` float NOT NULL DEFAULT '1',
  `referalmeterbonus` float NOT NULL DEFAULT '1',
  `wallettowalletcharges` float NOT NULL DEFAULT '50',
  `sitecolor` varchar(10) NOT NULL DEFAULT '#0000e6',
  `logindesign` varchar(10) NOT NULL DEFAULT '5',
  `homedesign` varchar(10) NOT NULL DEFAULT '5',
  `notificationStatus` varchar(5) NOT NULL DEFAULT 'Off',
  `accountname` varchar(50) DEFAULT NULL,
  `accountno` varchar(15) DEFAULT NULL,
  `bankname` varchar(20) DEFAULT NULL,
  `electricitycharges` varchar(5) DEFAULT NULL,
  `airtimemin` varchar(10) NOT NULL DEFAULT '50',
  `airtimemax` varchar(10) NOT NULL DEFAULT '500',
  `smilediscount` varchar(3) DEFAULT NULL,
  `kycOption` varchar(5) NOT NULL DEFAULT 'nin',
  `kycBvnCharges` varchar(5) NOT NULL DEFAULT '5',
  `kycNinCharges` varchar(5) NOT NULL DEFAULT '30',
  `kycShouldVerify` varchar(5) NOT NULL DEFAULT 'no',
  `kycShouldEnable` varchar(5) NOT NULL DEFAULT 'yes',
  `registrationEnable` varchar(10) NOT NULL DEFAULT 'on'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sitesettings`
--

INSERT INTO `sitesettings` (`sId`, `sitename`, `siteurl`, `agentupgrade`, `vendorupgrade`, `apidocumentation`, `phone`, `email`, `whatsapp`, `whatsappgroup`, `facebook`, `twitter`, `instagram`, `telegram`, `referalupgradebonus`, `referalairtimebonus`, `referaldatabonus`, `referalwalletbonus`, `referalcablebonus`, `referalexambonus`, `referalmeterbonus`, `wallettowalletcharges`, `sitecolor`, `logindesign`, `homedesign`, `notificationStatus`, `accountname`, `accountno`, `bankname`, `electricitycharges`, `airtimemin`, `airtimemax`, `smilediscount`, `kycOption`, `kycBvnCharges`, `kycNinCharges`, `kycShouldVerify`, `kycShouldEnable`, `registrationEnable`) VALUES
(1, 'Blazesub', 'https://blazesub.com', '20000', '30000', 'https://blazesub.com', '#', 'support@blazesub.com', '#', '#', '#', '#', '#', '#', 100, 0, 0, 0, 0, 0, 0, 1000000000, '#f81f44', '3', '5', 'On', '', '', 'Palmpay', '0', '50', '500', '', 'nin', '', '', 'no', 'no', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `strowallet_accounts`
--

CREATE TABLE `strowallet_accounts` (
  `id` int NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `bankly` varchar(20) DEFAULT NULL,
  `safehaven` varchar(20) DEFAULT NULL,
  `paga` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `sId` int NOT NULL,
  `sApiKey` varchar(200) NOT NULL,
  `sFname` varchar(50) NOT NULL,
  `sLname` varchar(50) NOT NULL,
  `sEmail` varchar(50) DEFAULT NULL,
  `sPhone` varchar(20) NOT NULL,
  `sPass` varchar(150) NOT NULL,
  `sState` varchar(50) NOT NULL,
  `sPin` int NOT NULL DEFAULT '1234',
  `sPinStatus` tinyint DEFAULT '0',
  `sType` tinyint NOT NULL DEFAULT '1',
  `sWallet` float NOT NULL DEFAULT '0',
  `sRefWallet` float NOT NULL DEFAULT '0',
  `sBankNo` varchar(20) DEFAULT NULL,
  `sRolexBank` varchar(20) DEFAULT NULL,
  `sSterlingBank` varchar(20) DEFAULT NULL,
  `sFidelityBank` varchar(20) DEFAULT NULL,
  `sBankName` varchar(30) DEFAULT NULL,
  `sRegStatus` tinyint NOT NULL DEFAULT '3',
  `sVerCode` smallint NOT NULL DEFAULT '0',
  `sRegDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sLastActivity` datetime DEFAULT NULL,
  `sReferal` varchar(15) DEFAULT NULL,
  `sVirtualAccountRef` varchar(200) DEFAULT NULL,
  `sBvn` varchar(40) DEFAULT NULL,
  `sNin` varchar(40) DEFAULT NULL,
  `sDob` varchar(40) DEFAULT NULL,
  `sKycStatus` varchar(15) DEFAULT NULL,
  `accountReference` varchar(50) DEFAULT NULL,
  `sPayvesselBank` varchar(30) DEFAULT NULL,
  `pVerify` varchar(255) DEFAULT NULL,
  `sAccountLimit` varchar(255) DEFAULT NULL,
  `sAsfiyBank` varchar(255) DEFAULT NULL,
  `sPaga` varchar(255) DEFAULT NULL,
  `sBellBank` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`sId`, `sApiKey`, `sFname`, `sLname`, `sEmail`, `sPhone`, `sPass`, `sState`, `sPin`, `sPinStatus`, `sType`, `sWallet`, `sRefWallet`, `sBankNo`, `sRolexBank`, `sSterlingBank`, `sFidelityBank`, `sBankName`, `sRegStatus`, `sVerCode`, `sRegDate`, `sLastActivity`, `sReferal`, `sVirtualAccountRef`, `sBvn`, `sNin`, `sDob`, `sKycStatus`, `accountReference`, `sPayvesselBank`, `pVerify`, `sAccountLimit`, `sAsfiyBank`, `sPaga`, `sBellBank`) VALUES
(138, '2fBGhxcatxBcxbdCJqn4CrB2EFA1AHy9AowICzeA97v8BbCkAi7l33CC652B1768387131', 'saheed', 'saheed', 'melogist.com@gmail.com', '09132018017', '6c04d59bd8', 'Lagos', 1234, 0, 1, 652, 0, NULL, NULL, NULL, NULL, NULL, 0, 5159, '2026-01-14 10:38:51', '2026-01-14 12:20:04', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '32pwm71Bcv3o3xb6kdhxAC24x90fACAcAJEBArB52qCgs8HAnAiCD9CblCCB1768391702', 'Adebisi', 'Covenant', 'adebisicovenant01@gmail.com', '09031704109', 'fcfe772de7', 'Bauchi', 4559, 0, 1, 1000, 0, NULL, NULL, NULL, NULL, NULL, 0, 2057, '2026-01-14 11:55:02', '2026-01-14 14:09:45', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sysusers`
--

CREATE TABLE `sysusers` (
  `sysId` int NOT NULL,
  `sysName` varchar(50) NOT NULL,
  `sysRole` tinyint NOT NULL,
  `sysUsername` varchar(20) NOT NULL,
  `sysToken` varchar(30) NOT NULL,
  `sysStatus` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sysusers`
--

INSERT INTO `sysusers` (`sysId`, `sysName`, `sysRole`, `sysUsername`, `sysToken`, `sysStatus`) VALUES
(1, 'Blaze Sub', 1, 'admin', 'admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tId` int NOT NULL,
  `sId` int NOT NULL,
  `transref` varchar(255) NOT NULL,
  `servicename` varchar(100) NOT NULL,
  `servicedesc` varchar(255) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `status` tinyint NOT NULL,
  `oldbal` varchar(100) NOT NULL,
  `newbal` varchar(100) NOT NULL,
  `profit` float NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `api_response_log` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`tId`, `sId`, `transref`, `servicename`, `servicedesc`, `amount`, `status`, `oldbal`, `newbal`, `profit`, `date`, `api_response_log`) VALUES
(4816, 138, '64481768387637', 'Wallet Credit', 'Wallet Credit of N1000 for user melogist.com@gmail.com. Reason: Funding', '1000', 0, '0', '1000', 0, '2026-01-14 11:47:17', NULL),
(4817, 138, 'AIRTIME696_86371768387647', 'Airtime', 'MTN Airtime purchase of N100 for phone number 09036155265', '98', 1, '1000', '1000', 0, '2026-01-14 11:48:55', '{\"status\":false,\"code\":424,\"data\":{\"message\":\"Failed API authorisation. Partner new balance is \"},\"time\":\"2026-14-01 11:48:57\"}'),
(4818, 138, 'AIRTIME493_86371768387647', 'Airtime', 'MTN Airtime purchase of N100 for phone number 09036155265', '98', 1, '1000', '1000', 0, '2026-01-14 11:50:22', '{\"msg\":\"Invalid Authorization. Confirm your secret key\"}'),
(4819, 138, 'AIRTIME276_76331768387822', 'Airtime', 'MTN Airtime purchase of N100 for phone number 09036155265', '98', 1, '1000', '1000', 0, '2026-01-14 11:50:46', '{\"msg\":\"Invalid Authorization. Confirm your secret key\"}'),
(4820, 138, 'AIRTIME614_76331768387822', 'Airtime', 'MTN Airtime purchase of N100 for phone number 09036155265', '98', 0, '1000', '902', 0.7, '2026-01-14 11:51:28', '{\"status\":true,\"data\":{\"reference\":\"ff07ff633a0d1680c07e\",\"msg\":\"NGN100 airtime purchase for 09036155265\",\"balance_after\":2818,\"amount\":98}}'),
(4821, 138, 'DATA665_22721768387979', 'Data', 'Purchase of MTN 1 GB SME 2 Days Plan for phone number 08105125077', '200', 1, '902', '902', 0, '2026-01-14 11:53:19', '{\"status\":false,\"msg\":\"Invalid data plan selected\"}'),
(4822, 138, 'DATA214_84601768388113', 'Data', 'Success.. TxnId: NXTGENMM202601141155330000006044 | Sponsor Balance: N4,916.00', '250', 0, '902', '652', 150, '2026-01-14 11:55:30', '{\"status\":true,\"data\":{\"current_status\":\"success\",\"reference\":\"ab4b9beca89e1e4ccbaa\",\"msg\":\"Success.. TxnId: NXTGENMM202601141155330000006044 | Sponsor Balance: N4,916.00\",\"balance_after\":0,\"amount\":200}}'),
(4823, 139, 'AIRTIME936_65441768392126', 'Airtime', 'MTN Airtime purchase of N50 for phone number 09031704109', '49', 1, '1000', '1000', 0, '2026-01-14 13:02:25', '{\"msg\":\"Invalid Authorization. Confirm your secret key\"}'),
(4824, 139, 'AIRTIME414_96571768393482', 'Airtime', 'MTN Airtime purchase of N50 for phone number 09031704109', '49', 1, '1000', '1000', 0, '2026-01-14 13:34:39', '{\"msg\":\"Invalid Authorization. Confirm your secret key\"}'),
(4825, 139, 'AIRTIME102_81141768394079', 'Airtime', 'MTN Airtime purchase of N50 for phone number 09031704109', '49', 1, '1000', '1000', 0, '2026-01-14 13:34:54', '{\"msg\":\"Invalid Authorization. Confirm your secret key\"}'),
(4826, 139, 'AIRTIME266_88181768395813', 'Airtime', 'MTN Airtime purchase of N50 for phone number 09031704109', '49', 1, '1000', '1000', 0, '2026-01-14 14:03:45', '{\"message\":\"Authentication failed.\",\"status\":\"002\"}'),
(4827, 139, 'AIRTIME985_89161768395825', 'Airtime', 'MTN Airtime purchase of N50 for phone number 09031704109', '49', 1, '1000', '1000', 0, '2026-01-14 14:09:44', '{\"message\":\"Authentication failed.\",\"status\":\"002\"}');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `token` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `user`, `token`) VALUES
(39, 2, '1727970980AHwpJtnmsE915'),
(40, 3, '1727971420zklFytpHvJ231'),
(41, 3, '1727971498krqxswmGFz143'),
(47, 2, '1727976057qCxItHlGFm116'),
(48, 2, '1727976137xBtywGJpIE872'),
(62, 2, '1728062214EyoCprvHmw498'),
(73, 2, '1728235374HGrBtDJoCk700'),
(131, 7, '1728753161oHqDpnGmAw302'),
(136, 8, '1728775165xAoFGrnmJl216'),
(137, 8, '1728775220HIoqAFxmwC643'),
(138, 7, '1728798104CwtsmlDyxp310'),
(142, 8, '1728834202BtvlyxkqAC798'),
(143, 8, '1728834202vlGpCqrkDA156'),
(147, 8, '1728898433mGxqyAEwnv401'),
(148, 8, '1728898593CJtwFkqxvz875'),
(151, 8, '1728939208wlDvokHEpx902'),
(156, 8, '1729076886HxvEysFCwn458'),
(157, 8, '1729077003HzCJDmlGnA870'),
(158, 8, '1729077153slqGnHArtw548'),
(159, 8, '1729090138wyrsAkBvzl676'),
(162, 9, '1729108382oGsCFxDzAt162'),
(165, 7, '1729164297rJFEDxCAop502'),
(166, 9, '1729192400nmvAICBkFz762'),
(167, 9, '1729192602qoJHytrnFz468'),
(172, 8, '1729248167lxvBrsIozJ795'),
(173, 8, '1729259997GxkvqAEwHm404'),
(174, 8, '1729268465ozCAsFIDJt664'),
(175, 8, '1729269616BpzsGrCoyA393'),
(177, 9, '1729290688qlDxFzmArk375'),
(180, 10, '1729329662wEonJBCyzl220'),
(181, 10, '1729329752sHJGmqknIo903'),
(182, 10, '1729329931FynqAtsCIv210'),
(183, 10, '1729330063nkIxCzvmGw691'),
(190, 12, '1729349849pJAlGwBkCm585'),
(191, 12, '1729350959nszkGFExAD531'),
(192, 12, '1729351063JwysECmpIt784'),
(193, 12, '1729351253vpAxqnEFso456'),
(204, 9, '1729410695ByJtqvImDC412'),
(205, 7, '1729411959rmAoBJFIsH655'),
(207, 7, '1729412161xwHsrmkDoC583'),
(208, 7, '1729412161svnwDtJoGm325'),
(209, 7, '1729412182nolEtvrFJz196'),
(210, 9, '1729419149DAowkxztBI556'),
(211, 9, '1729458075ytEJADowxn758'),
(212, 9, '1729536023ktnCpxvBmw265'),
(214, 8, '1729540570vsCFJEwlpD622'),
(215, 8, '1729540716mEqBHFJDso511'),
(216, 8, '1729540768pqzEnDmrGH499'),
(217, 8, '1729540899ntsFBCkIGx609'),
(218, 8, '1729541227EDHJkBwmvs689'),
(219, 9, '1729585126ApHrGJzmoI234'),
(221, 9, '1729601696xDlyCzHtJm432'),
(237, 9, '1729859296CFqlEsxGJn932'),
(238, 9, '1729863960xyEqnAFCwt960'),
(241, 9, '1729869569EsGpxCwzly270'),
(250, 14, '1729892164zrmwBtpnvC734'),
(251, 15, '1729919650sJCzqwBoxk631'),
(254, 15, '1729931833GvolBtEsID349'),
(255, 15, '1729951324pyokAnEwqI770'),
(257, 15, '1729962398DrqpHwvIms207'),
(258, 9, '1729967182qtzlxoIpAy373'),
(260, 10, '1730009208osFAtkHzlE140'),
(261, 10, '1730009251AyvqkDHGEI804'),
(262, 10, '1730009278HGmxIvsnEy467'),
(263, 10, '1730011875sznBwHxDrp975'),
(264, 16, '1730021984vxnJCqozAp776'),
(266, 15, '1730050744BIprmHkJtz360'),
(269, 10, '1730135278rslHwBvyxq253'),
(270, 10, '1730139487mElypoFtwC725'),
(271, 7, '1730143116DwoqkJlBIC684'),
(272, 7, '1730143116AlwFBkstmn619'),
(273, 7, '1730143116osJFryxtCq365'),
(274, 7, '1730143116kzIAwsqDEr195'),
(275, 7, '1730143116vBFADowpHk278'),
(276, 16, '1730147212HCDotFzslv358'),
(277, 7, '1730149488xDskJCyqlv371'),
(280, 15, '1730224448pxyCzItoGq671'),
(283, 7, '1730263745AGJDtIFwls563'),
(284, 10, '1730275597xsBEoAtDqJ394'),
(285, 15, '1730285996pkCJvElxqI880'),
(286, 15, '1730286092zprEFCAlxs995'),
(291, 9, '1730315340IzFvypEsDk291'),
(292, 9, '1730315538qCkxJEtvDm421'),
(293, 9, '1730315843GHECytsDmw641'),
(294, 9, '1730316119FlzrvmnGBo473'),
(295, 9, '1730318869IwvtxmpsEG882'),
(296, 9, '1730321989lpGEszwInH714'),
(299, 7, '1730352874tFCvBqyxDs976'),
(302, 10, '1730364720zJlvpwsFxE901'),
(304, 9, '1730366087kEwnpBGHCI399'),
(306, 10, '1730366724IFtAExsnml275'),
(307, 10, '1730366736DmoJBkGtrH582'),
(308, 10, '1730366766GkHoxnyrDJ472'),
(311, 10, '1730371236BopwlsxJkG610'),
(313, 10, '1730375792tsBJkxylpm394'),
(329, 7, '1730394401qyokCsJznI480'),
(340, 14, '1730412955BzCExtpHFJ258'),
(346, 15, '1730451745nHEympovBt983'),
(391, 9, '1730464592rxCkytJHmp304'),
(398, 9, '1730471875oCDsvxqrGl574'),
(409, 15, '1730487894xFIksEJDlv187'),
(423, 9, '1730496020mGvzBqwoFD280'),
(441, 8, '1730559224zqlBGxAFwC129'),
(442, 8, '1730559224kmBqGxtloy550'),
(443, 8, '1730559741AGpkEtyCoz729'),
(444, 9, '1730565192AEmkpqwGBt983'),
(445, 10, '1730567408GEwmslrBny176'),
(446, 15, '1730568088AIwslCyJnE852'),
(451, 9, '1730579839HsrnICAFoq777'),
(452, 9, '1730582521IyAptmnlwv259'),
(453, 8, '1730592982CmtqEpyHDo966'),
(454, 8, '1730594685EDkqrlFzoG430'),
(457, 10, '1730623973EkvFGoypHt784'),
(463, 9, '1730667794qDpEoyzmGF869'),
(464, 9, '1730667815GxJIrHklBA954'),
(465, 9, '1730724286skwlpBnEyo523'),
(466, 9, '1730724781ynqEvozJCs744'),
(475, 15, '1730734689kDxvHtAnpG337'),
(477, 15, '1730734860zJolpswHtn725'),
(505, 10, '1730747422vrlHDknwFp681'),
(526, 44, '1730824757ExtozHBAkF319'),
(527, 44, '1730824811tJxrFGvoIk979'),
(528, 44, '1730824878HvkmwyqxFI118'),
(530, 10, '1730827351txCkzFqmGJ440'),
(534, 10, '1730833525sBDqFtvHCA160'),
(535, 14, '1730835596tBnIpFyxHm799'),
(537, 8, '1730839394nDtmAsGrpx242'),
(540, 8, '1730849215ywIBlqtpGn402'),
(566, 50, '1731010398vyGwJxInmz973'),
(567, 9, '1731010855mxGvsyBHpD456'),
(575, 9, '1731047606BsDCnmFIpw772'),
(578, 9, '1731063081zCJvBGInFs137'),
(580, 9, '1731075751AzstFHrvmE964'),
(583, 14, '1731082771rtmGvDlyFJ720'),
(584, 8, '1731086111kFCroHvyJD459'),
(586, 9, '1731097541sCrzkIyqlB358'),
(595, 8, '1731152184oFvnsxDkmJ199'),
(601, 44, '1731230562EkoBmAlHpC656'),
(612, 14, '1731316156kwErnImDAo322'),
(616, 52, '1731339726CFsHpIGolm290'),
(618, 9, '1731354659qCrDxpAElB949'),
(619, 9, '1731356218kyIAsBqxJG183'),
(620, 9, '1731358475CslvJqBwtz724'),
(623, 52, '1731368221BHnlGIkwJC738'),
(625, 14, '1731416280yEBDloktxz523'),
(628, 9, '1731439481rvmGABzsqp641'),
(629, 15, '1731443565CsmEGnklyp538'),
(630, 14, '1731487991CksADqmFpB634'),
(634, 53, '1731530332xHsCmlrDBy346'),
(635, 15, '1731567063ysArFvIzmn411'),
(637, 15, '1731584493zynmDvIFEG683'),
(642, 15, '1731652257zymBpvCHst250'),
(643, 9, '1731658711mnHvJBIEDy688'),
(649, 3, '1731694443qyGBotEwpz309'),
(654, 15, '1731746560smAyCHxroB273'),
(656, 8, '1731762364yDJqvFABlm944'),
(658, 54, '1731774891pHrJyBAzml665'),
(661, 55, '1731785997qIrBFklsAx854'),
(662, 56, '1731792227JykwpEAHts217'),
(666, 7, '1731839506CpoIEqvJks436'),
(667, 7, '1731839518sCmxqJGFrE586'),
(668, 7, '1731840018sqEtJDorvB418'),
(669, 7, '1731840386CAwzytEkrJ546'),
(670, 57, '1731840527ECAHBGkwvl901'),
(676, 60, '1731849995DGFBzvnxqI394'),
(677, 15, '1731858201CyEmzAlBnD114'),
(679, 60, '1731860265GvtDEpCIyq144'),
(680, 60, '1731870573DyEqsIGzJC334'),
(682, 15, '1731871237JrtyEnGmok937'),
(684, 61, '1731871701xyvnGDBtpz346'),
(694, 60, '1731917901lyvJHoCFxt707'),
(696, 9, '1731966224ClAypvEzDq636'),
(698, 15, '1732005359xDmykznvAw390'),
(702, 9, '1732013010nEqtBlCAFH246'),
(710, 68, '1732086409mAJyoslHCt884'),
(711, 68, '1732086519yBlxEwmJsF328'),
(712, 69, '1732087222EztynqvosG885'),
(713, 70, '1732100079AHvzstECBo436'),
(715, 9, '1732108622kqmvwDlCIz280'),
(717, 9, '1732125123zqFlwAxvkC541'),
(720, 70, '1732192376AoCknGlHzE412'),
(721, 71, '1732194850BpIDlwqzor523'),
(722, 71, '1732195058DFJCqGvtmy939'),
(723, 71, '1732195139mEHpFrBAto390'),
(725, 15, '1732200669ECvBqAxDJy900'),
(726, 52, '1732203080pFEmDytrsv309'),
(728, 15, '1732253171xmqBoJysnp649'),
(731, 15, '1732278399xJCwAyrnlk366'),
(733, 15, '1732288543BvGwlIHzrm402'),
(737, 12, '1732305513pAJIyoEHlt565'),
(741, 7, '1732345645HIFrpAkost991'),
(742, 7, '1732345741qFEDxlzJBI530'),
(744, 15, '1732353283GnlFCwxyJI455'),
(746, 73, '1732362539AGnBJxDIEw364'),
(750, 15, '1732384791kqwtzDoGsp995'),
(751, 15, '1732385447FskqzBmEGp962'),
(752, 9, '1732392967ymJzvBlknI791'),
(753, 9, '1732393209zksvDyEtxl169'),
(757, 10, '1732444000JDHECyskxq912'),
(760, 15, '1732449431IFplADvGxn500'),
(761, 12, '1732458419qvHJDwtmzA851'),
(762, 10, '1732464462vkEAwCBFIx795'),
(763, 12, '1732475370GsmtnvHzJo127'),
(765, 15, '1732525833xtoFGHIyvn372'),
(767, 15, '1732539096sxzGDFnrqv540'),
(769, 15, '1732550684osvHpGFAID739'),
(770, 12, '1732553815xzIEACGJoy181'),
(777, 15, '1732635513lzwqCGsFmo461'),
(778, 9, '1732663012tmrxnJsDFv376'),
(779, 9, '1732663230ExrwvDyHon208'),
(780, 7, '1732685423rGHyACokwt292'),
(781, 7, '1732686429poJvHIzDqk980'),
(783, 15, '1732697528psrGEmwDxz663'),
(785, 15, '1732718599CBrzoqmwys628'),
(786, 15, '1732718632lFvHomGtDA773'),
(787, 9, '1732722583JqstpBvlyo323'),
(789, 12, '1732728000GoJHrzAwCs163'),
(791, 9, '1732742907CFsxknEDyr878'),
(792, 9, '1732743063JGtBAxrsnw838'),
(794, 7, '1732785908oJCyBtHzAv310'),
(795, 7, '1732786111nCJpsDtAEr314'),
(796, 7, '1732786367pGwrAznyED627'),
(797, 15, '1732817312HsJxqnBEFr455'),
(798, 9, '1732819877yIGBJFDzHx833'),
(802, 74, '1732876525yzkICEDnJF657'),
(803, 9, '1732884443AGBrnwmDsH969'),
(804, 15, '1732888161tpsDGFlnEx682'),
(805, 15, '1732888260wzClqrBHGy321'),
(807, 75, '1732900971rzotBqEwHl671'),
(810, 9, '1732903426pnozGqtBIC270'),
(811, 75, '1732903497qvrotsBkxm854'),
(812, 9, '1732904602BHlsAyDvtn388'),
(813, 75, '1732904893pEmJoGIyBx542'),
(818, 75, '1732939493FwrCAqmEGD906'),
(819, 75, '1732940637sEroCwHnlA261'),
(824, 15, '1732958993yJCDEHpAnx532'),
(825, 15, '1732961284IpyvlxDwJm795'),
(827, 75, '1732977773oFJpEsmvnA904'),
(831, 15, '1733041512wpmsqEkyAI729'),
(833, 15, '1733042975JCBHqDEvln378'),
(834, 75, '1733042991vGoDkntwry287'),
(835, 15, '1733043352ADqEytplvB717'),
(836, 15, '1733043489yCzxEntkoI804'),
(837, 75, '1733044991nzrtECmGHq853'),
(838, 75, '1733049886HsvntIxAmy284'),
(839, 10, '1733058537vlJkCqFHrx139'),
(840, 15, '1733061111CmkAJzEGvs526'),
(842, 9, '1733067348wzCBsnAqkJ145'),
(843, 15, '1733071595vIkqGxyspz426'),
(847, 75, '1733102690nIHoBGDJFs102'),
(848, 15, '1733118676mvnCykIoDF956'),
(850, 75, '1733120959HwErIymFGl584'),
(852, 9, '1733132608rJzyFExklA755'),
(857, 75, '1733149953BtsnDxGEkl726'),
(862, 75, '1733156446wHFotyszAq355'),
(864, 9, '1733174136zosFCpJBxG321'),
(867, 9, '1733225140kJHoxInAst785'),
(868, 9, '1733243370AnqEzIlpyC124'),
(869, 75, '1733244979lIqAmvHrtB156'),
(870, 75, '1733247286rkxGyDFCBJ729'),
(871, 9, '1733250091IlDHAJoxqG659'),
(873, 75, '1733257016AkGCJHnBDt930'),
(875, 76, '1733259569lqpAzCnDom253'),
(876, 76, '1733260155mwHDqonIGr430'),
(877, 75, '1733260479oCsIwHxvyq246'),
(882, 76, '1733263042JlyEqmkGCs848'),
(893, 76, '1733347292AxnpHqGyms309'),
(894, 76, '1733347609FJvzlmqDpk945'),
(896, 76, '1733409501rDkxlIvpBG965'),
(897, 76, '1733429548xFsymrzokn695'),
(900, 76, '1733438055rznHqlwyFA535'),
(901, 76, '1733438529qICxolwsrH351'),
(905, 76, '1733445592lmpFGEryCI100'),
(906, 76, '1733447711yDrvJozqmI703'),
(908, 76, '1733474740qDCGJkItzH333'),
(909, 76, '1733475813FIypAoDCBH970'),
(912, 76, '1733478581AHrJvyEDwk491'),
(914, 76, '1733483038DCtGsBvzEk795'),
(917, 76, '1733485223vqxJDmlGBn579'),
(926, 75, '1733496491npxoqvmGwC921'),
(927, 15, '1733498320nwFolEGIrs859'),
(929, 75, '1733499689rsoFtBvxnl232'),
(932, 74, '1733501067yxGAwvpCIE343'),
(933, 75, '1733506276mtxonwplAG818'),
(938, 75, '1733519963GkJyCEslpr614'),
(942, 10, '1733573458JpBysICzlG693'),
(943, 10, '1733576853okqtzEnwmy667'),
(944, 76, '1733580397CDlvqBrpoE741'),
(946, 75, '1733581638wGJlIpBAvr433'),
(947, 75, '1733583946BynqGHJtro690'),
(948, 10, '1733585585zIkGpFrsHJ471'),
(949, 15, '1733589169nlFmrHwzxp567'),
(950, 15, '1733589212lyorExwmsG940'),
(951, 15, '1733589217GEstnHCADp242'),
(952, 15, '1733589229CpBwAytJoG708'),
(954, 75, '1733594021DCJvrEwGqn768'),
(955, 10, '1733595450xsCwvpyzFH443'),
(956, 10, '1733601087JwqBkDsytl997'),
(960, 76, '1733608987lrIEGvmtFJ294'),
(961, 76, '1733610245xErHqGtwBA494'),
(962, 10, '1733620568IykvJrqAtn723'),
(964, 76, '1733621915JFHpoqlnzs160'),
(967, 15, '1733638812oqkCspvDIn365'),
(968, 75, '1733646990qBAzDrJwkl127'),
(970, 10, '1733653339roFyDpxJml549'),
(971, 75, '1733668946nAIJFGDExk394'),
(974, 78, '1733700431nprwtFHJGB617'),
(976, 75, '1733706872CpBIFtvArz427'),
(977, 75, '1733740303oqBsrIJytl724'),
(981, 79, '1733757625CHwrGxysDv766'),
(982, 14, '1733758750oCAyqlGxsB250'),
(983, 15, '1733759236rnJACBlIHk746'),
(984, 10, '1733768961pCmxDtHrGl767'),
(987, 10, '1733772762AxwpokGDHq437'),
(988, 10, '1733780194yJrGnmplkx690'),
(989, 80, '1733784064olqCAJwInF712'),
(990, 80, '1733784106kGpIwrlBsm958'),
(992, 82, '1733786565CEmlrzvqFw390'),
(993, 83, '1733786950CEmJrvlkBH479'),
(995, 84, '1733820379BvkoDAIrtp205'),
(997, 85, '1733821374CtnJImGwAo443'),
(998, 85, '1733834803IqplsFxmwr707'),
(1000, 85, '1733841749txJksrHDow254'),
(1001, 86, '1733843826zlEIBpADok361'),
(1002, 75, '1733844114wqsnDkzEBF642'),
(1003, 79, '1733845241qorHyvtIFJ428'),
(1004, 85, '1733848009kEsmBIAtnJ365'),
(1005, 10, '1733852823GlrBxFCkzt202'),
(1006, 87, '1733856138rGJwmlokAB588'),
(1007, 7, '1733856482EsJlBxArqG251'),
(1008, 87, '1733856619IsClkJGtBn221'),
(1009, 87, '1733857615EByzJGkpDw967'),
(1011, 76, '1733861398GFJxrwEpqA721'),
(1012, 87, '1733862647DnzoCyqptG726'),
(1013, 87, '1733868378txqFEvwJmr157'),
(1015, 10, '1733895194skoCHwGFnt648'),
(1016, 87, '1733900256kqrFzBpmHx674'),
(1017, 87, '1733901541olvGpHDEIr877'),
(1018, 87, '1733902092CyBpEsrIwA920'),
(1020, 75, '1733912581nDowlskzqB753'),
(1021, 75, '1733913220ryJvnEmkzH665'),
(1022, 75, '1733913565nkyIrpJtvm255'),
(1023, 88, '1733916146wypIqkosFn230'),
(1027, 9, '1733924825BvEkpCtmFo644'),
(1028, 15, '1733926816JFBzoIptHw268'),
(1029, 75, '1733926844xFqIAozDvr191'),
(1030, 9, '1733927016yArIlzCJGs752'),
(1033, 87, '1733955354BACGlsynwz255'),
(1035, 75, '1733990470psvqltJFEA709'),
(1036, 85, '1734000673poGrsklJIm415'),
(1038, 9, '1734004850JGkoDEBwAm303'),
(1039, 10, '1734017458kzBHnGCFxo538'),
(1040, 10, '1734019732GEoxqDpFBI713'),
(1042, 75, '1734039518InEmztpHqx106'),
(1043, 88, '1734042256vBEksyCwAo184'),
(1044, 89, '1734065573mwoznlpACG301'),
(1045, 10, '1734071931nBlDqCtkxH681'),
(1047, 88, '1734077460wvFIEDClsk383'),
(1048, 9, '1734077770kxIovnpADC737'),
(1049, 9, '1734078425roIGqlnJwH270'),
(1050, 9, '1734078462zvonFrACxH974'),
(1059, 91, '1734096435myFCsxBHqt805'),
(1060, 14, '1734103662smxvIEwJBq562'),
(1061, 9, '1734114866zCplqBwoFm708'),
(1063, 9, '1734121075rwmBxJpCEI293'),
(1065, 9, '1734158153JoIGzvqrws301'),
(1066, 9, '1734158553AlpkzsvIFE105'),
(1067, 88, '1734161097tqFzImEypk613'),
(1071, 10, '1734186597nzCtqskIxE782'),
(1072, 15, '1734201843rAvCBqIxoz483'),
(1073, 10, '1734203036plnByCDEAo373'),
(1074, 75, '1734204727BJlInAtyxv365'),
(1075, 85, '1734206593IEyHtqFnxr261'),
(1077, 9, '1734209006kpDBCInAvr392'),
(1078, 15, '1734210054slBotyDrIn385'),
(1079, 9, '1734210789BDIvzlEmpx966'),
(1081, 85, '1734217510ElBszxrDtF695'),
(1082, 88, '1734247191zrJtxwEIkG664'),
(1083, 9, '1734249958wFmJxBEzvs144'),
(1085, 9, '1734258599zBvJEDAkyH134'),
(1086, 9, '1734266800nCyEswtxoF964'),
(1088, 9, '1734267763ylpBkrvmCn637'),
(1089, 10, '1734277439AskzIDvFBy100'),
(1091, 85, '1734287047BCrEymsIxJ954'),
(1093, 85, '1734294964GqsBxpIory641'),
(1096, 60, '1734328182AGsrEoFqCJ582'),
(1098, 9, '1734335668lJsIBxtDzn359'),
(1099, 75, '1734336253CknmDoBwAG865'),
(1101, 88, '1734350825sxBzGHEyAI448'),
(1102, 92, '1734354072DznIvpmroE537'),
(1104, 94, '1734357491CtxDEABqGF242'),
(1106, 88, '1734362077DFIJmzlGxA589'),
(1107, 9, '1734364925oyEsqmrlwB682'),
(1108, 94, '1734365639FzmACEDrsw196'),
(1110, 9, '1734371953CwsmDzxGBr413'),
(1111, 75, '1734377233FmrtnxBpvy812'),
(1112, 75, '1734378782zspqBGyJDH141'),
(1113, 10, '1734379572EAltFpBkGJ493'),
(1114, 75, '1734381100kCrlyBnFqA171'),
(1115, 88, '1734383510GqnwFClorv720'),
(1116, 9, '1734417936rqltCxDmyF166'),
(1117, 9, '1734418173HGBpsxAFJn820'),
(1118, 9, '1734419765rpzAIHlwtC477'),
(1119, 75, '1734422324nBAlwIEFps622'),
(1121, 75, '1734424679JCDpxtkmrq522'),
(1124, 9, '1734429085mEsrxHzAtC526'),
(1125, 15, '1734430401yzAqHDnxrw370'),
(1129, 15, '1734455082DJnGCwxvyF293'),
(1130, 9, '1734455812FyvBztkxmE630'),
(1134, 9, '1734466501FywpGBlJAx954'),
(1135, 9, '1734468002kECoIsFpwB446'),
(1136, 79, '1734468230HqoEBlmzsk835'),
(1137, 89, '1734469595GIpkHlEwCJ290'),
(1138, 89, '1734469886opqsDtmvJw917'),
(1139, 88, '1734470077HoDwkGAxty351'),
(1140, 89, '1734470417wnoszIFCry559'),
(1141, 89, '1734470418ABpJGlvkED448'),
(1143, 75, '1734504939krAEpGznBy122'),
(1144, 75, '1734504951JCrpGzwmyA498'),
(1145, 85, '1734507265DrpBzGJEnI608'),
(1146, 85, '1734507305wvtJrmlIFz643'),
(1147, 85, '1734507315BkpCxFnvGA465'),
(1148, 85, '1734507315AIvrztHops238'),
(1149, 85, '1734507315wsvqHCyxEk678'),
(1150, 9, '1734511362wHGystrEkp309'),
(1151, 89, '1734517542vCxIEBlokr1000'),
(1152, 79, '1734519754BpJHrlGwms208'),
(1153, 79, '1734519764qJAkGFHwrn446'),
(1154, 89, '1734521172qwlEynxHJA139'),
(1155, 9, '1734530062qsBoxFIrym600'),
(1157, 75, '1734548486DntskqorlE889'),
(1158, 85, '1734549812ECGwIntAop136'),
(1161, 15, '1734560250lDoAIykFms251'),
(1163, 85, '1734594986nyDAmFwIvo533'),
(1165, 9, '1734599304vDtJIEsmwA462'),
(1166, 95, '1734604053FoCpBAkvIz419'),
(1167, 95, '1734605020xkvoImDJHl384'),
(1168, 96, '1734605179FIlmDGvAEB934'),
(1169, 85, '1734606231GzCEFHAmpw230'),
(1170, 95, '1734606290IGtFvkzqms635'),
(1171, 88, '1734607675sHCDIvqnkl490'),
(1172, 88, '1734608189GmlntIHoCJ234'),
(1173, 88, '1734608190HsAqvmDtEG808'),
(1174, 88, '1734608190FnwrJoDpEA715'),
(1175, 88, '1734608190nHzsqxGlBy455'),
(1176, 88, '1734608191HvGFIJCoqr789'),
(1177, 88, '1734608191wsqolnBmxF116'),
(1178, 88, '1734608192zIGBElqHJm902'),
(1179, 88, '1734608192HzEtrykmAI461'),
(1180, 88, '1734608193IlvykCrxHp608'),
(1181, 88, '1734608193ElJosryDvI647'),
(1182, 88, '1734608194JskqpDyGFt895'),
(1183, 88, '1734608194BJqCDEnlms752'),
(1184, 88, '1734608195GBxFrwHyqz760'),
(1185, 88, '1734608196DnwtpmGBAs603'),
(1186, 88, '1734608196EFpGnAszqw467'),
(1187, 88, '1734608197qmBJrAIzvt860'),
(1188, 88, '1734608197JHlptrsEBG486'),
(1189, 88, '1734608197lFzqIvsrEp257'),
(1190, 88, '1734608198JFmkwHxqEr297'),
(1191, 88, '1734608198oEqAFDztsx644'),
(1192, 75, '1734613470AyxsklCoFm671'),
(1193, 10, '1734620466wvGzyDCtko142'),
(1194, 85, '1734621030IxpwtJEvom656'),
(1195, 9, '1734629076xtEDqAkFwo790'),
(1196, 15, '1734632434qwEponCJzA140'),
(1198, 15, '1734638706GkBDFIymtp859'),
(1199, 10, '1734639921rFtAzIEvBC314'),
(1204, 10, '1734663783xywCDpFlEB316'),
(1205, 10, '1734673011qyzxCIlGDJ252'),
(1206, 85, '1734675264vHFpqtwsEI839'),
(1209, 79, '1734686392qvwmBJrCHk797'),
(1210, 85, '1734691173HlGpCqwEsr205'),
(1211, 85, '1734691174GHvsnDqpBl809'),
(1213, 75, '1734692288xGvzorAkCt361'),
(1214, 85, '1734703891wozJtFICvq100'),
(1217, 9, '1734713597mGIyHoslqw842'),
(1218, 10, '1734715133qomyHtzJnI290'),
(1219, 75, '1734724324BqwympDzot970'),
(1220, 9, '1734728687nkHlxzmsBo426'),
(1221, 75, '1734734413wlJszEFBoC978'),
(1222, 10, '1734759476wrJnpEIxqH397'),
(1223, 10, '1734759505JrzBswCEmx334'),
(1224, 10, '1734759508qIFomxGsCp188'),
(1225, 96, '1734764134zAFBEoxmvH236'),
(1226, 75, '1734770302IFqnByvlHx304'),
(1227, 95, '1734770880kmrBtswxEv256'),
(1229, 75, '1734776469ltHEBozrAm288'),
(1230, 95, '1734777508pIztBkDwGq367'),
(1232, 95, '1734781061yFJIwxnrDA815'),
(1233, 75, '1734782701BGpqJlnzIo648'),
(1234, 96, '1734783458wxznmoCEFA940'),
(1235, 10, '1734785205FIzsHyrlwn460'),
(1236, 10, '1734789716ovAFDnHqyt483'),
(1237, 75, '1734797234JFqrtxplDk377'),
(1238, 75, '1734811365FkDrCyqJzp782'),
(1239, 9, '1734812532wGDqksvCEy807'),
(1241, 10, '1734838380npFAEzroIs395'),
(1242, 96, '1734849589xqvAmnGrEy193'),
(1243, 10, '1734850791AmJsxykpGE576'),
(1244, 9, '1734852545BtJsqIlnCr550'),
(1246, 9, '1734857528xGEFDImtCk238'),
(1247, 9, '1734857539AyCmvkxonE924'),
(1248, 75, '1734860807lnvJmxAGCk902'),
(1249, 15, '1734863239FsGDJIoBxp624'),
(1251, 96, '1734875999lzxECypDkJ896'),
(1253, 7, '1734885268twEpBoImrJ551'),
(1254, 7, '1734885709tGmvnBCrDk554'),
(1255, 7, '1734885709JtDsrmEwBF955'),
(1256, 85, '1734886278AmGDCsJlvI840'),
(1257, 85, '1734886278syqJDCIpwn538'),
(1258, 85, '1734886279zAwpICEBnr669'),
(1259, 7, '1734886526HqwDxtnzCm330'),
(1263, 9, '1734941329tkDsInywAr202'),
(1267, 75, '1734953042pIyBrtEkCz693'),
(1270, 75, '1734976678zpqrmEFHxl918'),
(1271, 96, '1734978674yqCrktplAE681'),
(1272, 9, '1734980860sACGBpFxHm587'),
(1273, 10, '1734985031lHJpvGtAsC623'),
(1275, 75, '1734988340rzslkntAvF785'),
(1276, 75, '1734991675BCrsIlqoHy358'),
(1279, 75, '1735045570CIrsopBklq607'),
(1283, 9, '1735071620GJvCAprkqD443'),
(1284, 9, '1735071747rpCnvAEwzB234'),
(1285, 9, '1735073675soyEtBmkHC524'),
(1286, 96, '1735075701EktpAGqyvo464'),
(1287, 75, '1735075890vmIFtlnksr487'),
(1288, 9, '1735079136wpImDAHqzo785'),
(1289, 15, '1735110093zIkqCwrApl668'),
(1292, 88, '1735114411AknEwBpyFD253'),
(1293, 9, '1735118071HnpCsEJIkt826'),
(1294, 10, '1735119049IAHksrCywJ482'),
(1295, 9, '1735122352ztyxDpFGEo632'),
(1296, 96, '1735123976AByIqEnvok383'),
(1298, 96, '1735132931yFzwCDEvxI233'),
(1303, 75, '1735166236oszAkwFJtl234'),
(1304, 96, '1735200808pxJAFzqIEk772'),
(1306, 9, '1735204683HIGxkoFlrn375'),
(1307, 9, '1735208371HmAqotDnyE850'),
(1308, 75, '1735209254noCltFxGsB790'),
(1309, 96, '1735218640HqtCGEopkA191'),
(1310, 75, '1735220707CEtnzwqpDr752'),
(1312, 9, '1735226299ArFwqoEtls177'),
(1313, 96, '1735234262mGAnvpoFlt918'),
(1316, 75, '1735252244ItnHElopBk737'),
(1317, 96, '1735263913FyvIrEwBxq674'),
(1318, 88, '1735284302pzqlsmnwvr698'),
(1319, 9, '1735284328smCEqkFItl102'),
(1321, 75, '1735296573IqCxrGBnsv545'),
(1322, 75, '1735301254IEpBwFlGkv716'),
(1323, 88, '1735301645vmECypHozx207'),
(1324, 94, '1735306019EIrxsFmBql197'),
(1326, 88, '1735322353sqywJHDFov478'),
(1328, 10, '1735327016vmrADnktyw686'),
(1331, 10, '1735335073BknEwrvHqG477'),
(1332, 75, '1735346005ElIAGHtvxw528'),
(1333, 9, '1735366541oApkDtvGCs1000'),
(1336, 75, '1735413872FGvxmkJDAB379'),
(1338, 9, '1735453418BIlDrvFxAE214'),
(1340, 96, '1735457532qItvBlHFAJ394'),
(1341, 96, '1735468261JkItBsyAmn787'),
(1342, 75, '1735472023qwADpsoGFr582'),
(1343, 85, '1735492209sGxlBJkHzo417'),
(1344, 96, '1735493920xHIEoGtzAF654'),
(1345, 10, '1735494024wlvIykzHoq323'),
(1348, 96, '1735510751zymsrklEGH573'),
(1351, 75, '1735548704AmxtBDwJCp221'),
(1353, 8, '1735550022pByzAGxFtr982'),
(1354, 10, '1735554966GDIvCwBJzr787'),
(1355, 10, '1735555213tBrDEmClFs958'),
(1356, 96, '1735555750JpkrozBqEC249'),
(1358, 8, '1735558732nHFICBEkvw469'),
(1363, 95, '1735577179kBqIlmEsyo854'),
(1364, 7, '1735578171npvJDoEmIA631'),
(1367, 96, '1735587522kxmvAEsoyn840'),
(1368, 75, '1735591358IxDqHGlyzp491'),
(1370, 95, '1735605876IHJwFGxrCm322'),
(1371, 15, '1735625422sDrlotwqyn511'),
(1373, 15, '1735636568rDwEIkAxCG688'),
(1374, 98, '1735646655sBAkpIrxlH590'),
(1376, 75, '1735656926CwEDqymJHz828'),
(1378, 75, '1735680637EIzposnlHJ965'),
(1379, 9, '1735682311sAkwrCHtvI117'),
(1383, 9, '1735717335xnFqwtJDIl101'),
(1386, 75, '1735728516FDmytxrvGE851'),
(1387, 75, '1735744602qzDksFwyIt852'),
(1389, 9, '1735753786JGtFEDzkAn263'),
(1390, 10, '1735754541CmDHJEzIox528'),
(1391, 8, '1735755229FyIDzwHmvl238'),
(1392, 8, '1735755578sxIpGkoEwr256'),
(1393, 8, '1735772120qoElrFByAC526'),
(1395, 9, '1735805883noCFmJrlHw462'),
(1397, 75, '1735813086nIAJqvCtyw273'),
(1399, 10, '1735839969IBlrFxtnwk327'),
(1400, 95, '1735840566oACtqIyGpz178'),
(1401, 9, '1735842723kwmpvInslE323'),
(1403, 15, '1735884598yzCJHFBsok761'),
(1405, 75, '1735888341ptCJzkworm926'),
(1406, 99, '1735932045wnoDsJIkAr986'),
(1407, 99, '1735932139loqIJwpxDG242'),
(1408, 99, '1735932246tkyswCzAxI655'),
(1410, 75, '1735933132JkxHAyptzE826'),
(1411, 9, '1735935325pGvkAoBJsz910'),
(1412, 10, '1735935843kmwxFvqyHn654'),
(1416, 75, '1735982584pHvmskzDyF897'),
(1417, 15, '1735996072rFDmtpBAHs168'),
(1418, 15, '1736005146lymxqkJrwH646'),
(1420, 96, '1736014942Cpxyklqzvr896'),
(1421, 15, '1736062701sIJAEGDqvm407'),
(1422, 75, '1736063553kIxBElHzDG569'),
(1423, 9, '1736077038nGBIHmlCDz941'),
(1424, 9, '1736078113GkDoqHvtBC835'),
(1425, 10, '1736089186oADvqtrEGH296'),
(1426, 75, '1736092166ztmpovxsyq640'),
(1427, 85, '1736093824HpvozsyDCm834'),
(1430, 9, '1736148729vnAyGoEDIx628'),
(1431, 9, '1736148929IAnGqJkorE102'),
(1433, 9, '1736185841qzsyxlkvnp558'),
(1434, 75, '1736189444knJpBCrAHm466'),
(1437, 75, '1736232275xlByvCAErD653'),
(1438, 15, '1736243963twGIJpHomA644'),
(1440, 96, '1736257291tJEBpxyCnz569'),
(1442, 75, '1736266488zJoknstGvB425'),
(1443, 9, '1736271844zyxGItqmAH486'),
(1444, 9, '1736272055JFDxnzrGmq963'),
(1445, 10, '1736282935DvAyxsGotE120'),
(1448, 95, '1736286654BqoCFGJynl861'),
(1449, 95, '1736304228HroCylxApn786'),
(1450, 9, '1736316402wxJsICvBFA893'),
(1452, 7, '1736329971zlkpDsInBx581'),
(1453, 96, '1736333281pxDBqnsvJA322'),
(1454, 8, '1736350738otxpzvIlJq507'),
(1455, 7, '1736354664EkxyHoDIrB617'),
(1458, 10, '1736365883tDkyvoJnGC145'),
(1465, 8, '1736497883lpIsFkmorn312'),
(1469, 75, '1736520673AsDBpmIloE963'),
(1470, 75, '1736530876DwHCFBxlyn615'),
(1471, 9, '1736537778qHoFlBEJsp978'),
(1477, 15, '1736575363mHykCJFqnl560'),
(1479, 15, '1736587983pCqHrAFDoz220'),
(1480, 10, '1736595029zCHnJvskwF439'),
(1486, 9, '1736666880CzlynwtspH195'),
(1490, 75, '1736672579swCvJAxnEH311'),
(1491, 10, '1736679118xBkJyGtCFm982'),
(1492, 15, '1736681332slwmnoGxDp976'),
(1493, 10, '1736687290HsmoIqJEBG221'),
(1494, 100, '1736693427rtEFqCzwsx324'),
(1495, 75, '1736696386FDkBrxwEIp507'),
(1496, 9, '1736696451pFtGCwrlHv681'),
(1497, 75, '1736698762nzrwqADCpx569'),
(1498, 75, '1736701039HzvrkCxADG339'),
(1499, 75, '1736701328ICnmFtDlxv401'),
(1501, 9, '1736715086AoFxHlpEsk334'),
(1502, 9, '1736715266BCnzElxFGs564'),
(1505, 10, '1736760787CAHxGqtzkJ301'),
(1506, 10, '1736763438HsBpylJqDx298'),
(1508, 10, '1736777205knJzrBvqEl856'),
(1511, 75, '1736790013FpqmJloxAH239'),
(1513, 75, '1736790739xkmoHFlqzs897'),
(1514, 10, '1736793852EDlzkAwvyp332'),
(1515, 75, '1736806318DryACtGonx439'),
(1517, 8, '1736809714GIysEpktzn433'),
(1520, 75, '1736870654voHptAICJE921'),
(1521, 10, '1736875074tCymrlsJzA444'),
(1522, 9, '1736884089HDslzFvBmG789'),
(1525, 101, '1736936333nostlAkvzw504'),
(1526, 10, '1736940348wDyCFJltzv790'),
(1528, 9, '1736963855nJwCExpslv994'),
(1529, 15, '1737012219GDCmAFzrxv399'),
(1532, 101, '1737024894FCxDrBvGqA907'),
(1534, 10, '1737048503JryvlwCDsA490'),
(1535, 75, '1737064903FowrJHnvyx315'),
(1542, 100, '1737092231ECIntsqlDx567'),
(1544, 100, '1737102471JGoItwFzAm384'),
(1547, 15, '1737122102FyskvplJzm140'),
(1549, 15, '1737137271nJBrkExqtz158'),
(1551, 100, '1737142722rwIFqDoHBz117'),
(1559, 103, '1737198588mstolJpvID935'),
(1560, 10, '1737204385qwrHJGpxsn950'),
(1562, 9, '1737226995JznlxkBCIs471'),
(1563, 9, '1737227259JtqnBGEswC804'),
(1564, 9, '1737229386IsCwlokrqA787'),
(1568, 9, '1737233507GCtHJEpDwF906'),
(1569, 100, '1737237818mwqtGyvnol592'),
(1572, 100, '1737269364JEtCGsFxzI223'),
(1573, 104, '1737279547wmrDCzqtJE289'),
(1574, 79, '1737281043DlFtBvIwJy981'),
(1575, 79, '1737281513GzpDBnIxFl220'),
(1576, 75, '1737287572xAIBvGDswo688'),
(1577, 104, '1737293878wHrqIGBCvp835'),
(1578, 100, '1737294783nJyAvGpsqz556'),
(1579, 94, '1737300378HosGJlytnF163'),
(1580, 9, '1737310482vAsrBHDImp845'),
(1581, 15, '1737311405qJtsGnxoyF703'),
(1582, 104, '1737320319rEolIszHAp500'),
(1583, 100, '1737352373zqmDrvxJtA911'),
(1584, 104, '1737362121zlyBDqmtnk785'),
(1585, 104, '1737362190AJIlGkEpDv312'),
(1586, 104, '1737362874AGysvpJqnC969'),
(1587, 104, '1737364726DCHGpkvxzw851'),
(1588, 104, '1737364752ymvrkCDtFB566'),
(1589, 104, '1737365127rBFDqtlGCm402'),
(1590, 10, '1737371159syJvCnAGol572'),
(1591, 79, '1737374063vBAqoFzDlr856'),
(1592, 104, '1737374486FqvxnItHoG376'),
(1593, 9, '1737382039woHzGqyrtl571'),
(1594, 104, '1737382168myJnrIqFDC866'),
(1595, 7, '1737384319owkJrBnAvq790'),
(1596, 104, '1737388915qmvkAsGBxE352'),
(1597, 75, '1737390170lqEmHorCzy113'),
(1598, 75, '1737404978pEwFzJmCsH953'),
(1599, 104, '1737409783yJwGsArzxv642'),
(1600, 104, '1737413015vJmIFqnoyD109'),
(1601, 15, '1737445445kHwzvCJroq131'),
(1602, 104, '1737471269qpyEkrJxIz347'),
(1603, 15, '1737473797BnkGopzJmv983'),
(1604, 15, '1737479149tAyICHkFox108'),
(1605, 7, '1737480022FqkBGnrCws563'),
(1606, 104, '1737488870voHAskBIJD277'),
(1607, 85, '1737492527GoIwFvqtml461'),
(1608, 9, '1737496301lmwGJFtoEx827'),
(1609, 104, '1737499903skDJplAwzv201'),
(1610, 104, '1737502754EFlBsqvDHG593'),
(1611, 9, '1737527240ltvAIqBEDp869'),
(1612, 79, '1737531114HCqpxwyEkG506'),
(1613, 7, '1737531504DtwoyBlArJ407'),
(1614, 104, '1737533777vHEJoIBGzk230'),
(1615, 15, '1737535356pBIqozmDxE470'),
(1616, 94, '1737547258porDmlsHGJ580'),
(1617, 15, '1737547267JHwFGrDBIy770'),
(1618, 7, '1737547398kFsAtBmpJx869'),
(1619, 75, '1737563172FlxCmEBqzt961'),
(1620, 104, '1737587856lFAnHtvroE489'),
(1621, 75, '1737600262qrsyHxnBAF695'),
(1622, 101, '1737622998JlBkoHxpGs672'),
(1623, 15, '1737638420EtsqywBzrk237'),
(1624, 101, '1737667144ICtxmvGrzo678'),
(1625, 104, '1737669896xnDlryGkIC422'),
(1626, 75, '1737685462mqIzpAwFHt579'),
(1627, 7, '1737702178nCAprIqFvk965'),
(1628, 75, '1737725448lAxwqvpJFm800'),
(1629, 15, '1737743583GDJopHlFCv378'),
(1630, 104, '1737746903loInDtwGJy964'),
(1631, 10, '1737748404ICsxJkFonv155'),
(1632, 104, '1737755117rsnlICBJDw862'),
(1633, 75, '1737793579HzvtFrkwpB299'),
(1634, 79, '1737796192BGyqmwJFpz805'),
(1635, 104, '1737796924wEAHIxqlBk970'),
(1636, 100, '1737822633pynxkEvAsI577'),
(1637, 75, '1737830675EJzqDpnBws142'),
(1638, 9, '1737832301yoBpCwIltr787'),
(1639, 104, '1737838885vlAEDkqxwI181'),
(1640, 104, '1737843514zBpnswAorE455'),
(1641, 75, '1737882276nCtJzAHDkr594'),
(1642, 15, '1737892116yDrEnpwIGH159'),
(1643, 7, '1737902236IkoxAGtzEr200'),
(1644, 104, '1737903103FDyGzlxoAB386'),
(1645, 104, '1737903526onxwGCsprq546'),
(1646, 85, '1737912187tAnpBsoJHI134'),
(1647, 104, '1737912536mwIqkoxFvy301'),
(1648, 104, '1737913505ACrmvqBJGl428'),
(1649, 9, '1737920179oxnACzyJtr932'),
(1650, 104, '1737922075ABrwtFECys424'),
(1651, 75, '1737927083srCoGDyJAp107'),
(1652, 104, '1737927813JtkyHqnvpD181'),
(1653, 104, '1737932757snztGIABpx959'),
(1654, 104, '1737935280AJHtqCrpkG753'),
(1655, 75, '1737959162qAEFpvCJmk936'),
(1656, 10, '1737964111tykoHlIJmz423'),
(1657, 104, '1737997069ypsCGqlDBw426'),
(1658, 104, '1738004685oxJBkrHCyE899'),
(1659, 104, '1738005298ozFnAGvmJI994'),
(1660, 7, '1738006359IxwDnpvAoH522'),
(1661, 104, '1738007178FJomxAlHrE294'),
(1662, 104, '1738010097lImxvEnJtz146'),
(1663, 104, '1738010857IpCvqyBtrl608'),
(1664, 104, '1738011507zlCxqwIpAn890'),
(1665, 9, '1738012494zlvHptJDsk326'),
(1666, 9, '1738012726prqFECsHyn720'),
(1667, 104, '1738048000GlwCqvrzEA454'),
(1668, 8, '1738053229lqtBHrwsJy792'),
(1669, 10, '1738059377HyxrvpqAot892'),
(1670, 52, '1738073680ymFDJBkAwC485'),
(1671, 52, '1738081977qmvEpCDsko646'),
(1672, 52, '1738082658zBwsvHGlqD988'),
(1673, 104, '1738084834FsDvGEmoCJ687'),
(1674, 75, '1738086954tGkEzrDoAB478'),
(1675, 10, '1738089795lvDoAHxyEI854'),
(1676, 10, '1738089832sBHrpEAlyF213'),
(1677, 104, '1738090240wIAHnsltyz283'),
(1678, 104, '1738133370srtzBFoCwA711'),
(1679, 79, '1738154292mzErFDwJly960'),
(1680, 105, '1738161519pIltwHGysv655'),
(1681, 106, '1738161867FkJpBtrxsz243'),
(1682, 10, '1738177328xnIBFoqkCs220'),
(1683, 75, '1738203050DlqvozBysE650'),
(1684, 7, '1738212921kymBlDnrxA756'),
(1685, 104, '1738218420DzqrxpGvyI343'),
(1686, 104, '1738226074klzIrDBxos702'),
(1687, 9, '1738227148lprHADGwEC839'),
(1688, 15, '1738239092qrnxtFomBJ953'),
(1689, 104, '1738254295xmotqGBFJA846'),
(1690, 101, '1738261528lAysFDvqIJ148'),
(1691, 101, '1738261530yvrzlGInqA901'),
(1692, 79, '1738265755ClIDtwFyGA846'),
(1693, 107, '1738266460HksEorFDqy646'),
(1694, 108, '1738269145yopnmIrlzA463'),
(1695, 104, '1738276161BEHvoGIJDt238'),
(1696, 52, '1738288821pslvrDCFAt745'),
(1697, 108, '1738305152vHxIznokGA816'),
(1698, 104, '1738309572vtkpqsEzBI663'),
(1699, 104, '1738312803qztoCBxEyH483'),
(1700, 104, '1738313306nDIvFxrlkG764'),
(1701, 104, '1738314400yGJrIkEnwF120'),
(1702, 104, '1738314479wBDHorCtvE631'),
(1703, 104, '1738314507pDAFJGnxmI929'),
(1704, 104, '1738314597ADzyxGtIHE548'),
(1705, 104, '1738314757ArwyplxItv255'),
(1706, 104, '1738314787IGtsrxEzCJ305'),
(1707, 104, '1738314830xBsqDFIElm325'),
(1708, 107, '1738316512AnpHkmFtDl509'),
(1709, 104, '1738316840BxHlrtGyFC220'),
(1710, 104, '1738330244plqFtwEoyk622'),
(1711, 104, '1738330721xCmFlGIswp870'),
(1712, 104, '1738330962AIEoCwysHl562'),
(1713, 104, '1738331643nmFAJoyDlr152'),
(1714, 75, '1738335795kJxAroIsyH627'),
(1715, 106, '1738337670oyCJFBswAH526'),
(1716, 9, '1738340961mspnEJFCtq858'),
(1717, 75, '1738341270myxrAsJGlt457'),
(1718, 9, '1738345302wknrzCJHDx892'),
(1719, 101, '1738348969yozCEnvtAs345'),
(1720, 101, '1738348969oHyCtBzmkE642'),
(1721, 101, '1738348970vCsEomHtAz956'),
(1722, 101, '1738348970mvoJnkzsyE836'),
(1723, 101, '1738348971yHnsEomBkw820'),
(1724, 101, '1738348971AwJDoxFtqz708'),
(1725, 101, '1738348972HmtqFJxrEz718'),
(1726, 104, '1738354494sEClDmvHzn203'),
(1727, 107, '1738356035twHplnxkGJ734'),
(1728, 107, '1738358288vyxJsClEID484'),
(1729, 104, '1738360877CvtsGmpnHE394'),
(1730, 15, '1738390425nCBFkEryso781'),
(1731, 7, '1738394208FkImEpzqxw457'),
(1732, 104, '1738398361BHlvmGsAxy831'),
(1733, 85, '1738400595CwJzvIBsyG670'),
(1734, 75, '1738403067ItHqoEGFnr391'),
(1735, 10, '1738408868DEwoAprGkH421'),
(1736, 101, '1738421625CGHvAzkrID126'),
(1737, 10, '1738427691sloEtqnmBF147'),
(1738, 109, '1738428151pkFDElyntw399'),
(1739, 79, '1738435198qpyGCtnoHl561'),
(1740, 101, '1738437345yzDpqwEIAF332'),
(1741, 101, '1738437347HyGlADnkCv809'),
(1742, 94, '1738438136tJElyqwrvH831'),
(1743, 79, '1738443106rIplwAGyFs447'),
(1744, 104, '1738444076wmknolsyIx602'),
(1745, 75, '1738481074txmoCsnlID945'),
(1746, 9, '1738482110EmDovrntzl757'),
(1747, 104, '1738486054oEICGkDFvx919'),
(1748, 75, '1738497164srJEvpkDzx221'),
(1749, 75, '1738502353mtGlwpzHxn360'),
(1750, 107, '1738503789CEFmHtkIzv263'),
(1751, 75, '1738512545qIGCAtHxsp959'),
(1752, 15, '1738514545CvtwmJopqB589'),
(1753, 9, '1738517033zmsJwAqtyC711'),
(1754, 104, '1738517604DntvylmqIA342'),
(1755, 94, '1738528452FIBJpDztln387'),
(1756, 104, '1738529889vIBDGzpyJH187'),
(1757, 75, '1738543250oFGvwmCBIl425'),
(1758, 104, '1738567978vlksIrwnCA327'),
(1759, 104, '1738572084IAJxpwvCnr725'),
(1760, 104, '1738579413DklnqxsAJH585'),
(1761, 104, '1738597205ImloEGwxBs818'),
(1762, 7, '1738603002GCxHFJrpzk728'),
(1763, 79, '1738609140IEryCHqvDo336'),
(1764, 104, '1738614227nJvzrIpCtB760'),
(1765, 75, '1738616064yqrGmJCIBp305'),
(1766, 75, '1738616575oBqCHrGyEF878'),
(1767, 104, '1738620991DlAstoJkrm797'),
(1768, 79, '1738642388pHnzDImEoG180'),
(1769, 7, '1738652911xwqmFDzlvk234'),
(1770, 96, '1738655470sBplJAICGo262'),
(1771, 104, '1738658530ksIBEHywrx554'),
(1772, 96, '1738665248FrJxzApkEv224'),
(1773, 104, '1738667161mvCozBykIw530'),
(1774, 110, '1738667817zplmkCqBHr681'),
(1775, 96, '1738669130rCxvkpwqEB532'),
(1776, 96, '1738670405HzJrmkGBwl185'),
(1777, 96, '1738670479kAoDyrwEFn739'),
(1778, 96, '1738670550FkHpBzIJoy762'),
(1779, 104, '1738670724IosFBrlxtv213'),
(1780, 85, '1738676410oErImxtnlG575'),
(1781, 75, '1738689293wpyzJGqnsE958'),
(1782, 79, '1738690136JwsrqAxlzy457'),
(1783, 10, '1738699166wlpBqDJAvk424'),
(1784, 52, '1738703240rCvEtxlpHw414'),
(1785, 104, '1738713620xtBlwkpDHo379'),
(1786, 10, '1738734436wmnszkGJvB801'),
(1787, 96, '1738735986DBzCxvIwmn714'),
(1788, 96, '1738736051IDpxkoqtEy989'),
(1789, 75, '1738738008FlspEoJkwI369'),
(1790, 104, '1738750378nxBkJGHqrw534'),
(1791, 104, '1738750749DBCplrqJGF231'),
(1792, 96, '1738757381IqBxmopwvt796'),
(1793, 15, '1738762229DvmJpoklzA299'),
(1794, 96, '1738765000lCzFmDGAxw661'),
(1795, 52, '1738774422JzIsrtqvoy544'),
(1796, 79, '1738774875mDtJvEpqyx210'),
(1797, 10, '1738775271kGtswAJBHx241'),
(1798, 104, '1738778418mEAlGpDyBw750'),
(1799, 96, '1738779301lzCFAysmot419'),
(1800, 79, '1738789729BvmHnAltoJ205'),
(1801, 9, '1738790228tEAvIwpkGr466'),
(1802, 75, '1738793096EyACpFIowm382'),
(1803, 104, '1738803263mHIytGlxFs170'),
(1804, 75, '1738822489mswqkBGADz929'),
(1805, 7, '1738829446HFrsCoEvkJ404'),
(1806, 15, '1738835662FJDkopqArz803'),
(1807, 96, '1738842186IDBsJFzHmt472'),
(1808, 104, '1738846071lwsJpEzomv455'),
(1809, 109, '1738848994BwCzmADGFy921'),
(1810, 15, '1738869458DHFtByzkps260'),
(1811, 15, '1738869636lBtqAwpGJx631'),
(1812, 75, '1738872255FxyGwoAJks702'),
(1813, 96, '1738876492nHFCsmDIxl519'),
(1814, 15, '1738904716IsCEHzwnmr748'),
(1815, 104, '1738920297FrGIxsoyAn413'),
(1816, 104, '1738921254FmkzHIontq210'),
(1817, 9, '1738950465xrCEqFnBmA341'),
(1818, 10, '1738952507AzJEwmyCvH330'),
(1819, 104, '1738954909sxykAIpoEt231'),
(1820, 96, '1738956222DplICAmzyF605'),
(1821, 10, '1738959648BIqyzwnkxm348'),
(1822, 75, '1738960657CGqyzmDIAw578'),
(1823, 104, '1738961653wrkvzpAoBx158'),
(1824, 104, '1738961821wInlqzJGHs990'),
(1825, 10, '1738965005HIxmwtnDrC408'),
(1826, 7, '1738966329ErBJxmlGkt572'),
(1827, 10, '1738980205zxpysEwnJv809'),
(1828, 10, '1738992512qyntwvAJEB730'),
(1829, 10, '1738999638AJqCDEsonI195'),
(1830, 75, '1739014496GnqzJoAEyH501'),
(1831, 10, '1739014946txHwDmoFBq849'),
(1832, 104, '1739016571pGDqBJoltC415'),
(1833, 79, '1739021604JwvqynsmAz240'),
(1834, 104, '1739024630CJoAFIkqnz789'),
(1835, 75, '1739027043CozqsEAknF798'),
(1836, 79, '1739029962nsvqwApozH139'),
(1837, 7, '1739039481BprtIDHskm558'),
(1838, 52, '1739046343xqzlmwFEyk997'),
(1839, 52, '1739049838zlpnkyxCEo795'),
(1840, 96, '1739055105qpEDHBxGzs825'),
(1841, 104, '1739063703HICoAsrqEy786'),
(1842, 79, '1739078583slGtHIvFEn458'),
(1843, 52, '1739085299lHrpzvFkAx663'),
(1844, 75, '1739106972zwvADEtsBI183'),
(1845, 104, '1739109894wvEItBDslG851'),
(1846, 104, '1739118835loqDvErpyJ645'),
(1847, 109, '1739120253CFJHvAwEmt951'),
(1848, 10, '1739129018zBnvClDGEt901'),
(1849, 104, '1739130293rvxnCpGHst884'),
(1850, 75, '1739134419IDCkAysHoJ533'),
(1851, 75, '1739165260DIBtrmsxpq413'),
(1852, 7, '1739168969CtkGwmEJnB110'),
(1853, 96, '1739169902okDxIwlBzr437'),
(1854, 15, '1739203213lnoIxDHEkG532'),
(1855, 75, '1739229023vqwknJylEC979'),
(1856, 75, '1739232003JnGlyBzsvx912'),
(1857, 75, '1739253593rCmIDzxABs886'),
(1858, 104, '1739256876JyGCsklAxo975'),
(1859, 7, '1739258120krAFwtsBlo788'),
(1860, 9, '1739258418JsAvnmwFrt471'),
(1861, 9, '1739258581BltvHzroEy627'),
(1862, 104, '1739265819mypBoCxIHF287'),
(1863, 10, '1739274125JymvBCptsl901'),
(1864, 104, '1739274944DHBEzyoltr211'),
(1865, 15, '1739281536JsErlDGHpo645'),
(1866, 9, '1739297825BICsrxnzwm904'),
(1867, 9, '1739301312BzwnFklqvE127'),
(1868, 9, '1739301537vkyFHpCnxI515'),
(1869, 9, '1739301752IkAlEvoJms745'),
(1870, 9, '1739302923EtIBoxJFCm212'),
(1871, 10, '1739303435CytqFHxprs453'),
(1872, 10, '1739306385DxJqGkmCBw698'),
(1873, 9, '1739315772nwJHkzIqBy692'),
(1874, 75, '1739317981xCmBAGwtry505'),
(1875, 75, '1739317986DCJxGmEHst956'),
(1876, 104, '1739319542kpAElHnGmw265'),
(1877, 7, '1739350214FDtHBsvyqI403'),
(1878, 104, '1739361066ovkpFCrGqn627'),
(1879, 10, '1739365936koFCJwnqAz829'),
(1880, 104, '1739368369BEtpyGrDCs384'),
(1881, 104, '1739390339mECksIFGxw537'),
(1882, 52, '1739392980zvGDBylmsq655'),
(1883, 10, '1739394154GoxnzCEABq302'),
(1884, 10, '1739394224BsnGlkvECq345'),
(1885, 104, '1739394287BrkoEsnAvl925'),
(1886, 9, '1739397899qopxDtrkvG580'),
(1887, 104, '1739399782EmoJHGlryv895'),
(1888, 52, '1739400260DlJFCywxzB464'),
(1889, 52, '1739400525CyvAkmsnrt626'),
(1890, 104, '1739404481CrvpxnBwGA368'),
(1891, 52, '1739406015moElACHsnD348'),
(1892, 104, '1739406586zvHICpyrws881'),
(1893, 52, '1739427463xIEHymFGvq683'),
(1894, 9, '1739431751ynzkHswlIG565'),
(1895, 96, '1739441904qAImlxvECn539'),
(1896, 96, '1739442241kHwvqryDtJ137'),
(1897, 10, '1739453862HqIBDyJGwn952'),
(1898, 104, '1739476230rqstoHzABp695'),
(1899, 104, '1739519402xHInBAvqCt913'),
(1900, 96, '1739525933mDIAtvwHqs247'),
(1901, 104, '1739538366CmoByGDHqs550'),
(1902, 111, '1739538485tGlFBDqEsn900'),
(1903, 111, '1739539504xFrpwtlvDm160'),
(1904, 104, '1739546017tAyJFGksEH402'),
(1905, 9, '1739546986lznmrGqFpo479'),
(1906, 9, '1739547547lrABpJsyID859'),
(1907, 9, '1739548201zwyGlJAHnD532'),
(1908, 9, '1739549273DwszHIovJk105'),
(1909, 9, '1739549471kltDzBACnJ470'),
(1910, 9, '1739551001CyvEtDzroF257'),
(1911, 104, '1739561674tsrIwFmnGC902'),
(1912, 10, '1739565803xprlsHvqtm488'),
(1913, 7, '1739569318nytFvpBxlE333'),
(1914, 7, '1739569710yJqIBowDAs789'),
(1915, 111, '1739572155nlmGEkpoBx356'),
(1916, 104, '1739574161kmnExHrItF416'),
(1917, 52, '1739580887slAGnyoEtD652'),
(1918, 104, '1739598964JlsAztkpxw472'),
(1919, 104, '1739603074AnxqDsIpJG139'),
(1920, 10, '1739607266GyvrsFwDAl684'),
(1921, 10, '1739607279wxGAJptsFy483'),
(1922, 104, '1739615838JCzIBkAvGy638'),
(1923, 79, '1739625451BArzslxCHq539'),
(1924, 15, '1739629029GqzmksECwn772'),
(1925, 111, '1739639461lnGEqDymFC697'),
(1926, 9, '1739642078xCIHnkwpJA290'),
(1927, 9, '1739644300pByHvGqolr709'),
(1928, 15, '1739644561nBpmCIvzEr435'),
(1929, 7, '1739652167wHkDzsGtmF152'),
(1930, 52, '1739660901nqAFrDGIsB469'),
(1931, 9, '1739686818AzIGlxvnyF737'),
(1932, 15, '1739691920CnGHpwqtJs336'),
(1933, 15, '1739694576kmByDFHxGw920'),
(1934, 104, '1739717735kHpBxCwrJt134'),
(1935, 75, '1739721903JDrEzwvCBm801'),
(1936, 75, '1739722767BzwGJHvCno391'),
(1937, 75, '1739724680GtBomDvCnF559'),
(1938, 15, '1739728190pGxIzrBvqo682'),
(1939, 9, '1739735746yJCDtHnlBA266'),
(1940, 9, '1739735979oDvxGqmkEF131'),
(1941, 104, '1739742914klDnGsvImJ797'),
(1942, 104, '1739743788ztrsABFqGC113'),
(1943, 104, '1739744322ntByGCxrIs995'),
(1944, 111, '1739744692lzFGqoDCBr902'),
(1945, 104, '1739745599xBtIszJGyE929'),
(1946, 104, '1739747320DwGnvFBArC288'),
(1947, 104, '1739747592ytvmwxJDsH364'),
(1948, 104, '1739747599wDvCtyFIBn358'),
(1949, 104, '1739747609kDxyqnHwIC592'),
(1950, 104, '1739747616kGtswCxqJD606'),
(1951, 104, '1739747735ryvGBkmoxp539'),
(1952, 104, '1739747898zqwlnxsEBI379'),
(1953, 104, '1739748514rCsmylIEnJ175'),
(1954, 104, '1739748853ptCGynwzAF770'),
(1955, 8, '1739750275pGzAHnrJyt863'),
(1956, 111, '1739754062GIrqsAxHtv955'),
(1957, 111, '1739754275tlnCAxmrEy827'),
(1958, 104, '1739754314JrxBkyoAHz505'),
(1959, 111, '1739755396qHABDJmozF563'),
(1960, 104, '1739755814AGxBkHtloJ469'),
(1961, 111, '1739776869EJkBlxForz889'),
(1962, 104, '1739779447wnIosCzpHF931'),
(1963, 15, '1739787727BJkHAIzsvG506'),
(1964, 101, '1739798778CxvEokznyB276'),
(1965, 111, '1739805076JrwAEsDzlq386'),
(1966, 104, '1739815409BHoqJkwEtx363'),
(1967, 111, '1739823987xpvsqBEGHy984'),
(1968, 52, '1739824454nyEDGIJvrq883'),
(1969, 111, '1739830448JABEtHzyxm480'),
(1970, 111, '1739859226FCzBDopnsx499'),
(1971, 111, '1739872007mEkrxltwBp612'),
(1972, 104, '1739872037qHJzomxDIl644'),
(1973, 101, '1739876881lJnIkozGxA768'),
(1974, 101, '1739893579mEIxyBzGok891'),
(1975, 15, '1739907397FHqtCBoGks917'),
(1976, 79, '1739908917wAkFxtoHqI578'),
(1977, 52, '1739909320lCqxnsmJFt763'),
(1978, 111, '1739932573prvoHCBJDy409'),
(1979, 109, '1739950015FmBqHpEJkv582'),
(1980, 79, '1739950887BGlrAmHzsq692'),
(1981, 96, '1739969331DzJmrAtkoF170'),
(1982, 7, '1739988554xlpkmyGwnE533'),
(1983, 111, '1740004888rBGzomFnsI238'),
(1984, 104, '1740004936qDypAswJkr481'),
(1985, 104, '1740030891BEFqzvxpkD236'),
(1986, 104, '1740035165pvrkzwBDxA608'),
(1987, 111, '1740035198ntxlvqoDyw599'),
(1988, 79, '1740053119HFwpDvnCAs943'),
(1989, 15, '1740057957xoDGlkqByA653'),
(1990, 10, '1740072984HBomzArGIx698'),
(1991, 52, '1740079707wGxknsCBAp519'),
(1992, 112, '1740088765BCEDyzpGIs588'),
(1993, 112, '1740088819tsElkwBoHD988'),
(1994, 112, '1740088918pqoEnlDxCJ470'),
(1995, 104, '1740089057lnwozJqvHr738'),
(1996, 111, '1740089136BwIoGqtkrC868'),
(1997, 111, '1740089280vspoAtGwCF487'),
(1998, 111, '1740089455BxnDzJyFok349'),
(1999, 111, '1740089455sIvqxtkHrw730'),
(2000, 111, '1740090805FvBJExtAoC836'),
(2001, 111, '1740090936kmHsltqrFp346'),
(2002, 112, '1740093231yBtIwGJlpq441'),
(2003, 111, '1740093974AzBmCFpxHw841'),
(2004, 112, '1740094426vGEBtIypAs831'),
(2005, 113, '1740115978nsvqHGJEtB420'),
(2006, 52, '1740118832osIpnGBqHt350'),
(2007, 75, '1740138441xIBowHvpAC149'),
(2008, 111, '1740147290wvJHIAmyqn247'),
(2009, 111, '1740153052tBCxAIHkJE325'),
(2010, 96, '1740166831sGknzIAwxy209'),
(2011, 7, '1740167796pEoGkmvzHw460'),
(2012, 7, '1740168870prGFyqJAEB726'),
(2013, 75, '1740169253CBlwEHxGpD119'),
(2014, 10, '1740171585sAkwprnIyt917'),
(2015, 7, '1740173427ColnyFArms180'),
(2016, 10, '1740174658swvFlBCpGz900'),
(2017, 9, '1740192647oFkyGzlnxv571'),
(2018, 111, '1740199625pyEnwHFxIs912'),
(2019, 7, '1740207652zGoxFlsqkD398'),
(2020, 111, '1740212708EqsJtGImHB846'),
(2021, 104, '1740212732xJvmICDqGF238'),
(2022, 104, '1740221625mwGHIksoEn925'),
(2023, 7, '1740233350xBqJoIFvlw428'),
(2024, 104, '1740234968nqpBokmCHy681'),
(2025, 111, '1740234992sAtnqxHpCy753'),
(2026, 15, '1740240010rJvyoAGtlB816'),
(2027, 15, '1740240402ApnJmDksGB773'),
(2028, 111, '1740244360lICymEpHqx713'),
(2029, 111, '1740245299xFAwqsBCkr999'),
(2030, 111, '1740245332AzklBwsCpm324'),
(2031, 75, '1740248250lGkpoDwxzC493'),
(2032, 100, '1740291508lItzqynkwF820'),
(2033, 111, '1740292104sIxHlmJtBo836'),
(2034, 9, '1740293013ynkqIosCEr919'),
(2035, 100, '1740299074nBDopGxmrl759'),
(2036, 100, '1740305185EmDnpHkCJw725'),
(2037, 114, '1740318179EJCFxwqHAB386'),
(2038, 114, '1740318415yIpzEGCmAF787'),
(2039, 111, '1740318654nomADIJsvE855'),
(2040, 114, '1740319202IvlwEykmnG793'),
(2041, 15, '1740320754DyJExstmpo384'),
(2042, 85, '1740337865EmlJvtHxqG657'),
(2043, 10, '1740341287qGnDmplrFo101'),
(2044, 111, '1740365551xIzyqAlonp393'),
(2045, 100, '1740378807kFxBrHwJly190'),
(2046, 111, '1740382892ypxHCAosDG833'),
(2047, 111, '1740388996GopEqykrFv240'),
(2048, 15, '1740409857rIktxoDACl213'),
(2049, 111, '1740422293DIpHqoxyCk180'),
(2050, 111, '1740425179FAqBnxtIsz125'),
(2051, 111, '1740425974rmwstlJAFB514'),
(2052, 111, '1740426128BvroEGDysC547'),
(2053, 111, '1740429953qnrFlCvkGD335'),
(2054, 111, '1740430117nypFHlrEDA376'),
(2055, 111, '1740430129CtqFozlwBr747'),
(2056, 111, '1740430134kJFpHtIsnl516'),
(2057, 111, '1740431575CEqFmxnorl599'),
(2058, 111, '1740431758kHxpBszIJt135'),
(2059, 111, '1740431772HElkFBpyJo585'),
(2060, 111, '1740431885mGxpIDCqBy848'),
(2061, 111, '1740432614mpzyEDqrAt401'),
(2062, 111, '1740432855AyxCmDktEz250'),
(2063, 111, '1740434796zCnFymrwAH285'),
(2064, 10, '1740436844lysroAqwpI921'),
(2065, 111, '1740437045BzlntJIyxq561'),
(2066, 111, '1740437059AnsJHFlqGx675'),
(2067, 111, '1740456173pIrtAFExvs174'),
(2068, 75, '1740464932FytCqsDvHJ389'),
(2069, 111, '1740467620pnJlFtCwmq379'),
(2070, 111, '1740479289rCDoFGwnBA671'),
(2071, 7, '1740491973ovAFyBpsCl888'),
(2072, 111, '1740491995orHsDJnCAp966'),
(2073, 115, '1740495198FtBowzHIxC465'),
(2074, 75, '1740498330yvIpJGqFlm192'),
(2075, 115, '1740499046lHpJEmGnxr638'),
(2076, 115, '1740499088JvmApqEsHn493'),
(2077, 52, '1740512987kEGwyszABF160'),
(2078, 109, '1740514360pDGsFmnIqE862'),
(2079, 79, '1740514991ExkBynJGvw742'),
(2080, 10, '1740515019IGwHJnyqox436'),
(2081, 111, '1740516447JDrvIyxomp577'),
(2082, 10, '1740546066JFyHBCGkAn230'),
(2083, 79, '1740551948sxnJtrDqlF483'),
(2084, 79, '1740556996AtJFzyBrIG302'),
(2085, 7, '1740565163zpItnGkJmx306'),
(2086, 92, '1740565711xDzonwvAIF186'),
(2087, 96, '1740578082mAFyqIoHxr616'),
(2088, 115, '1740580996kwlBDzFosv608'),
(2089, 115, '1740581124zAByokslFH622'),
(2090, 75, '1740581510yCvEqlGnmz751'),
(2091, 100, '1740586510BtInHslmkw460'),
(2092, 100, '1740586758JEykIDAHxm123'),
(2093, 116, '1740586819lktpqJIsxE487'),
(2094, 79, '1740592796ElFAxIDnzo297'),
(2095, 115, '1740595624tmlIHzykxv988'),
(2096, 10, '1740596346EyBIplrvwn361'),
(2097, 111, '1740596363nxrEvBsHDG602'),
(2098, 10, '1740602108CsImEznyJD623'),
(2099, 111, '1740612209IFnryJpotz901'),
(2100, 111, '1740619156lCrHqvypxG397'),
(2101, 115, '1740633998CEkDJlFHGA479'),
(2102, 85, '1740635691tprFGqoBHC498'),
(2103, 10, '1740637523vrpCmBwktG503'),
(2104, 111, '1740655113DIJmxvkHpq790'),
(2105, 114, '1740656658JHECBDIxsr395'),
(2106, 114, '1740656956IyBtFzGrJp415'),
(2107, 114, '1740657093orlzmpAqtn440'),
(2108, 114, '1740657964vAmlIoBswn270'),
(2109, 114, '1740658243wpkrFqHAlz522'),
(2110, 114, '1740658365npDCylowJz591'),
(2111, 114, '1740658507JvICnBkEDy379'),
(2112, 111, '1740659355AlxmrJtGBD616'),
(2113, 111, '1740660868lAqztGwEov302'),
(2114, 15, '1740662720xtGmCEzIsp367'),
(2115, 111, '1740664233yvnDzHmolA200'),
(2116, 111, '1740665441yFBAozkqGn826'),
(2117, 101, '1740671507qownBDtIGy624'),
(2118, 111, '1740673959AkIsBoDGpw747'),
(2119, 95, '1740675960DvxBnmJAGI264'),
(2120, 111, '1740676422EBAxqJIzsG682'),
(2121, 101, '1740678591JkDHEAtBCx167'),
(2122, 7, '1740680644ICnDswFzEA142'),
(2123, 9, '1740681230ClHImBEtsx912'),
(2124, 114, '1740684886mErqvIwBpy547'),
(2125, 117, '1740685514rlGHqmyEvs591'),
(2126, 75, '1740686139zkItpACyrE519'),
(2127, 111, '1740686337zAsqproGkx362'),
(2128, 117, '1740686755ovsDnwJIrt310'),
(2129, 117, '1740686791HqGtoEsmAx963'),
(2130, 117, '1740687352rwBlzmynvF201'),
(2131, 117, '1740687584DnsFlAzpHw308'),
(2132, 111, '1740693599yJAFCqpvBw837'),
(2133, 111, '1740698507sJmHpqGBIC566'),
(2134, 114, '1740713010BFAqxGzJtI225'),
(2135, 114, '1740713026HGmwyIpJBx939'),
(2136, 7, '1740725869xEpqrsyBvD659'),
(2137, 101, '1740726785kADIwyvpHm338'),
(2138, 111, '1740728004HBGxJzmytF501'),
(2139, 101, '1740729934yzrpEvqmlJ203'),
(2140, 95, '1740737652vFkxDEzGBo487'),
(2141, 111, '1740741521tslxEGovAr810'),
(2142, 95, '1740748514nmBxGDHtIo132'),
(2143, 111, '1740749985mIswBCyvEt799'),
(2144, 111, '1740750030nvoqIxHpEA730'),
(2145, 101, '1740750428CtnJDIHkpG251'),
(2146, 95, '1740751162mnvrFxEIkD562'),
(2147, 111, '1740752189vAtszkJryG268'),
(2148, 95, '1740753536nplFxsqvDt735'),
(2149, 52, '1740764909oFmzwsCrBE134'),
(2150, 111, '1740773679qlvnHyzDxp305'),
(2151, 111, '1740773830ynlIrzxJko440'),
(2152, 111, '1740779575kBzIEwxCqo353'),
(2153, 111, '1740780020tHzBIJECwp474'),
(2154, 111, '1740781727wBsHvDqEyI883'),
(2155, 111, '1740781861yDkGopmznr237'),
(2156, 85, '1740810920wAsGzCBtyq230'),
(2157, 85, '1740822587wyzFnptEsv581'),
(2158, 111, '1740859869trnmlvpwGD664'),
(2159, 101, '1740897670BDtrHJlzyo154'),
(2160, 96, '1740898864CExByAGrnk437'),
(2161, 101, '1740902448kEDmpAJIyG824'),
(2162, 101, '1740912533ElAzkFCsmv318'),
(2163, 111, '1740914933lpIrmBoyCE812'),
(2164, 101, '1740919222zGlAInmCpr122'),
(2165, 75, '1740937520nIoElAktvw572'),
(2166, 111, '1740959409BsvywDJrml627'),
(2167, 111, '1741021115HotkmCvDzr366'),
(2168, 111, '1741024346owBFHIzmry264'),
(2169, 111, '1741027470IBnqlDHtFk239'),
(2170, 111, '1741033742AHnlktqrzF572'),
(2171, 111, '1741034567xHCrpFwkDB464'),
(2172, 111, '1741038426sqorpFACxE486'),
(2173, 101, '1741064387mFryIDpqnz851'),
(2174, 15, '1741069265wlrJAEsyxv336'),
(2175, 111, '1741072332BsxtElJyDz537'),
(2176, 114, '1741104066JDlmwrvpnB462'),
(2177, 111, '1741117990JInEAkoxmC350'),
(2178, 111, '1741120071BvGrltHnEp706'),
(2179, 111, '1741137310yqvtzmwxFs982'),
(2180, 15, '1741155993lAEmkswCFn122'),
(2181, 101, '1741161387nlyoIDtmzH761'),
(2182, 101, '1741161735tpEHxlvJzs202'),
(2183, 8, '1741176833DtFJGlqpCv862'),
(2184, 8, '1741177383xJCpAvGmIr181'),
(2185, 15, '1741192109mtvIxHrzwB574'),
(2186, 111, '1741203731srHlyozGvA208'),
(2187, 111, '1741207682ktFBGEAzJq333'),
(2188, 111, '1741213893qHxBzFmonv780'),
(2189, 111, '1741217384slkImxwCGF574'),
(2190, 111, '1741217447FmDpEtGxoC267'),
(2191, 111, '1741219555wDqHyJFIxp401'),
(2192, 111, '1741220052zyrAHlFqDk737'),
(2193, 8, '1741247063vApwJEqCxI168'),
(2194, 101, '1741247961lmszpvGnrA512'),
(2195, 101, '1741248079mlwxsnGpIF908'),
(2196, 8, '1741248342rBJEIpAswq208'),
(2197, 111, '1741248989GBqvHAIknF580'),
(2198, 101, '1741249235oksvAEFGpx451'),
(2199, 7, '1741250421wGmnAoDIzl575'),
(2200, 7, '1741250688pIEDCJqFmo152'),
(2201, 111, '1741252680AxtqoyDIsp199'),
(2202, 8, '1741254560DGsyxAIBrk392'),
(2203, 8, '1741255286zqsmtABJIx955'),
(2204, 111, '1741257117DBvClFprto763'),
(2205, 15, '1741257823GysCHxkBDE976'),
(2206, 8, '1741265326xqBGtIoHJp310'),
(2207, 8, '1741265491oxmrEHnFwC308'),
(2208, 101, '1741266699HIyCtqJomp865'),
(2209, 111, '1741273790kvnHwEzAJx947'),
(2210, 111, '1741282456tmJFxklnIo352'),
(2211, 15, '1741282790CIAvmBJnzw896'),
(2212, 118, '1741284429wvBJAnGlom170'),
(2213, 118, '1741285320AEsrFkntIw892'),
(2214, 118, '1741285600kxIDwGnlqo292'),
(2215, 111, '1741288863sIzyorJpGF215'),
(2216, 119, '1741290443FoCEApzDBm416'),
(2217, 120, '1741292729vqHIyxGBlJ565'),
(2218, 120, '1741293147xHrEpmwvFy873'),
(2219, 111, '1741294339xwmpnBFHvJ729'),
(2220, 118, '1741296773JzxqomwIDr282'),
(2221, 111, '1741297140HlJwxFDmor108'),
(2222, 118, '1741297334olDEsmzkpA956'),
(2223, 111, '1741300453kwInrBtFJz370'),
(2224, 111, '1741326594mJnykBpCzr501'),
(2225, 118, '1741339479GotIAJzHws803'),
(2226, 15, '1741354651BvqtonCzwF539'),
(2227, 118, '1741359944mlpsBJxFwA888'),
(2228, 111, '1741363967GqkmADynrw762'),
(2229, 8, '1741368008mxtIBCrHpD976'),
(2230, 101, '1741372090CIomwBxDys880'),
(2231, 111, '1741376410zAxBlwtCGn664'),
(2232, 85, '1741378224CIyGzEvDpw904'),
(2233, 118, '1741382442ExomCFyInB328'),
(2234, 121, '1741382674GxHCtzlAJE560'),
(2235, 121, '1741382972qHJCmsAGlv707'),
(2236, 121, '1741383429vzCqywtFIA972'),
(2237, 118, '1741417021BvFDzJGyxA954'),
(2238, 118, '1741437216GlqJpsEHAC974'),
(2239, 8, '1741445120GCwrtAlkxm378'),
(2240, 111, '1741445169tkxBnDAryz231'),
(2241, 118, '1741445340wDEtGnkxqm575'),
(2242, 14, '1741448526qlExAopmsv591'),
(2243, 122, '1741448849HtoIzDxBEl502');
INSERT INTO `userlogin` (`id`, `user`, `token`) VALUES
(2244, 111, '1741456386HCDFrGkJow349'),
(2245, 101, '1741458563CmvtABrFHJ627'),
(2246, 111, '1741461935zDAElJHxrs467'),
(2247, 111, '1741474596EAvsFDBrpl861'),
(2248, 111, '1741476229EystxFBqJo823'),
(2249, 111, '1741478610qxsvHlJFwn248'),
(2250, 111, '1741479247lwonvEDGFJ283'),
(2251, 111, '1741479674IlzqFmwoxH585'),
(2252, 111, '1741502185yJsGAHzElv815'),
(2254, 15, '1741533438nwmsGAzDlt885'),
(2255, 111, '1741534288AtmBpDFHrl317'),
(2256, 118, '1741537983mqDwszvAlC364'),
(2257, 111, '1741541252IsHoqtAxnz394'),
(2258, 8, '1741542274pzHDlvsIJt760'),
(2259, 7, '1741542442IwHzDlEyAG556'),
(2260, 111, '1741546682HznqElwsvB569'),
(2261, 111, '1741548971EwCynJprvA237'),
(2262, 15, '1741596530kIlJCwpDsG621'),
(2263, 111, '1741597789FpsHEABkmr826'),
(2264, 109, '1741600444ltnFsoBpqk622'),
(2265, 111, '1741601859yBAxFJnopm508'),
(2266, 101, '1741605206FzBnwIpmHr673'),
(2267, 111, '1741605664mwtsBEnIoG351'),
(2268, 111, '1741615405tGFwrDnEvI358'),
(2269, 15, '1741616109CImqrxtplB561'),
(2270, 7, '1741630004kDtqAnIxJr622'),
(2271, 111, '1741636164HlFnEJtqpB471'),
(2272, 111, '1741643672CxnDzkytIp806'),
(2273, 15, '1741675196HoxtCAqwvp167'),
(2274, 101, '1741679479tloFHyrJGA844'),
(2275, 101, '1741685490pIGAJFsrEk968'),
(2276, 118, '1741696955swCrlFDkGt368'),
(2277, 111, '1741700318kGoDxzJyFA836'),
(2278, 118, '1741700872svmDxnBCHy669'),
(2279, 111, '1741702845qklnorsyHm704'),
(2280, 101, '1741704101FBJytIkznA404'),
(2281, 111, '1741705918CImGvqDnts586'),
(2282, 101, '1741707941EmnJpvtlwI391'),
(2283, 109, '1741710429nEmDwtyGCs147'),
(2284, 15, '1741711276zswDnmkGvH380'),
(2285, 111, '1741716871ApoJynCBkF846'),
(2286, 111, '1741761758xwtsvqDGCk934'),
(2287, 118, '1741786864AzoHxBElyn455'),
(2288, 109, '1741798162pkDEFCovrx927'),
(2289, 111, '1741815510HpCznkItqs198'),
(2290, 111, '1741828207FnxDBkrAIv388'),
(2291, 118, '1741866498xJkvsmIyCG729'),
(2292, 111, '1741882408mtExClrspF641'),
(2293, 7, '1741890191EwztkDGqBs869'),
(2294, 109, '1741890985qHszGyJEpl463'),
(2295, 109, '1741891308IsJotFHmpx455'),
(2296, 111, '1741906043GJnBAyHxtw150'),
(2298, 111, '1741906380AFvGsomzry502'),
(2300, 111, '1741906897zrqosBmDlA820'),
(2301, 118, '1741934129DHypotknsm883'),
(2302, 111, '1741936511zAnlxmwyBJ477'),
(2303, 111, '1741941926FsmyAlHDqo769'),
(2304, 111, '1741942013lGJskHAytI271'),
(2305, 101, '1741944806IoxmwskzDF359'),
(2306, 111, '1741944893IpGlnFDHAE627'),
(2308, 125, '1741945549lznpDsxqoI351'),
(2309, 111, '1741945822FApHyqDvlC869'),
(2310, 111, '1742032725klyHnmBAsw684'),
(2311, 111, '1742033095JonypzDAtF346'),
(2312, 7, '1742066131kxvtpBrCyo969'),
(2313, 126, '1742075334JkIABrotHx650'),
(2314, 111, '1742077290HCkzGsEFyr741'),
(2315, 111, '1742077924JvIyCwmElo800'),
(2316, 112, '1742078120swJyBDIvtA677'),
(2317, 112, '1742078121msGnoxrIFt533'),
(2318, 112, '1742078122wmHEvGCzBy979'),
(2319, 112, '1742079788xyrHqzwBmF551'),
(2320, 127, '1742082794HqGmwIrtzo491'),
(2321, 111, '1742085633spAkzlmnHv338'),
(2322, 125, '1742085665DwrnIqlvyp696'),
(2323, 111, '1742103034tCIvJlAsBE609'),
(2324, 111, '1742115072otAECrHlyz908'),
(2325, 111, '1742115225nFlvkJEDyt474'),
(2326, 111, '1742115305zCAmGoysxl471'),
(2327, 118, '1742134867GxolpDJsCv727'),
(2328, 7, '1742144017oJGDnqxlwz981'),
(2329, 7, '1742144147yxvsltHpGn595'),
(2330, 112, '1742153829wDqIvBAGzs131'),
(2331, 112, '1742154711GsloDmwnxC446'),
(2332, 111, '1742157498AksvyDoHEJ336'),
(2333, 125, '1742157570DzvoFsxnJk657'),
(2334, 111, '1742164151BDykwAnmvo437'),
(2335, 15, '1742192324rxJIwyBGqv876'),
(2336, 111, '1742195360zmIvAHFnxs989'),
(2337, 7, '1742198107mkntoFAIqw290'),
(2338, 109, '1742205005JFDkytoEHz298'),
(2339, 109, '1742205729mpJtvlrGkA261'),
(2340, 112, '1742208910xyvplwHmkB769'),
(2341, 112, '1742213031DtJCpomzqA985'),
(2342, 112, '1742214176GtovnBqCky906'),
(2343, 111, '1742225666CxowtGqHJA158'),
(2344, 118, '1742241160qAspHElzBx162'),
(2345, 111, '1742279366lkAvEDzmBx955'),
(2346, 111, '1742289093oEDqtAGlwB737'),
(2347, 111, '1742292284EynzAtqDGr283'),
(2348, 111, '1742293053BJFpGlxEDC565'),
(2349, 7, '1742293571HIAGCvBkoE564'),
(2350, 7, '1742293574sqkwBJrmCE827'),
(2351, 118, '1742295733CyzqrGDmtv620'),
(2352, 111, '1742328774nDGtpAJIEl783'),
(2353, 111, '1742338765wJkvrEsyFC201'),
(2354, 111, '1742379740ylGBtsEIom568'),
(2355, 118, '1742382771HEkzFtJvCA735'),
(2356, 15, '1742390611IDGwyJCztm979'),
(2357, 111, '1742420996DrvynoBpkl512'),
(2358, 111, '1742426650lBzxHAqnEI367'),
(2359, 111, '1742453043lmIApwEkFq276'),
(2360, 111, '1742482512BpnCqsolkx814'),
(2361, 126, '1742491379mwzBsyExoI432'),
(2362, 15, '1742495166HlwrExCsDG359'),
(2363, 111, '1742499223ysnFmlvBCE170'),
(2364, 111, '1742549036kltwypIEoz608'),
(2365, 7, '1742566472wmoEHFlApv964'),
(2366, 111, '1742568466xzsHJvCGpw683'),
(2367, 126, '1742568586vxyzswpqCm592'),
(2368, 15, '1742582298qornwlImyE627'),
(2369, 118, '1742594542zlIAHprmoF369'),
(2370, 118, '1742627987IorvDtHxqE719'),
(2371, 126, '1742629450HDknxtmvIJ794'),
(2372, 111, '1742634990CspoAkHnvJ932'),
(2373, 126, '1742637196poBwtkEqsr921'),
(2374, 111, '1742641234kDnAsJIHmp869'),
(2375, 95, '1742642798rDtoqAswBF825'),
(2376, 126, '1742642844GnCpAktDBo628'),
(2377, 111, '1742642976krFGEItCHo222'),
(2378, 126, '1742645938lsyHxCvzkq529'),
(2379, 118, '1742646131nsArItDlwp149'),
(2380, 111, '1742647337tlvzDEmIrs651'),
(2381, 126, '1742648832zGyvrnmlFJ700'),
(2382, 111, '1742649518lGBtsDnIkp584'),
(2383, 111, '1742652111tqEGnvkosH761'),
(2384, 111, '1742654267GqImpyBsDC122'),
(2385, 7, '1742658385stFkzJvIDH110'),
(2386, 128, '1742661285kpDmtGrAsv971'),
(2387, 125, '1742662305yDxGsmkqpC576'),
(2388, 111, '1742662970mrCFGzJHwD244'),
(2389, 7, '1742678908FBwzoDlvIC663'),
(2390, 7, '1742681170xvIFoknmsE103'),
(2391, 7, '1742715153zFJHIlCDro272'),
(2392, 118, '1742717657lIxEHypBGo186'),
(2393, 7, '1742720016plFDrtkJAw550'),
(2394, 112, '1742720555EnIwsDApHJ194'),
(2395, 111, '1742729780FnJxqyszol679'),
(2396, 111, '1742735794FnrDxHCqlo426'),
(2397, 111, '1742742476xmzBoHFDGt676'),
(2398, 111, '1742747128vBCkHwntxD328'),
(2399, 104, '1742749658pwvzoryFlm648'),
(2400, 9, '1742754524omrxyDwpEn664'),
(2401, 104, '1742760847nkmtEJwFHs179'),
(2402, 125, '1742762023DrCtqspxIG999'),
(2403, 112, '1742769271JDCpwxlqBr839'),
(2404, 7, '1742807396zFEovxqlyA416'),
(2405, 121, '1742825445FwzGBHEClm821'),
(2406, 112, '1742825565IsvnyGEBlq405'),
(2407, 118, '1742826061lsHDIntyzG110'),
(2408, 104, '1742832574oqyJtGDpnA953'),
(2409, 7, '1742837027xAFzsrpDmt275'),
(2410, 7, '1742839329BEpzmJvwlF525'),
(2411, 7, '1742853921kvsBJzHmlt920'),
(2412, 126, '1742860037DymICqwpHn629'),
(2413, 7, '1742883094wtvmrxlnpk924'),
(2414, 104, '1742911355nDBIwzrFsk312'),
(2415, 118, '1742920631prICHxsJEk883'),
(2416, 104, '1742927979vFzrwslDym561'),
(2417, 111, '1742928452sByotwJxqz360'),
(2418, 104, '1742929485skmHInECly629'),
(2419, 7, '1742931152GDpkzyoBwC822'),
(2420, 104, '1742946077ozHtkDFIrq447'),
(2421, 118, '1742969620sCIFvGJymx812'),
(2422, 104, '1743039669kAsIJlErFB173'),
(2423, 104, '1743039974tvkmJGxlDE798'),
(2424, 125, '1743040001EJyDHFIkzt307'),
(2425, 104, '1743041705rtomvnzxlH396'),
(2426, 129, '1743060245GtCnDmJwyq558'),
(2427, 125, '1743060335lmqkwyCxIs693'),
(2428, 130, '1743065182swJlryxvHq792'),
(2429, 130, '1743065275tBwsHzIokm553'),
(2430, 130, '1743065587xGrkDHIpyw280'),
(2431, 130, '1743065733zEFnBotGyw776'),
(2432, 130, '1743066940sHwAGzBxkJ855'),
(2433, 126, '1743071271oAwlzpvyts494'),
(2434, 131, '1743110025npJmkzxCrl447'),
(2435, 111, '1743123330vlwkoEHqtr770'),
(2436, 129, '1743125378ypDwnmtBxF807'),
(2437, 129, '1743127145ysvwEFroBk175'),
(2438, 129, '1743132036lnrDymGHkB779'),
(2439, 15, '1743142018FxqwGIBrny128'),
(2440, 129, '1743149358kDsmwpCltI674'),
(2441, 104, '1743150265CApnGHqlIo285'),
(2442, 15, '1743150447rntIAoJyCw206'),
(2443, 130, '1743156293IBJyCHpksq136'),
(2444, 111, '1743164994vlwmnGBIFy385'),
(2445, 104, '1743165433BrCHEoyIsl964'),
(2446, 130, '1743168200nskolGmJwD207'),
(2447, 130, '1743168571AGEBynCHsv630'),
(2448, 130, '1743169096EpAGtHnzsC752'),
(2449, 130, '1743169431JtlqmpzvDo917'),
(2450, 125, '1743169948optqszIFwl800'),
(2451, 104, '1743170738tDEwoIplAk484'),
(2452, 126, '1743176598CoxDwqGtms218'),
(2453, 9, '1743176642vxFACBpDqJ605'),
(2454, 9, '1743176811oDtrzmqBnJ559'),
(2455, 101, '1743177944tlkCpEwnoF548'),
(2456, 130, '1743179782BklAmyrsDw667'),
(2457, 9, '1743179924HCJnqABDFo185'),
(2458, 130, '1743180044kwzFqmArJv146'),
(2459, 130, '1743180356vrBzkyqpmn911'),
(2460, 126, '1743188147tCFBJoHxDp203'),
(2461, 126, '1743190750DqxkovGtrs287'),
(2462, 126, '1743190758krJtmlEIoz477'),
(2463, 118, '1743191265pwnGtBryDF499'),
(2464, 112, '1743198046roDwpCGlEz649'),
(2465, 129, '1743223071HJFvnwpmqA931'),
(2466, 126, '1743225923GoFAExvtHp236'),
(2467, 104, '1743232191tovyrwpDlH187'),
(2468, 104, '1743238817woItyxsEpJ146'),
(2469, 125, '1743238836IBEvozsAxt265'),
(2470, 132, '1743242351DsGBymznCo772'),
(2472, 132, '1743244621owsIzkFvDx901'),
(2474, 132, '1743244785vzDFtpxArJ504'),
(2475, 132, '1743244964vFrwykHxnt952'),
(2476, 132, '1743245059DkFExoIvnw981'),
(2477, 132, '1743245813tCryzmxHFI941'),
(2478, 132, '1743245845FJGqxoDvmp548'),
(2479, 132, '1743249333slHIzEJvDn382'),
(2480, 132, '1743361115DsEIryFmwo236'),
(2481, 132, '1743381537qstDGIxJrC875'),
(2482, 132, '1743408329EFszJwtGCH234'),
(2483, 132, '1743410643DCmtGEIkpz513'),
(2484, 132, '1743413837FDvIJopyCz197'),
(2485, 132, '1743413886EsGIxJFovC201'),
(2486, 132, '1743423477xIplEmBzkq710'),
(2487, 132, '1743424256pmzAxnBlsI689'),
(2488, 132, '1743432637qkmCFvnwrG236'),
(2489, 132, '1743452301IJnmEGwDFo801'),
(2490, 132, '1743454959ysrlxoEIJD339'),
(2491, 132, '1743484389HCtmEADFln929'),
(2492, 132, '1743489323pFIvqsrADy477'),
(2493, 132, '1743490952CrsqAkBHwz696'),
(2494, 132, '1743514034owtmnJIpyF711'),
(2495, 132, '1743623484nBAIxEpmHz479'),
(2496, 132, '1743689389BIwFlsArmk955'),
(2497, 132, '1743689844sGpAmBIyvD154'),
(2498, 132, '1743690337GsoynFxElC205'),
(2499, 132, '1743704904CtIypEDFkw839'),
(2500, 132, '1743707427zGIlAFmrps989'),
(2501, 132, '1743712705spmArBHwlI739'),
(2502, 132, '1743720476HJpzAtDqxC145'),
(2503, 132, '1743725076lwvJIAoCBH929'),
(2504, 132, '1743747079sCqADonEBx568'),
(2505, 132, '1743752848HmsJqEBkGo965'),
(2506, 132, '1743757755mlHzonGEFx144'),
(2507, 132, '1743766269yHDsqvkxlo219'),
(2508, 132, '1743780812qDlmsBypIk748'),
(2509, 132, '1743797360olnvDrBAqk707'),
(2510, 132, '1743804394ntvoApEFqD689'),
(2511, 132, '1743807570znAkvHxoFs405'),
(2512, 132, '1743815699CpAItnlxzH318'),
(2513, 132, '1743848675HywplIkAJB477'),
(2514, 132, '1743862002xGCytqnoDz973'),
(2515, 132, '1743877329zDmrsCqoIy116'),
(2516, 132, '1743881567wnGEoqJxDB676'),
(2517, 132, '1743890988srlmIxtonz158'),
(2518, 132, '1743997472JxsHpwzACB990'),
(2519, 132, '1743997964mBIHxolEGy722'),
(2520, 132, '1743998101pCrxnqlIys652'),
(2521, 132, '1743998364qlBJsxCrFG464'),
(2522, 132, '1743999078sqmJwkxHtB774'),
(2523, 132, '1744006002tCvqFsmJHA702'),
(2524, 132, '1744009339pyqAtonBEI560'),
(2525, 132, '1744066526JrnCDoqFkm827'),
(2526, 132, '1744069683xHtqzJIvyp579'),
(2527, 132, '1744091707DCxArowznH748'),
(2528, 132, '1744110402HprAxlzGok857'),
(2529, 132, '1744118886HmqnGtBvzw291'),
(2530, 132, '1744138958ECvyHxAlro602'),
(2531, 132, '1744150402xJszHtynEv410'),
(2532, 132, '1744175037oDlysFHGqE793'),
(2533, 132, '1744177932JlnAmGxFrv882'),
(2534, 134, '1744209918mzHsxnDypo433'),
(2535, 132, '1744210023ovDBlFkHsz349'),
(2536, 134, '1744210186FBCEHmkoyr831'),
(2537, 134, '1744213645FrxzqDBnpw102'),
(2538, 134, '1744213646CvGtkHIAms712'),
(2539, 134, '1744217310EJkDxzwtCG565'),
(2540, 132, '1744233253xBpvJnmDsl265'),
(2541, 132, '1744233714nEwCtkJpBG514'),
(2542, 132, '1744233734wGArEysBvn257'),
(2543, 132, '1744233761AvxmCztpln158'),
(2544, 132, '1744233786mnloGEvHIz922'),
(2545, 132, '1744234118yIozsxAkDC248'),
(2546, 132, '1744234221ErIpCtyJmz569'),
(2547, 132, '1744234258lBJtEvsnmo219'),
(2548, 132, '1744246337onwBzAsDJr180'),
(2549, 132, '1744249807DklzqrFEBv927'),
(2550, 132, '1744250215ByvJAxswnD855'),
(2551, 132, '1744339103JnBrvwqDmp511'),
(2552, 134, '1744340179rlAvoHkDmz167'),
(2553, 134, '1744342477xFAGEBwvDH632'),
(2554, 134, '1744350105pHBqyFmCvE460'),
(2555, 132, '1744351243CFyEpmItBv705'),
(2556, 134, '1744351370xtvFsJnBwo270'),
(2557, 132, '1744366335qzrFmkyHIt644'),
(2558, 134, '1744414894yIBJAEtDCm710'),
(2559, 132, '1744453586yrvGCwElFo818'),
(2560, 132, '1744456024GCmpJtsIDv159'),
(2561, 132, '1744472148HImtsqwvlo922'),
(2562, 132, '1744475106IClxvqmorz237'),
(2563, 132, '1744664228sypwEzDlnH801'),
(2564, 132, '1744698858trlBmHAkvn146'),
(2565, 132, '1744709271znCGksFEDw457'),
(2566, 134, '1744793625BFCtIwlDyo986'),
(2567, 134, '1744796904HJACFImDGv596'),
(2568, 132, '1744839881pGtzqImDCr578'),
(2569, 132, '1744846071rCwxzqpHym422'),
(2570, 132, '1744908056ItnGwHqADk590'),
(2571, 132, '1744923709ItqlzwBGAk927'),
(2572, 134, '1744943275JnHqmxvyGE569'),
(2573, 132, '1744943860wJrnotlHqv190'),
(2574, 132, '1744947667AkDwnorHpv705'),
(2575, 132, '1744973819nAmrxyJEpD482'),
(2576, 132, '1745021391kyHIBrxvpC454'),
(2577, 132, '1745055365prlGqHtCsm996'),
(2578, 132, '1745147050wFtHrBnsqm431'),
(2579, 132, '1745168996lEqFsHIGJt101'),
(2580, 132, '1745185459oDHsnvEGAC874'),
(2581, 132, '1745223053ItDEBCsFGx175'),
(2582, 132, '1745228715kDIoynCmAr514'),
(2583, 132, '1745232883pAByDlszCn534'),
(2584, 132, '1745233294kovIwGtBnx892'),
(2585, 132, '1745344944kxntEmCrIw807'),
(2586, 132, '1745360022mHJxBqEylF773'),
(2587, 132, '1745364537lvExpIwkDz732'),
(2588, 136, '1745365470vqJHxslCwD542'),
(2589, 132, '1745390465xrCFJnywqs905'),
(2590, 132, '1745395383AznItrvCsH895'),
(2591, 132, '1745420588IroBsCktpD320'),
(2592, 132, '1745422253yIBtCqrkmx557'),
(2593, 132, '1745437371nlEFDpJzHs575'),
(2594, 132, '1745442682ImCtpkJxHs153'),
(2595, 132, '1745444667wrkCGByDtE787'),
(2596, 132, '1745447670oFqClmnsAB107'),
(2597, 132, '1745482324BlyxoFqsJH997'),
(2598, 132, '1745517601wGJyxEIDFm407'),
(2599, 132, '1745526087BzJoDtqslC126'),
(2600, 132, '1745552954mnDoxvAyzp320'),
(2601, 132, '1745564820xqJtpGDvnF704'),
(2602, 132, '1745705247xAJqkotBry301'),
(2603, 132, '1745714416ylBCtmAkJF965'),
(2604, 132, '1745780003lvCrDoGkmq339'),
(2605, 132, '1745819003sHyFzwDtlm943'),
(2606, 132, '1746006430oCIkqDzxly327'),
(2607, 132, '1746008880plsrmkHzDB560'),
(2608, 132, '1746015194GkDIxCJrpw884'),
(2609, 132, '1746018387sykJnwvGpE227'),
(2610, 132, '1746050206BxEAqvrtJF890'),
(2611, 132, '1746098281zlktqHEGnm503'),
(2612, 132, '1746250240DBCIykqmFl676'),
(2613, 132, '1746301077GmFDtAlxIy104'),
(2614, 132, '1746381126yEtFsvnqow996'),
(2615, 132, '1746450260svqnpDFlJB271'),
(2616, 132, '1746525827poxkwmnADl742'),
(2617, 132, '1746709592tlwEqzApHB986'),
(2618, 132, '1746803874rpyFEtoHmA454'),
(2619, 132, '1746834287JxFqIElAnB255'),
(2620, 132, '1746989873znqDxsHFtp515'),
(2621, 132, '1747057070DHJkAwvpGt548'),
(2622, 132, '1747064871HFDAmwkBIt745'),
(2623, 132, '1747132089EoFtpxrvmG766'),
(2624, 132, '1747173440qxyprBwsJE485'),
(2625, 132, '1747207583CEIvyqHFtp262'),
(2626, 132, '1747209820FkItwzopHl955'),
(2627, 132, '1747216261sElJCwrqmx428'),
(2628, 132, '1747219223nlkvGxIEsC434'),
(2629, 132, '1747264161DvxAqzsBtG239'),
(2630, 132, '1747269184mCltyHFJAp389'),
(2631, 132, '1747303779oAskrptnIC308'),
(2632, 132, '1747353279GmnwzFDslJ210'),
(2633, 132, '1747431216ozsylAwFvt402'),
(2634, 132, '1747436526pmGzCyHDnr371'),
(2635, 132, '1747469152BGmnzyCIkD266'),
(2636, 132, '1747478623sIHJqCwDBE862'),
(2637, 132, '1747484531ksqpwytClI825'),
(2638, 132, '1747548370qDGryktAHm308'),
(2639, 132, '1747568009zpJqCyDBIA860'),
(2640, 132, '1747592155xrGsJvtIok257'),
(2641, 132, '1747758792tlCsDxmHyF380'),
(2642, 132, '1747764814BwnloIxDty887'),
(2643, 132, '1747857210ECsomktJlI803'),
(2644, 132, '1747905929CEFtIqykns999'),
(2645, 132, '1747988972lGvyInCHts291'),
(2646, 132, '1747989529vtAxkqsoIy164'),
(2647, 132, '1747993565HItvzswxyn389'),
(2648, 132, '1747999970GDqmxlkAvp801'),
(2649, 132, '1748031302xEpDtCFAnz300'),
(2650, 132, '1748069002oJFqrxvsCB774'),
(2651, 132, '1748111186xnEDkzwroG685'),
(2652, 132, '1748157898DEwplGqIFH572'),
(2653, 132, '1748243064HzCIvoGpDr644'),
(2654, 132, '1748352332CIvAoBEpJn506'),
(2655, 132, '1748395698FCDGmoqEAk256'),
(2656, 132, '1748505568ysCxztHFAr654'),
(2657, 132, '1748520423rxAFzvDmnJ432'),
(2658, 132, '1748545430AzwsxpFnyC809'),
(2659, 132, '1748549251pxClDkAtmw219'),
(2660, 132, '1748589843szJqklpnBI608'),
(2661, 132, '1748593361JArEyzlvHG645'),
(2662, 132, '1748593394zoDsvIwxqG338'),
(2663, 132, '1748593426ozFtwEAyBv653'),
(2664, 132, '1748593580vAzmCxBtDF888'),
(2665, 132, '1748593796BzoyIGJqAs869'),
(2666, 132, '1748593852oBzxkmCFGl981'),
(2667, 132, '1748593886lIvzBAJtkq463'),
(2668, 132, '1748594064nmArxGzkwo690'),
(2669, 132, '1748595841CoJsGlzBmr995'),
(2670, 132, '1748604804zqmDtHFwEp615'),
(2671, 132, '1748606307swJklnoFEx390'),
(2672, 132, '1748687077FvzGrHBnCI714'),
(2673, 134, '1748768431smkoyHvFtq242'),
(2674, 132, '1748806778oExnyqrJtA740'),
(2675, 132, '1748856293HoGksFAxzE475'),
(2676, 132, '1748935401vIsqAnFwyl250'),
(2677, 132, '1748937740IoGDFkHwCs993'),
(2678, 132, '1748971235lCoBAkqDnJ598'),
(2679, 132, '1749021441xAznHGFvDp307'),
(2680, 136, '1749022554tIoksDHmBz526'),
(2681, 132, '1749026364IlwFpCGqBm662'),
(2682, 132, '1749038939ztplJwnIor691'),
(2683, 132, '1749061810lAyHzDCpqr719'),
(2684, 132, '1749089982pBvGDxwzln179'),
(2685, 132, '1749104904IHDAltvmoz339'),
(2686, 132, '1749124477sBtIwJzpnD472'),
(2687, 132, '1749141146BCrmEwzxqD526'),
(2688, 132, '1749185573AFCpwrDovE193'),
(2689, 132, '1749194448AIzqwrJvkx890'),
(2690, 132, '1749205279sHAoBDFzrE666'),
(2691, 132, '1749214698rDtJzkxBvG398'),
(2692, 132, '1749222608FyCoqpkBmD960'),
(2693, 132, '1749240427rJoxvBGpqm344'),
(2694, 132, '1749244597oCGxDlHqsv751'),
(2695, 132, '1749282760vnBFkGrqJo317'),
(2696, 132, '1749303117kvtHrEoIxA197'),
(2697, 132, '1749367592vmoqGtIwFC366'),
(2698, 132, '1749373764AwnoxmIGFy919'),
(2699, 132, '1749377225BktJvHqFrp369'),
(2700, 132, '1749388587FoIAmskDln422'),
(2701, 132, '1749478865oDIlpGACwv184'),
(2702, 132, '1749495055rwxtmIyonC914'),
(2703, 132, '1749543214rJEnmBlkwo557'),
(2704, 132, '1749567631FnBIrmHzAk562'),
(2705, 132, '1749583055tsBxyqAGDF246'),
(2706, 132, '1749670533lFIrCBmAzn916'),
(2707, 132, '1749800749HJxslkowyr525'),
(2708, 132, '1749852439wBIAvxFnqE784'),
(2709, 132, '1749928676rlsFAkBoEH730'),
(2710, 132, '1749994436vlFmpDBCHG403'),
(2711, 132, '1750016134lEDpHqzoGm631'),
(2712, 132, '1750034025DoGHnqsCrk356'),
(2713, 132, '1750060206trvxDkmCAy704'),
(2714, 132, '1750068205AIkJCnmyFG847'),
(2715, 132, '1750229405CqoBrlJxFE982'),
(2716, 132, '1750274578kpDzyxBors705'),
(2717, 132, '1750454203sGpywqHotl265'),
(2718, 132, '1750490221twGrBzIvpA643'),
(2719, 132, '1750497083EIvDwJyqGC919'),
(2720, 132, '1750507982xvqzmpClHy330'),
(2721, 132, '1750531279vBnCqDyGmk356'),
(2722, 132, '1750535988stmrCopIAv118'),
(2723, 132, '1750539496ECsworFJHI589'),
(2724, 132, '1750671871nDxHGJztol719'),
(2725, 132, '1750700058nHJxzkvFmI150'),
(2726, 132, '1750779067qIFowEJABx750'),
(2727, 132, '1750784949vlpmrFACsD143'),
(2728, 132, '1750791021rGAowtpksJ261'),
(2729, 132, '1750925320vsErJqtwzy918'),
(2730, 132, '1750925324CtyJqsxvIp405'),
(2731, 132, '1751026340oDqIBHrykt113'),
(2732, 132, '1751104433IsvDpGAxJk504'),
(2733, 132, '1751227183qoxApzwCsH267'),
(2734, 132, '1751227597JyFDHpEGlv341'),
(2737, 138, '1768387195AlHxkvEsIB918'),
(2738, 138, '1768389190FwnrEHGyIJ183'),
(2739, 139, '1768391703EnslrkJtAv329'),
(2740, 139, '1768391858oDzxlFytJk274'),
(2741, 139, '1768392735FtCEsIGHkz480'),
(2742, 139, '1768392741yItFBJCDlz951'),
(2743, 139, '1768392751lyDCHznwGA546'),
(2744, 139, '1768392952JqoImxpylF919');

-- --------------------------------------------------------

--
-- Table structure for table `uservisits`
--

CREATE TABLE `uservisits` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `state` varchar(10) NOT NULL,
  `visitTime` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uservisits`
--

INSERT INTO `uservisits` (`id`, `user`, `state`, `visitTime`) VALUES
(5, 2, 'Ogun', '1727970982'),
(6, 3, 'Delta', '1727971422'),
(17, 7, 'Imo', '1728753163'),
(18, 8, 'Delta', '1728775168'),
(19, 9, 'Lagos', '1729108387'),
(20, 8, 'Delta', '1729269618'),
(21, 10, 'Delta', '1729329665'),
(22, 10, 'Delta', '1729329755'),
(23, 10, 'Delta', '1729329933'),
(25, 12, 'Delta', '1729349851'),
(30, 7, 'Imo', '1729412188'),
(31, 8, 'Delta', '1729540718'),
(32, 8, 'Delta', '1729540770'),
(33, 8, 'Delta', '1729540902'),
(34, 8, 'Delta', '1729541230'),
(36, 14, 'Osun', '1729892166'),
(37, 15, 'Edo', '1729919652'),
(38, 16, 'Akwa Ibom', '1730021986'),
(39, 9, 'Lagos', '1730318871'),
(82, 8, 'Delta', '1730592989'),
(83, 8, 'Delta', '1730594688'),
(84, 9, 'Lagos', '1730667821'),
(98, 44, 'Delta', '1730824759'),
(103, 50, 'Katsina', '1731010400'),
(108, 52, 'Delta', '1731339728'),
(109, 53, 'Anambra', '1731530335'),
(111, 3, 'Delta', '1731694445'),
(112, 54, 'Lagos', '1731774894'),
(113, 55, 'Bauchi', '1731786015'),
(114, 56, 'Taraba', '1731792230'),
(115, 7, 'Imo', '1731839522'),
(116, 57, 'Akwa Ibom', '1731840530'),
(120, 60, 'Oyo', '1731849998'),
(121, 61, 'Kaduna', '1731871703'),
(124, 68, 'Enugu', '1732086411'),
(125, 69, 'Abia', '1732087224'),
(126, 70, 'Lagos', '1732100081'),
(127, 71, 'Ekiti', '1732194858'),
(128, 12, 'Delta', '1732305516'),
(129, 73, 'Delta', '1732362542'),
(130, 10, 'Delta', '1732444003'),
(131, 15, 'Edo', '1732525835'),
(132, 74, 'Niger', '1732876527'),
(133, 75, 'Oyo', '1732900973'),
(140, 76, 'Taraba', '1733259571'),
(141, 76, 'Taraba', '1733260156'),
(146, 76, 'Taraba', '1733263044'),
(152, 76, 'Taraba', '1733347294'),
(155, 76, 'Taraba', '1733478583'),
(156, 76, 'Taraba', '1733483040'),
(165, 75, 'Oyo', '1733496498'),
(170, 76, 'Taraba', '1733608989'),
(171, 76, 'Taraba', '1733610247'),
(172, 76, 'Taraba', '1733621917'),
(173, 78, 'Bayelsa', '1733700433'),
(174, 79, 'Niger', '1733757628'),
(175, 14, 'Osun', '1733758752'),
(176, 80, 'Kaduna', '1733784067'),
(178, 82, 'Benue', '1733786567'),
(179, 84, 'Kaduna', '1733820382'),
(180, 85, 'Delta', '1733821376'),
(181, 86, 'Delta', '1733843828'),
(182, 87, 'Delta', '1733856141'),
(183, 76, 'Taraba', '1733861400'),
(184, 88, 'Lagos', '1733916148'),
(186, 89, 'Osun', '1734065575'),
(191, 91, 'Anambra', '1734096438'),
(195, 92, 'Lagos', '1734354074'),
(196, 94, 'Sokoto', '1734357493'),
(199, 75, 'Oyo', '1734548488'),
(201, 95, 'Delta', '1734604057'),
(202, 95, 'Delta', '1734605022'),
(203, 96, 'Delta', '1734605181'),
(205, 7, 'Imo', '1734885271'),
(207, 10, 'Delta', '1735119051'),
(208, 75, 'Oyo', '1735548706'),
(209, 8, 'Delta', '1735550024'),
(212, 7, 'Imo', '1735578173'),
(214, 15, 'Edo', '1735625424'),
(215, 98, 'Lagos', '1735646658'),
(217, 99, 'Lagos', '1735932048'),
(219, 9, 'Lagos', '1735935327'),
(220, 75, 'Oyo', '1736092168'),
(223, 100, 'Delta', '1736693430'),
(224, 101, 'Edo', '1736936336'),
(225, 101, 'Edo', '1737024896'),
(232, 103, 'Osun', '1737198591'),
(235, 79, 'Niger', '1737281046'),
(236, 79, 'Niger', '1737281515'),
(237, 94, 'Sokoto', '1737300380'),
(238, 104, 'Delta', '1737362876'),
(239, 104, 'Delta', '1737364728'),
(240, 104, 'Delta', '1737365132'),
(241, 85, 'Delta', '1737492529'),
(242, 104, 'Delta', '1737669898'),
(243, 10, 'Delta', '1737748420'),
(244, 104, 'Delta', '1737913507'),
(245, 104, 'Delta', '1738007180'),
(246, 104, 'Delta', '1738010859'),
(247, 104, 'Delta', '1738011509'),
(248, 52, 'Delta', '1738073682'),
(249, 52, 'Delta', '1738082665'),
(250, 105, 'Bauchi', '1738161522'),
(251, 106, 'Gombe', '1738161869'),
(252, 7, 'Imo', '1738212923'),
(253, 15, 'Edo', '1738239095'),
(254, 107, 'Abuja FCT', '1738266462'),
(255, 108, 'Ondo', '1738269152'),
(256, 104, 'Delta', '1738314401'),
(257, 104, 'Delta', '1738314480'),
(258, 104, 'Delta', '1738314508'),
(259, 104, 'Delta', '1738314599'),
(260, 104, 'Delta', '1738314789'),
(261, 104, 'Delta', '1738314831'),
(262, 104, 'Delta', '1738316846'),
(263, 104, 'Delta', '1738330723'),
(264, 104, 'Delta', '1738330964'),
(265, 104, 'Delta', '1738331645'),
(266, 107, 'Abuja FCT', '1738358290'),
(267, 104, 'Delta', '1738398364'),
(268, 109, 'Delta', '1738428153'),
(269, 75, 'Oyo', '1738481076'),
(270, 107, 'Abuja FCT', '1738503791'),
(271, 96, 'Delta', '1738655473'),
(272, 110, 'Kano', '1738667820'),
(273, 96, 'Delta', '1738670552'),
(274, 104, 'Delta', '1738670726'),
(275, 96, 'Delta', '1738736053'),
(276, 75, 'Oyo', '1738738015'),
(277, 9, 'Lagos', '1738790231'),
(278, 96, 'Delta', '1739442247'),
(279, 9, 'Lagos', '1739547551'),
(280, 9, 'Lagos', '1739548206'),
(281, 104, 'Delta', '1739743790'),
(282, 104, 'Delta', '1739747605'),
(283, 104, 'Delta', '1739747611'),
(284, 104, 'Delta', '1739747618'),
(285, 104, 'Delta', '1739747737'),
(286, 104, 'Delta', '1739747899'),
(287, 104, 'Delta', '1739748854'),
(288, 8, 'Delta', '1739750278'),
(289, 111, 'Delta', '1739754063'),
(290, 104, 'Delta', '1739754315'),
(291, 104, 'Delta', '1739755816'),
(292, 101, 'Edo', '1739798781'),
(293, 104, 'Delta', '1739872039'),
(294, 79, 'Niger', '1739908920'),
(295, 104, 'Delta', '1740004938'),
(296, 111, 'Delta', '1740035200'),
(297, 112, 'Taraba', '1740088767'),
(298, 112, 'Taraba', '1740088920'),
(299, 111, 'Delta', '1740089457'),
(300, 111, 'Delta', '1740090937'),
(301, 111, 'Delta', '1740093976'),
(302, 113, 'Abuja FCT', '1740115981'),
(303, 104, 'Delta', '1740212733'),
(304, 111, 'Delta', '1740234994'),
(305, 100, 'Delta', '1740291510'),
(306, 114, 'Delta', '1740318182'),
(307, 85, 'Delta', '1740337870'),
(308, 10, 'Delta', '1740341290'),
(309, 100, 'Delta', '1740378809'),
(310, 111, 'Delta', '1740430123'),
(311, 111, 'Delta', '1740430130'),
(312, 111, 'Delta', '1740430135'),
(313, 111, 'Delta', '1740431577'),
(314, 111, 'Delta', '1740431774'),
(315, 111, 'Delta', '1740431887'),
(316, 111, 'Delta', '1740432616'),
(317, 111, 'Delta', '1740432857'),
(318, 111, 'Delta', '1740437047'),
(319, 111, 'Delta', '1740437061'),
(320, 115, 'Kano', '1740495201'),
(321, 115, 'Kano', '1740499049'),
(322, 115, 'Kano', '1740499090'),
(323, 92, 'Lagos', '1740565713'),
(324, 115, 'Kano', '1740581002'),
(325, 115, 'Kano', '1740581126'),
(326, 100, 'Delta', '1740586760'),
(327, 116, 'Delta', '1740586821'),
(328, 114, 'Delta', '1740657968'),
(329, 114, 'Delta', '1740658509'),
(330, 111, 'Delta', '1740660870'),
(331, 111, 'Delta', '1740665443'),
(332, 95, 'Delta', '1740675962'),
(333, 117, 'Imo', '1740685527'),
(334, 117, 'Imo', '1740686812'),
(335, 117, 'Imo', '1740687591'),
(336, 114, 'Delta', '1740713026'),
(337, 111, 'Delta', '1740741523'),
(338, 111, 'Delta', '1740749987'),
(339, 111, 'Delta', '1740750032'),
(340, 111, 'Delta', '1740752191'),
(341, 52, 'Delta', '1740764916'),
(342, 111, 'Delta', '1740773836'),
(343, 111, 'Delta', '1740780022'),
(344, 111, 'Delta', '1740781729'),
(345, 111, 'Delta', '1740781863'),
(346, 111, 'Delta', '1740859871'),
(347, 111, 'Delta', '1740914935'),
(348, 111, 'Delta', '1741034571'),
(349, 101, 'Edo', '1741064391'),
(350, 15, 'Edo', '1741069270'),
(351, 8, 'Delta', '1741176835'),
(352, 111, 'Delta', '1741217386'),
(353, 111, 'Delta', '1741217449'),
(354, 111, 'Delta', '1741220055'),
(355, 101, 'Edo', '1741249237'),
(356, 7, 'Imo', '1741250423'),
(357, 118, 'Delta', '1741284432'),
(358, 119, 'Niger', '1741290445'),
(359, 120, 'Delta', '1741292731'),
(360, 118, 'Delta', '1741359948'),
(361, 121, 'Delta', '1741382676'),
(362, 121, 'Delta', '1741383431'),
(363, 14, 'Osun', '1741448528'),
(364, 122, 'Abuja FCT', '1741448851'),
(365, 111, 'Delta', '1741479248'),
(367, 109, 'Delta', '1741600447'),
(368, 109, 'Delta', '1741890987'),
(370, 112, 'Taraba', '1742078123'),
(371, 112, 'Taraba', '1742078123'),
(372, 112, 'Taraba', '1742078124'),
(373, 112, 'Taraba', '1742079789'),
(374, 127, 'Abuja FCT', '1742082797'),
(375, 111, 'Delta', '1742115306'),
(376, 118, 'Delta', '1742134876'),
(377, 112, 'Taraba', '1742153831'),
(378, 125, 'Delta', '1742157572'),
(379, 128, 'Osun', '1742661288'),
(380, 125, 'Delta', '1742662308'),
(381, 112, 'Taraba', '1742720557'),
(382, 9, 'Lagos', '1742754526'),
(383, 125, 'Delta', '1742762025'),
(384, 112, 'Taraba', '1742769273'),
(385, 112, 'Taraba', '1742825567'),
(386, 126, 'Delta', '1742860039'),
(387, 104, 'Delta', '1742929487'),
(388, 125, 'Delta', '1743040002'),
(389, 104, 'Delta', '1743041708'),
(390, 129, 'Lagos', '1743060248'),
(391, 130, 'Oyo', '1743065185'),
(392, 131, 'Kwara', '1743110028'),
(393, 9, 'Lagos', '1743176644'),
(394, 112, 'Taraba', '1743198048'),
(397, 132, 'Delta', '1743244965'),
(398, 132, 'Delta', '1743245847'),
(399, 132, 'Delta', '1743249335'),
(400, 132, 'Delta', '1743410654'),
(401, 132, 'Delta', '1743423479'),
(402, 132, 'Delta', '1743690339'),
(403, 132, 'Delta', '1743998103'),
(404, 132, 'Delta', '1743998366'),
(405, 132, 'Delta', '1743999079'),
(406, 134, 'Delta', '1744210188'),
(407, 132, 'Delta', '1744233255'),
(408, 132, 'Delta', '1744233716'),
(409, 132, 'Delta', '1744233736'),
(410, 132, 'Delta', '1744233763'),
(411, 132, 'Delta', '1744233787'),
(412, 132, 'Delta', '1744234260'),
(413, 132, 'Delta', '1744339105'),
(414, 134, 'Delta', '1744340182'),
(415, 132, 'Delta', '1744351245'),
(416, 134, 'Delta', '1744351372'),
(417, 132, 'Delta', '1744943863'),
(418, 132, 'Delta', '1746709594'),
(419, 132, 'Delta', '1746834289'),
(420, 132, 'Delta', '1747988974'),
(421, 132, 'Delta', '1748593363'),
(422, 132, 'Delta', '1748593396'),
(423, 132, 'Delta', '1748593428'),
(424, 132, 'Delta', '1748593582'),
(425, 132, 'Delta', '1748593797'),
(426, 132, 'Delta', '1748593854'),
(427, 132, 'Delta', '1748593888'),
(428, 132, 'Delta', '1748594066'),
(429, 134, 'Delta', '1748768433'),
(430, 132, 'Delta', '1749543219'),
(431, 132, 'Delta', '1750791023'),
(432, 132, 'Delta', '1751227190'),
(434, 138, 'Lagos', '1768389195'),
(435, 139, 'Bauchi', '1768391861'),
(436, 139, 'Bauchi', '1768392956');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airtime`
--
ALTER TABLE `airtime`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `airtimepin`
--
ALTER TABLE `airtimepin`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `airtimepinprice`
--
ALTER TABLE `airtimepinprice`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `airtimetokens`
--
ALTER TABLE `airtimetokens`
  ADD PRIMARY KEY (`tId`);

--
-- Indexes for table `alphatopupprice`
--
ALTER TABLE `alphatopupprice`
  ADD PRIMARY KEY (`alphaId`);

--
-- Indexes for table `apiconfigs`
--
ALTER TABLE `apiconfigs`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `apilinks`
--
ALTER TABLE `apilinks`
  ADD PRIMARY KEY (`aId`);

--
-- Indexes for table `beneficiary`
--
ALTER TABLE `beneficiary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billstack_accounts`
--
ALTER TABLE `billstack_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cableid`
--
ALTER TABLE `cableid`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `cableplans`
--
ALTER TABLE `cableplans`
  ADD PRIMARY KEY (`cpId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`msgId`);

--
-- Indexes for table `datapins`
--
ALTER TABLE `datapins`
  ADD PRIMARY KEY (`dpId`);

--
-- Indexes for table `dataplans`
--
ALTER TABLE `dataplans`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `datatokens`
--
ALTER TABLE `datatokens`
  ADD PRIMARY KEY (`tId`);

--
-- Indexes for table `data_type_mapping`
--
ALTER TABLE `data_type_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_type` (`data_type`);

--
-- Indexes for table `electricityid`
--
ALTER TABLE `electricityid`
  ADD PRIMARY KEY (`eId`);

--
-- Indexes for table `examid`
--
ALTER TABLE `examid`
  ADD PRIMARY KEY (`eId`);

--
-- Indexes for table `flash_noti`
--
ALTER TABLE `flash_noti`
  ADD PRIMARY KEY (`msgId`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manualfunds`
--
ALTER TABLE `manualfunds`
  ADD PRIMARY KEY (`tId`);

--
-- Indexes for table `monnify_accounts`
--
ALTER TABLE `monnify_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountReference` (`accountReference`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `networkid`
--
ALTER TABLE `networkid`
  ADD PRIMARY KEY (`nId`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`msgId`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sitesettings`
--
ALTER TABLE `sitesettings`
  ADD PRIMARY KEY (`sId`);

--
-- Indexes for table `strowallet_accounts`
--
ALTER TABLE `strowallet_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`sId`),
  ADD UNIQUE KEY `sApiKey` (`sApiKey`),
  ADD UNIQUE KEY `sPhone` (`sPhone`),
  ADD UNIQUE KEY `sEmail` (`sEmail`);

--
-- Indexes for table `sysusers`
--
ALTER TABLE `sysusers`
  ADD PRIMARY KEY (`sysId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tId`),
  ADD UNIQUE KEY `transref` (`transref`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uservisits`
--
ALTER TABLE `uservisits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airtime`
--
ALTER TABLE `airtime`
  MODIFY `aId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `airtimepin`
--
ALTER TABLE `airtimepin`
  MODIFY `aId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `airtimepinprice`
--
ALTER TABLE `airtimepinprice`
  MODIFY `aId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `airtimetokens`
--
ALTER TABLE `airtimetokens`
  MODIFY `tId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `alphatopupprice`
--
ALTER TABLE `alphatopupprice`
  MODIFY `alphaId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apiconfigs`
--
ALTER TABLE `apiconfigs`
  MODIFY `aId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `apilinks`
--
ALTER TABLE `apilinks`
  MODIFY `aId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `beneficiary`
--
ALTER TABLE `beneficiary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `billstack_accounts`
--
ALTER TABLE `billstack_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `cableid`
--
ALTER TABLE `cableid`
  MODIFY `cId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cableplans`
--
ALTER TABLE `cableplans`
  MODIFY `cpId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `msgId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `datapins`
--
ALTER TABLE `datapins`
  MODIFY `dpId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `dataplans`
--
ALTER TABLE `dataplans`
  MODIFY `pId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `datatokens`
--
ALTER TABLE `datatokens`
  MODIFY `tId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `data_type_mapping`
--
ALTER TABLE `data_type_mapping`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `electricityid`
--
ALTER TABLE `electricityid`
  MODIFY `eId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `examid`
--
ALTER TABLE `examid`
  MODIFY `eId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flash_noti`
--
ALTER TABLE `flash_noti`
  MODIFY `msgId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `manualfunds`
--
ALTER TABLE `manualfunds`
  MODIFY `tId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `monnify_accounts`
--
ALTER TABLE `monnify_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `networkid`
--
ALTER TABLE `networkid`
  MODIFY `nId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `msgId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sitesettings`
--
ALTER TABLE `sitesettings`
  MODIFY `sId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `strowallet_accounts`
--
ALTER TABLE `strowallet_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `sId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `sysusers`
--
ALTER TABLE `sysusers`
  MODIFY `sysId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4828;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2745;

--
-- AUTO_INCREMENT for table `uservisits`
--
ALTER TABLE `uservisits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
