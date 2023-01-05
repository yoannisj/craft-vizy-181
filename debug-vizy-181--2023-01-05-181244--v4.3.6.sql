-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jgzomkgbynoocbjpiweawqljjkjhkzovmtld` (`ownerId`),
  CONSTRAINT `fk_jgzomkgbynoocbjpiweawqljjkjhkzovmtld` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_meltftmfhiajdhlpmsdsyoovtgykuoswvsro` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jlgvlqvjsjrlhkpxfbcbxpocruuwzprjqsti` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_cfllphrwulhjjeajzhxywohqlzlwxymtujak` (`dateRead`),
  KEY `fk_gxlbhngkanpyzizizymiydoseziynwqivjxa` (`pluginId`),
  CONSTRAINT `fk_cmnbllshbqkeotfqvmykcmwgxazmurilmqtm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gxlbhngkanpyzizizymiydoseziynwqivjxa` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kecnedzfruhhcslljijmpyutnhqeylntqprt` (`sessionId`,`volumeId`),
  KEY `idx_aieuibwbepvqgxxwaekyaorlyswacbrxtbei` (`volumeId`),
  CONSTRAINT `fk_cfxklztrzaxsloxfbfiizvisxljhxotnsxbd` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hdhhktnjxycmggdtalznnpklmtaweadghveh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_czfeyubocngkvecpbhvjjhkxhvkhcrwiknvo` (`filename`,`folderId`),
  KEY `idx_qdvvpzsbahktebqiiabirwgskgmryaruxgvh` (`folderId`),
  KEY `idx_tofmcpnocusbqdkrkazpjgrclbedowbvsyjs` (`volumeId`),
  KEY `fk_gfmhviifqqlizrlzfqtmgqtacfxsjwpyxnlb` (`uploaderId`),
  CONSTRAINT `fk_fcobehutancvepcmmapjniyvmupzbsrbqffr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gfmhviifqqlizrlzfqtmgqtacfxsjwpyxnlb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ndidojslomjlechrgxovrnlyeifaatttrzes` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oigbbhocnvmlieciurqnbboywaovfnxocwvh` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cnpagfrgxmzbfxiivchkolwxwvydpmqpoktr` (`groupId`),
  KEY `fk_wklmfhhvkfwnigekbkhajqzkclzmntqppgss` (`parentId`),
  CONSTRAINT `fk_cfskxehakotngxwrtqfmsrmcemtkijtmerog` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cuxmfgwzmwftryapktihzkmpkcvftelnijhy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wklmfhhvkfwnigekbkhajqzkclzmntqppgss` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ngehyeyooboiwcmoujkwflqmuyksmiywspel` (`name`),
  KEY `idx_vrssxqmcfuvutubyygdmyuhqjbfovqnnfsht` (`handle`),
  KEY `idx_xqqsfszuikgjdpmwyvhhnoooiildbtrsroma` (`structureId`),
  KEY `idx_zgelzrteascagllxwdikwxwdtdnrybyufkfr` (`fieldLayoutId`),
  KEY `idx_eumbewxysyhakghvemoudjdlxjqpebssybdx` (`dateDeleted`),
  CONSTRAINT `fk_elacaiwkvervoxqxanjpgcrkuxbcepapwuac` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_puzjpfjivhogixddmaokoykeshcfxsshqzjp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kjnwzvzbdwifeafsqjssihaducmhbblsnqvy` (`groupId`,`siteId`),
  KEY `idx_xxaewdqbaiuwnowwdccuofvufwxytxzapcpe` (`siteId`),
  CONSTRAINT `fk_dtaxhszajblqwffepmrdtbiqyedltqunktud` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wdcamjwtmhmsrevvkzujoaznmuhdngbcpylz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_csbsklaegghoagigalymhtaauktiyaonyref` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cyohusrcokdxzdvfcdzznyqmbtqiuneyfuua` (`siteId`),
  KEY `fk_bipvqaihollhiwjjkexouyjocqjerwascvaw` (`userId`),
  CONSTRAINT `fk_bipvqaihollhiwjjkexouyjocqjerwascvaw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_cyohusrcokdxzdvfcdzznyqmbtqiuneyfuua` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_elndhdbjzhtjsszjxchihmdlzunuripmxtfw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_ubofzahhblbdxditntgcmdnvuofpcnysioic` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ktuzcdlceovfvtsljrhvvqvimeuewkhtymwv` (`siteId`),
  KEY `fk_klnqrkcovibpaxgpxusmyzptgdowkzhadrcg` (`fieldId`),
  KEY `fk_dzetpmswsquypsoptxfvvhrznjmgepjovnbz` (`userId`),
  CONSTRAINT `fk_bubswgbmocztuvgrdbezpssdeqqbdtbjhjsl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dzetpmswsquypsoptxfvvhrznjmgepjovnbz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_klnqrkcovibpaxgpxusmyzptgdowkzhadrcg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ktuzcdlceovfvtsljrhvvqvimeuewkhtymwv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_heading_kuewftyt` text DEFAULT NULL,
  `field_richContent_dmndrogy` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_awqgnfwbqazhzhbsasbnzziihqsuenvowknt` (`elementId`,`siteId`),
  KEY `idx_uiysxmirxcbrurjycvgyazdygqxdhrchlbgp` (`siteId`),
  KEY `idx_pnhupvuiledrleyjqtoteppfxqpzrdxdbxby` (`title`),
  CONSTRAINT `fk_lnnlztrbaecwnekvkryvmummuspnsfdbrewu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmicaaxstcdvyuiluxerfqnwdvzqbirefsso` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qurjbofpcrpcsrtkjenlubjrzqvvirzdiqjc` (`userId`),
  CONSTRAINT `fk_qurjbofpcrpcsrtkjenlubjrzqvvirzdiqjc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wapblclltcxzwbxggiafyaddoneqzyjfzjio` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_rzodbuzjmssmdgmxrhbkostsualgfdebbdsd` (`creatorId`,`provisional`),
  KEY `idx_uxzfwqbnbhbqspksoqliobwmxfulocspeens` (`saved`),
  KEY `fk_rwbhsudvdcqjhimuxwqpzrqqhdrtcqsbqcem` (`canonicalId`),
  CONSTRAINT `fk_pdntraurzbpolbamakaqcwtnsniyuenotprk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rwbhsudvdcqjhimuxwqpzrqqhdrtcqsbqcem` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kelcccujkqvptgzbjrjwtiftqptcepbmgjhz` (`dateDeleted`),
  KEY `idx_zhrmdvshpmgfckaopnnttcnrvyfjdilznhdw` (`fieldLayoutId`),
  KEY `idx_jmyhxswtygflslmycigymqcukwduccedjvsn` (`type`),
  KEY `idx_sbuooxbaxnpgjkibvafndezuevqpnytmuewe` (`enabled`),
  KEY `idx_msbshcpwuuaummejtiwqcggdqvgdkpqmypuk` (`archived`,`dateCreated`),
  KEY `idx_qhofjqkoqnjssgldrhmknnywjpewqbfjhtgc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_jxypczdnmmnehdbwqqsybkwahfpkdkkujceo` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_dahwzewzvecbppifmodbpatsibylhynobmah` (`canonicalId`),
  KEY `fk_bjgrhpbtndgezqbsjlwvojwnbwynwtsgakty` (`draftId`),
  KEY `fk_yckjuryimuuzwbcuewrwjpgllroycyifegqy` (`revisionId`),
  CONSTRAINT `fk_bjgrhpbtndgezqbsjlwvojwnbwynwtsgakty` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dahwzewzvecbppifmodbpatsibylhynobmah` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qzvvrbphredcxoeygdzgdvnrwrctfegjxhbj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yckjuryimuuzwbcuewrwjpgllroycyifegqy` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlalemliddvobffkmhixmxbrqciadiobfuvh` (`elementId`,`siteId`),
  KEY `idx_vwqrcxrrqiznpkstwjkgssaisebfosmjdfnx` (`siteId`),
  KEY `idx_jqpjfhxtkcownhdrjrvegwyhwseuljpplpeu` (`slug`,`siteId`),
  KEY `idx_fyijayicfiabzycwdjvjrhwyoabyqbfmlydp` (`enabled`),
  KEY `idx_qphfncxwkqqrqjgrmnpxpqghvdlrzijcybop` (`uri`,`siteId`),
  CONSTRAINT `fk_uhsiyujarovslxorhgchjeowfcgjllpvhbcf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ydmjjtrnrzuzkebyetocqpghzowdedhfjttl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ashnswyrajiuedfbeoybxmkhinhpyyfqquti` (`postDate`),
  KEY `idx_gdwzhgaocsrogdjczevbkvgdwotoulbveuad` (`expiryDate`),
  KEY `idx_ygtgviojzvnuotjkftevrhwetutrcllqmbkm` (`authorId`),
  KEY `idx_ravskdhaffdwfxskldthhgbllygvkgjzuast` (`sectionId`),
  KEY `idx_aesetgcekgdobfjdsrvcdlkivjspjngxfpee` (`typeId`),
  KEY `fk_ywkdwsljubduupbmqqwwogxktgjrwsptzcrr` (`parentId`),
  CONSTRAINT `fk_ketotohmlliieqbeepqnzkgvfxhqhagcrpen` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_njbwrbhelktcmagdhprjfqsuepmawuipckyc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhvqipjddtunbyfdcknldybrpnhxzgdwdojx` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_slggksdvtvxjywirtnyxkzjccutwbesfmioe` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ywkdwsljubduupbmqqwwogxktgjrwsptzcrr` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lixpnauprkckkwoneywabjemxovasaujnvso` (`name`,`sectionId`),
  KEY `idx_dvpluiwtfoywjtxsmkfdgabiatpflheqvvwn` (`handle`,`sectionId`),
  KEY `idx_kdwscnosuvpkqneupzzmmumzochdohtknhcs` (`sectionId`),
  KEY `idx_skpokludndwowxnwlwbzkjxsyaaukpvuhwhb` (`fieldLayoutId`),
  KEY `idx_ejzouzneeswmqxcafipnnkooxvkyyezqfjng` (`dateDeleted`),
  CONSTRAINT `fk_ivlyztuvecjaqbsctjpsyoracxavxmuufpjr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhcaydryortzoojoohfgbjkxjdqgzlkrouww` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lzljdrorhbdfwzxqjfplojnrssjvuhobfnlg` (`name`),
  KEY `idx_igijexxcikqnoudsqsjbszbsqxzxrjqvyjjw` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szfdpwyyrasiqikbaswxhfoflcgclytgdkum` (`layoutId`,`fieldId`),
  KEY `idx_ogvainrnxtrrvcnfptortjcatoujuugnnepb` (`sortOrder`),
  KEY `idx_iwbhargfqvulgjyprcnpdxvbbhzzbxmrxbgh` (`tabId`),
  KEY `idx_gdmbehnvmmappvmumlnthbqjstaisfvclkuw` (`fieldId`),
  CONSTRAINT `fk_nqowmcsqupfvcetgberzoingvbrpckcigmja` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nwdejoemwrcjvatukkthgjgjnxyedvprmwnn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uimndgdhwwzcbcloxgjijvwydfrelhdymyfs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wsetcleexewjznbzzhkgptvrmjfbhzyspsek` (`dateDeleted`),
  KEY `idx_vmxunvwhproqmirojgclmrywvucggrknywpw` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yntxzhuphyvcwuiatvijgkaqdivmfgbuvmdz` (`sortOrder`),
  KEY `idx_nrowyidyhppvxdrlzdhgtxcnsatlxjtubutf` (`layoutId`),
  CONSTRAINT `fk_qoqworpivwemktebzduxqqredbklrmyzjanb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eikaixuzfwgwheuftjelerryvjmiejundxap` (`handle`,`context`),
  KEY `idx_nsphjjucadmiylvbqrouzavrieoncvvirynp` (`groupId`),
  KEY `idx_yckrcfiyccrgoqlnlvbgjtamhbedsohljnvd` (`context`),
  CONSTRAINT `fk_eccdpiomskgesgbhrtvtwjfdqqwxqpudzvur` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vivrrpwloeqflnlogacxsostlfywlssaroqp` (`name`),
  KEY `idx_tpbgngutprsxftehavoqlbtzkocsntszgliz` (`handle`),
  KEY `idx_gsrgkboargtsblwhgyumjgrwzpinvgvwtbfu` (`fieldLayoutId`),
  KEY `idx_cdpacwjcvnayqyxuinaixbmzpyoftmackxsz` (`sortOrder`),
  CONSTRAINT `fk_febgpkkqocnaxmkwlntljxbvmnecqwveuggb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mierppefeubvbfapbgiqohttwacllltpeaoz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_brmtphlcfjpzcpnhlnegqwggtyutwnxrvrvd` (`accessToken`),
  UNIQUE KEY `idx_frusvrzdhvwemkvmlqttcwpnleutkiblerss` (`name`),
  KEY `fk_xmlsggnetrheaoyctjpbjfdmutmzwnukymtb` (`schemaId`),
  CONSTRAINT `fk_xmlsggnetrheaoyctjpbjfdmutmzwnukymtb` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rkzisgrfqktnsjdugljdpjgsmxpiyutvigle` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ufgomqfojcqnelylopqwovubfxkhidtvzgdz` (`name`),
  KEY `idx_tiqztvuccrokjszmzatnnsycpjwwasqdpozl` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hypylxfzptcjavdxnaebvraldvjfavaxkicv` (`primaryOwnerId`),
  KEY `idx_lzsemmecmizeyxtodznkvrdzzaqprngtqjxa` (`fieldId`),
  KEY `idx_cvminerweiaquozecjgfxmdhqebuoisoonpa` (`typeId`),
  CONSTRAINT `fk_frzghclhqyahdqzhzyhvdaicdznzuhilvuys` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kxmflduqzpoijoumgedhlspitsvxqttnqnju` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdagpjsgptxivshfqcbjpaolpvaiatkevqfn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zikubcoygsxbzerdfedbdlwydcgeyfmsicdb` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_tmfeainzyoguvodyufmgmqukljbawfninppe` (`ownerId`),
  CONSTRAINT `fk_nzqrlesxytyxdtnokfivzgmgtwvsgyijwydy` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tmfeainzyoguvodyufmgmqukljbawfninppe` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yswjdywmhlfswkklvbnavrlhyjtjqtroooeu` (`name`,`fieldId`),
  KEY `idx_shporgevfhqudoipdbjctepdkjbucdznmqvr` (`handle`,`fieldId`),
  KEY `idx_ipqutuuryukqxwcyeqmflvopdwmxwdgjgeep` (`fieldId`),
  KEY `idx_guuvwfnupqlwcckwnhufnjmwrjsbcmqcjnih` (`fieldLayoutId`),
  CONSTRAINT `fk_htnhlzmowenvcsrhmhwellzpoxvcewfwuohe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_iqmmmyularrnokzbzamnyasdwqcrhqerdmgc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_thmonsarmxolzpjytyvynytbjgnbhieyexeu` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks`
--

DROP TABLE IF EXISTS `neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gikrrajbebycjacfsscryyblxcnkhdwszhbz` (`primaryOwnerId`),
  KEY `idx_yqdrurbfbrasqwwgybcecnkqavyjooobxcmu` (`fieldId`),
  KEY `idx_miwjdgiuviieeiundavksxjbiqywyvtlouum` (`typeId`),
  CONSTRAINT `fk_atcnltzksdxbxhzbwazqpydzhreeofbepncz` FOREIGN KEY (`typeId`) REFERENCES `neoblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ftlepblgjysmzwaqrstxefqewndldybjizbh` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iiejmbqrxljanxdejtgxhxsczpktysjvnthk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jcdrtwyxalglfxnhojbpsqaivolnficvctrg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks_owners`
--

DROP TABLE IF EXISTS `neoblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_yhyiohydshhpvcawqrbegefarjrznroamrjd` (`ownerId`),
  CONSTRAINT `fk_yhyiohydshhpvcawqrbegefarjrznroamrjd` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zllobtlyccdrocyodalvmatkjbuhbhbhysqb` FOREIGN KEY (`blockId`) REFERENCES `neoblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblockstructures`
--

DROP TABLE IF EXISTS `neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_litgjntvjxifjubpkfqtrrwcanvlrljliayy` (`structureId`),
  KEY `idx_odhghnefyeuqcmrdvnplrwedsffufjddeomo` (`ownerId`),
  KEY `idx_nnaakbibfmovfbfgzgccvtoditqnqskaxlax` (`siteId`),
  KEY `idx_izrxepxiwjzmyvnccgykrahjyehokgelrvjb` (`fieldId`),
  CONSTRAINT `fk_hlagyipgjsxovznjwyrgbfmuxtuiacejbfov` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpfqnhjwsqqujkkvejibqffpzchutpcuvssw` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vmbirnncgnfwwabczfgxiptvgumfqpdyjeci` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xygvwcdkoqyqpyekoxnyenmyjzgyzoouggxb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypegroups`
--

DROP TABLE IF EXISTS `neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `alwaysShowDropdown` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dcrguezibvgzotzpsecjnvapuiqjrfkaowgc` (`name`,`fieldId`),
  KEY `idx_ezkllitygfifafphcnwohiggwkaihhnrccwc` (`fieldId`),
  CONSTRAINT `fk_laopixlssrnepmgubvgpvapwkyljyurfpnqa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypes`
--

DROP TABLE IF EXISTS `neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `minBlocks` smallint(6) unsigned DEFAULT 0,
  `maxBlocks` smallint(6) unsigned DEFAULT NULL,
  `minSiblingBlocks` smallint(6) unsigned DEFAULT 0,
  `maxSiblingBlocks` smallint(6) unsigned DEFAULT 0,
  `minChildBlocks` smallint(6) unsigned DEFAULT 0,
  `maxChildBlocks` smallint(6) unsigned DEFAULT NULL,
  `groupChildBlockTypes` tinyint(1) NOT NULL DEFAULT 1,
  `childBlocks` text DEFAULT NULL,
  `topLevel` tinyint(1) NOT NULL DEFAULT 1,
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT 1,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xwstfznxjkxqcnpizufdektckxxvaplyqwzd` (`handle`,`fieldId`),
  KEY `idx_sadaivasfkyuiikbarvwywuuovbnyocsrtsp` (`name`,`fieldId`),
  KEY `idx_kwmkwifvmxkczhzvutgkpfirhdwrakicfixp` (`fieldId`),
  KEY `idx_egyqlloppchpzyjfzzktzaiftefsszllqapk` (`fieldLayoutId`),
  KEY `idx_qprtctifufcqbvoaiozgffeslaezkgvglsui` (`groupId`),
  CONSTRAINT `fk_bkikdaewrcrereekxqqrbdldhsxojajyxxce` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iqvebctdabuqqckwokhrbzpacyaaovcepfdf` FOREIGN KEY (`groupId`) REFERENCES `neoblocktypegroups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vkpwayieopyghuzpbvqsyjvjmwhknurttzep` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xcplwnkracniikargekpbrcpodlwoxnijduj` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_afslfmmlmmpuhwudinpvaegzcfztrlpnunoo` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_qyhqimffcpdhvzkftcnrrrfwnxamdxkfspea` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_aqlffysgfqhfczetoconvyscjswwisxczott` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ojhryuvqbcdpjxzurhjuqfqwtulurahwqkfj` (`sourceId`),
  KEY `idx_cmjejghranfevwjujdvdfzyphtpqfpwnekny` (`targetId`),
  KEY `idx_dsppxvlgyoyjagfvgwezzzckcxutojptctye` (`sourceSiteId`),
  CONSTRAINT `fk_hnthtfwirisxfcxwnhufaabaqlqugdtqznvt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ngnhoqspzhktbhoqzsoyqomvmazkjtcujomm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uxwqeglemdpzssdgqpkqmwwzzdlguhmwbwzb` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yifqiknlvsclqtutjwbltrbdktkmzwssttqj` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_balixrkzabndjteepmyodqkiahsggjmspshe` (`canonicalId`,`num`),
  KEY `fk_cvdcpredsnohpvcuikejuoajzympeeixiryc` (`creatorId`),
  CONSTRAINT `fk_cvdcpredsnohpvcuikejuoajzympeeixiryc` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vfancbhqwfnjsafsboxstinjxxttxlobimhp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_gcogacupzxufzpczjyjitnmwcwnievulnjdl` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oaohawpvujfqjyeqrxbwnpjfdwwlyhxggudy` (`handle`),
  KEY `idx_yryzjvqrtsgawspunamschxxggphwkkwaohu` (`name`),
  KEY `idx_tlhswyronqoqdefoyvktbjbvazkwmcwgbjgn` (`structureId`),
  KEY `idx_nitoxyonkaoyukxhwpomnhlizcijsjnexnkl` (`dateDeleted`),
  CONSTRAINT `fk_ffeppzamspyxmhafqlibwnrvoujgmxzmzdnt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgjifxntidroyunyjqalpuswqvrqxxtdqevb` (`sectionId`,`siteId`),
  KEY `idx_mqlezjhbaonqssgvwendosijdjtgdjwyrbdg` (`siteId`),
  CONSTRAINT `fk_gqloksdbaehgesrxkplnvlutzxdhoqjelixr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xkdqsspcuokmxklsupfgguxtkusfnnxrqcmz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_btwpddfipmzkwljckqujcogxzersloqggiav` (`uid`),
  KEY `idx_itvpwosxdbfsmlogelqjjvpiricokelcomcl` (`token`),
  KEY `idx_veilryexjvllyrrmudkivsjbvtcofklgcsjr` (`dateUpdated`),
  KEY `idx_renfqmbchdktkmgfoohislkuzqpexvjileec` (`userId`),
  CONSTRAINT `fk_jmtmyowcgekomtdezpwvsoopdtuqahyfdjrs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cbcqniixpxtbnsjtgfvuqqmwyzulorklswmb` (`userId`,`message`),
  CONSTRAINT `fk_qnnqjcknlnpkitjeeawywneqsvflcttjentp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vornbzivizkecirdmvowdjclingywegfqoor` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mbuujskvxszhspnngnocpbaoakgnjvitjrtn` (`dateDeleted`),
  KEY `idx_udvupocrccirfeieibuqjnredphgvgcdtjgp` (`handle`),
  KEY `idx_kawbyilpxivwwnpyqvifzslqgykygkmltiyz` (`sortOrder`),
  KEY `fk_tyxllmtbtakoudkzvyftfjvmzexaotlgrrqz` (`groupId`),
  CONSTRAINT `fk_tyxllmtbtakoudkzvyftfjvmzexaotlgrrqz` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vpojraosyvkkqkizukqkskfyjuljklyriwrw` (`structureId`,`elementId`),
  KEY `idx_zdoulqcwxoqwfgtnguunrpxhjujsfekdyaac` (`root`),
  KEY `idx_nijzuwsrifnwcgdwaqvxbznmfgbhpnskpgko` (`lft`),
  KEY `idx_oxjveiaetnkcawrndhbesmzyekqavgudqxds` (`rgt`),
  KEY `idx_jjpzbswysinugvndrzluesjxsfgqlscyoefa` (`level`),
  KEY `idx_pixcfjbryfnangjyhzfwcqvxrjzpdfgpxwmf` (`elementId`),
  CONSTRAINT `fk_iithvfxqnvazxzjjadedlsyfmgkvhnbtcpcx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ojjdnzwxusktaffxtcuazaqsnblpnlijaevj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_apjvmijaemnpmapukajadyjopqkorvvpdrcc` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tsqdvqeieooqdcsjeeetbcwgoizzrvninamf` (`key`,`language`),
  KEY `idx_bnmoldxrvstdcjadbafijetzxzasvdngtram` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nkgobqixbdkaacyrgcqbufllhvhpalsdcxqk` (`name`),
  KEY `idx_mfwkutdckxarvfkvmcinomwyejefvhbnipsw` (`handle`),
  KEY `idx_bytdwsacpeomwmpmhdngpvbtrgprjarokshf` (`dateDeleted`),
  KEY `fk_tyorqpmwyqycjwnweuiefqasiepgonlsoezc` (`fieldLayoutId`),
  CONSTRAINT `fk_tyorqpmwyqycjwnweuiefqasiepgonlsoezc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pactkeghxaculjzsszyphipbeeumxyedoqjb` (`groupId`),
  CONSTRAINT `fk_llmyqsvyjropjtqbhcbxmdihmjdgbzhvkeon` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vogboqdkvuqkwgvetditmortkiswgcznlbfa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_begbkxhkiovheyenasuyszvwrtjdxoiiinij` (`token`),
  KEY `idx_foguspmelwvusdgoslxlfiktqislixhwzahe` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mujxkssdnsquoyuynululjjkgoufikouqlic` (`handle`),
  KEY `idx_gkolmfmsbkuamykcztfygdpoaoxowqatehoh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ejgxosomtvfpiwqvjhmufigwhrrwlaajinyg` (`groupId`,`userId`),
  KEY `idx_udwqaoxtqrrzdhhndfkfbcrsnolegdpxuajm` (`userId`),
  CONSTRAINT `fk_thskpkjzwacveleoztdlwgdetefettfswqlo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uordunctqacbagivitcjvoyowsdkoapnngpj` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fmarnjhllmlnglvalrdihnycbdfxccmbgpfu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sacjgnoarzagvxszjakmgvqyckbtoqekymhn` (`permissionId`,`groupId`),
  KEY `idx_owdbagivrlsjhsiuuctpmjuzegsutgeqdokt` (`groupId`),
  CONSTRAINT `fk_aorvfdobycygnoefqhaaxpfvlgwpxerfhstf` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cbjqkcoocroxiequltcsfvlcxaqhoiosiljy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hlvydwgdqapwbrqttjntoczfrokkoyljwmcc` (`permissionId`,`userId`),
  KEY `idx_anvbvizosqhkmrbjbjsacztardzvdyxksgro` (`userId`),
  CONSTRAINT `fk_bipnonjeiivwmmwcwucpojqgnbouxktdkrdm` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vztcjyneapkvmfrywryzkjaybswliquytgtl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_hyddpweltldebuptapndajrrxmijdfcpdvbz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gtuqhhuhlirptpsjbhjhogjfvarsslxvgwzr` (`active`),
  KEY `idx_gitqopffivsunkpjpfwdvhmwlxnuajcxtwjl` (`locked`),
  KEY `idx_azqmvcctawdaygzaexjoboomvafefsssmivf` (`pending`),
  KEY `idx_mcnmgloeypllusmdvdlpivuydmqsggluneue` (`suspended`),
  KEY `idx_cdqkxlbnvkkiijizjsnmzdqsmogpztpjreev` (`verificationCode`),
  KEY `idx_gainjerxdnkujzxmnedsiyxtaabfrgpgladj` (`email`),
  KEY `idx_zunhmuwhdcqlgrjscmzabykdxxcigrpunfsv` (`username`),
  KEY `fk_taxctecbmvysirfwkfikqbwgneaatfqtcsfk` (`photoId`),
  CONSTRAINT `fk_dyjwvrgukzpvjvfqhsvuylhegbegmvtkphmw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_taxctecbmvysirfwkfikqbwgneaatfqtcsfk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_obsustlrjitlihzfxqvvegqrmfaldxiwtypj` (`name`,`parentId`,`volumeId`),
  KEY `idx_kdtpolahdswgeargjmkhctajbyrjvgfdbfbh` (`parentId`),
  KEY `idx_aayimzsjgbyjvvwedlkuhagxpfrdxgdshuou` (`volumeId`),
  CONSTRAINT `fk_gfdrvnadcmfxmywomsfhkwfxrwalxdijfexy` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tbkwejgdzuvnjxgcvpvcuwrryzyqwdukovwl` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ownirnaycpljeefmlrmokrlmgroswnyxzead` (`name`),
  KEY `idx_lpltryiswjetkdnmcyhyvrjoibufyoncwpqv` (`handle`),
  KEY `idx_misettbxdyeolrzqcslpfkssixnqccubyizo` (`fieldLayoutId`),
  KEY `idx_bhqguknzznicjjmtxcuufwnzdwjgnvckdgmk` (`dateDeleted`),
  CONSTRAINT `fk_bsorfjbhneqfuzdujywdsfpfitrqqbaqnfqq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_turbxduguhfciznhwlyszrkxuwqbqqadhkdv` (`userId`),
  CONSTRAINT `fk_svanxcwvpcwpzndgmnmiqyzskottcegebahb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-05 18:12:44
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (6,1,1,1,'fujifilm-sample-images-5.jpg','image',NULL,2000,1333,1112495,NULL,NULL,NULL,'2023-01-05 17:59:11','2023-01-05 17:59:11','2023-01-05 17:59:11');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2023-01-05 18:03:52',0,1),(2,1,'slug','2023-01-05 17:59:25',0,1),(2,1,'title','2023-01-05 17:59:25',0,1),(2,1,'uri','2023-01-05 17:59:25',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-01-05 17:59:35',0,1),(2,1,3,'2023-01-05 17:58:47',0,1),(2,1,4,'2023-01-05 17:59:13',0,1),(10,1,1,'2023-01-05 18:04:00',0,1),(11,1,3,'2023-01-05 18:04:00',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-01-05 17:41:35','2023-01-05 17:41:35','13a2fa26-d0e8-46d5-beb1-a3a04cb5ed04',NULL,NULL),(2,2,1,'My trip to Asia','2023-01-05 17:58:24','2023-01-05 18:03:52','ad5c3432-2b5c-4cc1-9066-2bfdee22c8ba',NULL,'[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(3,3,1,NULL,'2023-01-05 17:58:35','2023-01-05 17:58:35','0a97fc78-8fb7-425d-928d-66816a3c9c62',NULL,'[]'),(4,4,1,NULL,'2023-01-05 17:58:42','2023-01-05 17:58:42','b923fb31-9f68-4f6c-b042-e3b450896cf6','Pellentesque Magna Elit','[]'),(5,5,1,NULL,'2023-01-05 17:58:46','2023-01-05 17:58:46','10a3822f-f9cc-4251-bd37-9a1a35af0d2e','Pellentesque Magna Elit','[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(6,6,1,'Fujifilm sample images 5','2023-01-05 17:59:11','2023-01-05 17:59:11','62acf810-18df-4d8f-bfa4-0f6c78a9ce15',NULL,NULL),(7,7,1,NULL,'2023-01-05 17:59:35','2023-01-05 17:59:35','53eec059-e7f5-4885-8132-7e10e1e989b7','Pellentesque Magna Elit','[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(8,8,1,'My trip to Asia','2023-01-05 18:03:52','2023-01-05 18:03:52','53bf1abe-9b9c-42ce-888c-8401d9958319',NULL,'[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(9,9,1,NULL,'2023-01-05 18:03:52','2023-01-05 18:03:52','43e83f13-2906-4078-86a1-0c8ca2847984','Pellentesque Magna Elit','[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(10,10,1,'My trip to Asia','2023-01-05 18:04:00','2023-01-05 18:04:00','94ff8c3e-9c9f-436f-bcec-084f3a0c86b4',NULL,'[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]'),(11,11,1,NULL,'2023-01-05 18:04:00','2023-01-05 18:04:00','995556af-de02-4797-819d-444c6f878267','Pellentesque Magna Elit','[{\"type\":\"paragraph\",\"attrs\":{\"textAlign\":\"start\"},\"content\":[{\"type\":\"text\",\"text\":\"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.\"}]}]');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (2,2,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-01-05 17:41:35','2023-01-05 17:41:35',NULL,NULL,'b5b8f5ce-3c0a-4197-8a75-cfd449efad4a'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-01-05 17:58:24','2023-01-05 18:03:52',NULL,NULL,'06f80ef6-0886-41ae-bf06-26e9af44f90d'),(3,NULL,NULL,NULL,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 17:58:35','2023-01-05 17:58:35',NULL,'2023-01-05 17:58:42','c687ac38-8eb7-4a38-8ff1-a3bc40766252'),(4,NULL,NULL,NULL,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 17:58:42','2023-01-05 17:58:42',NULL,'2023-01-05 17:58:46','811ec89c-1a77-49ce-a762-8000428aeb76'),(5,NULL,NULL,NULL,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 17:58:46','2023-01-05 17:58:46',NULL,'2023-01-05 17:59:35','6eaee12b-f063-4dcf-bd89-4f2e7ad804fc'),(6,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-01-05 17:59:11','2023-01-05 17:59:11',NULL,NULL,'e4537711-2285-4557-a7dd-965e37611c84'),(7,NULL,NULL,NULL,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 17:59:35','2023-01-05 17:59:35',NULL,NULL,'da248cc7-2784-4aa3-838e-ef4217e0d657'),(8,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2023-01-05 18:03:52','2023-01-05 18:03:52',NULL,NULL,'80139c3c-dac3-4aa6-8ea6-a9058aff3140'),(9,7,NULL,2,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 17:59:35','2023-01-05 18:03:52',NULL,NULL,'7b5f160a-1495-4490-9bf4-dbd7bc7b513e'),(10,2,2,NULL,2,'craft\\elements\\Entry',1,0,'2023-01-05 18:04:00','2023-01-05 18:04:00',NULL,NULL,'af4c245f-50bc-4736-b510-7ff65d5d393a'),(11,7,NULL,NULL,3,'benf\\neo\\elements\\Block',1,0,'2023-01-05 18:04:00','2023-01-05 18:04:00',NULL,NULL,'fab3c909-d673-49b5-b370-ad10f079ca30');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-01-05 17:41:35','2023-01-05 17:41:35','a08070bd-0020-4dd3-a828-aa5ff833b807'),(2,2,1,'my-trip-to-asia','my-trip-to-asia',1,'2023-01-05 17:58:24','2023-01-05 17:59:25','1865eaba-0302-43de-8d1b-38fb8304aab2'),(3,3,1,NULL,NULL,1,'2023-01-05 17:58:35','2023-01-05 17:58:35','e568705c-bbfe-44c9-a816-be45d69a19ba'),(4,4,1,NULL,NULL,1,'2023-01-05 17:58:42','2023-01-05 17:58:42','20ed0d00-e1cb-4d1b-9dc5-ecc3f09e1b51'),(5,5,1,NULL,NULL,1,'2023-01-05 17:58:46','2023-01-05 17:58:46','54cf5530-7567-4a5a-888c-98ca05edfc23'),(6,6,1,NULL,NULL,1,'2023-01-05 17:59:11','2023-01-05 17:59:11','7ad35ab2-5cbd-4460-b46d-e837e75cb6af'),(7,7,1,NULL,NULL,1,'2023-01-05 17:59:35','2023-01-05 17:59:35','30f4f841-e946-4120-89c5-c8768668d9c4'),(8,8,1,'my-trip-to-asia','my-trip-to-asia',1,'2023-01-05 18:03:52','2023-01-05 18:03:52','90b2fcb0-766d-4e92-bc7a-c29b664577d7'),(9,9,1,NULL,NULL,1,'2023-01-05 18:03:52','2023-01-05 18:03:52','47be5366-2d03-4b12-82cd-766f88bc4f34'),(10,10,1,'my-trip-to-asia','my-trip-to-asia',1,'2023-01-05 18:04:00','2023-01-05 18:04:00','773b9fab-f833-4a8b-b536-aa3161bf70f8'),(11,11,1,NULL,NULL,1,'2023-01-05 18:04:00','2023-01-05 18:04:00','03f8399e-842b-4bb3-ad63-f89a291d8216');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2023-01-05 18:03:00',NULL,NULL,'2023-01-05 17:58:24','2023-01-05 18:03:52'),(8,1,NULL,1,1,'2023-01-05 18:03:00',NULL,NULL,'2023-01-05 18:03:52','2023-01-05 18:03:52'),(10,1,NULL,1,1,'2023-01-05 18:03:00',NULL,NULL,'2023-01-05 18:04:00','2023-01-05 18:04:00');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,2,'Page','page',1,'site',NULL,NULL,1,'2023-01-05 17:56:41','2023-01-05 17:57:17',NULL,'c383d535-f125-44a2-8c7e-c83a816b00d6');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-01-05 17:41:35','2023-01-05 17:41:35',NULL,'7b61504b-8052-43b5-89c3-0e16dad5efba');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,2,3,4,0,1,'2023-01-05 17:57:17','2023-01-05 17:57:17','cd4b07dd-5159-4927-91b8-818878e9fdce'),(2,2,3,3,0,2,'2023-01-05 17:57:17','2023-01-05 17:57:17','22883f4b-0e7f-4e79-9814-e372fe793963'),(3,2,3,1,0,4,'2023-01-05 17:57:17','2023-01-05 17:57:17','460105cc-05b9-4754-9796-c8babb24e6db'),(4,3,4,2,0,0,'2023-01-05 17:57:37','2023-01-05 17:57:37','b01bb985-d6a7-422c-a3d1-66960c7bfe68'),(5,3,4,3,0,1,'2023-01-05 17:57:37','2023-01-05 17:57:37','03058abb-bba9-45aa-8f7a-20766e8cae20'),(6,4,5,4,0,0,'2023-01-05 17:58:17','2023-01-05 17:58:17','30f8e22f-432e-496e-b5e4-cfb7227cfbef');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2023-01-05 17:54:21','2023-01-05 17:54:21',NULL,'f198a667-ee5e-498d-a2ff-b04ea0b5437c'),(2,'craft\\elements\\Entry','2023-01-05 17:56:41','2023-01-05 17:56:41',NULL,'5c181466-d33d-46e2-8ca7-554fec374c6d'),(3,'benf\\neo\\elements\\Block','2023-01-05 17:57:37','2023-01-05 17:57:37',NULL,'05e80779-d457-459d-90a8-601c6a72c5fb'),(4,'verbb\\vizy\\models\\BlockType','2023-01-05 17:58:17','2023-01-05 17:58:17',NULL,'fbaff0a2-f624-437b-98b3-a5d96b3de685');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"df0ba3e5-f5f4-47a1-bcf2-f08fd173a89b\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-01-05 17:54:21','2023-01-05 17:54:21','755dfdc3-10ac-486c-be29-dea7bbecb180'),(3,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"143cf26b-a477-487b-bfe4-8eed39fcf203\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"57d81a52-67b6-46ec-b461-951dba136883\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"487cd774-5abb-4659-9a44-bdf26d8cf61e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"26c45475-80ef-407f-bb8d-8a49562a4dbb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"12ad923c-1b47-4be3-9f2d-6fbeae0aa93e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\",\"uid\":\"d62f293a-86e2-405d-bc15-d0e1517ce037\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0108be4d-4975-42af-837b-f458aa7a5244\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3f82f98e-b9b7-45de-a8c9-9d48fef07bcd\"}]',1,'2023-01-05 17:57:17','2023-01-05 17:57:17','857be776-7e36-46c3-b55b-1e1661d94a86'),(4,3,'Main','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b385f0b4-3072-47f4-bfea-34ea8bc0c18d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1e9e9a14-72a4-4093-b02b-6869e1ae9fa0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f6154c55-f880-44cc-8e3e-224c28a3eee1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"12ad923c-1b47-4be3-9f2d-6fbeae0aa93e\"}]',1,'2023-01-05 17:57:37','2023-01-05 17:57:37','763e4886-11d8-4771-8d8b-39b0e4a04c28'),(5,4,'Main','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0b17e829-6195-47eb-a0b0-042232bbd673\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"487cd774-5abb-4659-9a44-bdf26d8cf61e\"}]',1,'2023-01-05 17:58:17','2023-01-05 17:58:17','9bb381c4-ebf4-460b-aa4d-bed5522abb4d');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Content Blocks (Neo)','contentBlocks','global',NULL,NULL,0,'site',NULL,'benf\\neo\\Field','{\"minBlocks\":null,\"maxBlocks\":null,\"minTopBlocks\":null,\"maxTopBlocks\":null,\"minLevels\":null,\"maxLevels\":null,\"propagationMethod\":\"all\",\"propagationKeyFormat\":null}','2023-01-05 17:50:03','2023-01-05 17:57:37','3f82f98e-b9b7-45de-a8c9-9d48fef07bcd'),(2,1,'Heading','heading','global','kuewftyt',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-01-05 17:50:12','2023-01-05 17:50:12','1e9e9a14-72a4-4093-b02b-6869e1ae9fa0'),(3,1,'Rich Content (Vizy)','richContent','global','dmndrogy',NULL,0,'none',NULL,'verbb\\vizy\\fields\\VizyField','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"fieldData\":[{\"id\":\"group-IswqcoYZQs\",\"name\":\"Media\",\"blockTypes\":[{\"id\":\"type-WDAor1xNrx\",\"name\":\"Image\",\"handle\":\"image\",\"icon\":{\"label\":\"Image\",\"value\":\"image-regular\"},\"enabled\":true,\"layoutUid\":\"fbaff0a2-f624-437b-98b3-a5d96b3de685\",\"layoutConfig\":{\"tabs\":[{\"name\":\"Main\",\"uid\":\"9bb381c4-ebf4-460b-aa4d-bed5522abb4d\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"uid\":\"0b17e829-6195-47eb-a0b0-042232bbd673\",\"fieldUid\":\"487cd774-5abb-4659-9a44-bdf26d8cf61e\"}]}]}}]}],\"manualConfig\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"trimEmptyParagraphs\":true,\"vizyConfig\":\"\"}','2023-01-05 17:50:49','2023-01-05 17:58:17','12ad923c-1b47-4be3-9f2d-6fbeae0aa93e'),(4,1,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:a0955f9e-2dd8-4c0d-88e7-561a0d2f0973\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:a0955f9e-2dd8-4c0d-88e7-561a0d2f0973\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":\"Select Image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-01-05 17:55:06','2023-01-05 17:55:06','487cd774-5abb-4659-9a44-bdf26d8cf61e');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.3.6','4.0.0.9',0,'upylwyqvrdic','3@pxskglqjyc','2023-01-05 17:41:34','2023-01-05 17:58:17','feacc298-26c0-4983-a0bd-36bcb3aa8112');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','82ad027b-a187-4ccf-bf49-721b5087c3ff'),(2,'craft','m210121_145800_asset_indexing_changes','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','26d6d3ab-4dc6-4dc3-9522-e53f3f63f87e'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','349123b8-5a66-419a-a8ee-04cfc329d93a'),(4,'craft','m210724_180756_rename_source_cols','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','c162cd4a-7b86-41f6-b924-8c92d7c3327f'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','531385ab-9c1d-46dd-840f-4bbd47000ec2'),(6,'craft','m210817_014201_universal_users','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','1c3d3a66-c5df-49a7-998b-c22fa66df6b1'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','786e20f8-e074-48b2-a7e5-ab9b19f0ab94'),(8,'craft','m211115_135500_image_transformers','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','a010b3ba-17d6-44d0-91bb-dbc0e6b65bc6'),(9,'craft','m211201_131000_filesystems','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','4d4f539a-df30-420d-8802-1f903fd5627f'),(10,'craft','m220103_043103_tab_conditions','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','bd111531-2e86-4c06-a1ac-f65cadaf78ad'),(11,'craft','m220104_003433_asset_alt_text','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','45185ec6-c85d-471a-8f2b-de9de414016b'),(12,'craft','m220123_213619_update_permissions','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','cb3211b2-8beb-4744-8ad5-334a25747b2e'),(13,'craft','m220126_003432_addresses','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','2dcf5e0c-5223-4107-9e56-ae43be0f89b6'),(14,'craft','m220209_095604_add_indexes','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','2d86e599-6f7e-47c0-ad19-c98cf1751bc3'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','955b9c90-3f42-406e-8288-7a0989bce647'),(16,'craft','m220214_000000_truncate_sessions','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','7ce877db-fada-4d5d-a6f8-df14c3742fba'),(17,'craft','m220222_122159_full_names','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','3f15f0b6-4f79-466d-bebd-c877ae470116'),(18,'craft','m220223_180559_nullable_address_owner','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','2c5b1111-19e1-4595-bbad-41c8976b0f79'),(19,'craft','m220225_165000_transform_filesystems','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','cae083a2-c150-496a-a115-3e706615ccd3'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','376b2d11-cc21-4bf1-8275-137a5e2ee474'),(21,'craft','m220314_211928_field_layout_element_uids','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','82ea66eb-99d9-4893-b390-2ae49f86cbbd'),(22,'craft','m220316_123800_transform_fs_subpath','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','a6555869-aa13-4767-a67b-ab77bf70e6bc'),(23,'craft','m220317_174250_release_all_jobs','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','fa5a5507-4873-41b8-ac1d-476b16f03c25'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','97f6f171-a9af-4ec9-acd8-3b7988cad8c4'),(25,'craft','m220413_024536_site_enabled_string','2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:35','b1af2b70-8388-4d2d-91b5-1fd19692df58'),(26,'plugin:neo','Install','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','db786e99-eb34-4de0-b280-42d3281605e5'),(27,'plugin:neo','m220409_142203_neoblocks_owners_table','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','5084f3df-bb5b-4a54-966a-1c19461b2afc'),(28,'plugin:neo','m220411_111523_remove_ownersiteid_and_uid_neoblocks_columns','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','19e5c622-a6b2-40c4-b8b8-aca7e69bb11a'),(29,'plugin:neo','m220412_135950_neoblockstructures_rename_ownersiteid_to_siteid','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','6138df1e-bfc6-48a4-95bc-25eae288a152'),(30,'plugin:neo','m220421_105948_resave_shared_field_layouts','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','8a9f0484-1b91-46b9-b57e-011c7a4cf299'),(31,'plugin:neo','m220428_060316_add_group_dropdown_setting','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','bdaea765-aadb-4e1f-b630-b2f078bbed44'),(32,'plugin:neo','m220511_054742_delete_converted_field_block_types_and_groups','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','e6a75da6-cf11-4c74-9df1-091d0ad1b656'),(33,'plugin:neo','m220516_124013_add_blocktype_description','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','288d536e-d2cb-4eda-b6c6-fc488703f1d8'),(34,'plugin:neo','m220723_153601_add_conditions_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','40c80611-e33e-4742-b842-ad5c5552c74c'),(35,'plugin:neo','m220731_130608_add_min_child_blocks_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','3ba7b730-2b47-46da-a63a-b230c06ef563'),(36,'plugin:neo','m220805_072702_add_min_blocks_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','7e5495ca-f2eb-408d-b586-63e335e7d8f6'),(37,'plugin:neo','m220805_112335_add_min_sibling_blocks_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','de48331f-1b65-4b91-86ec-d3a6ffb97183'),(38,'plugin:neo','m220812_115137_add_enabled_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','4da55c76-acd6-4001-888c-c085ebf3f4f6'),(39,'plugin:neo','m221006_052456_add_group_child_block_types_column_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','95552e71-b0c9-4eb4-b179-59965cffc8a2'),(40,'plugin:neo','m221110_132322_add_ignore_permissions_to_block_types','2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:42:57','f1e10849-82c3-4ed2-8904-651346bddb32');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocks` VALUES (3,2,1,1,0,'2023-01-05 17:58:35','2023-01-05 17:58:35'),(4,2,1,1,0,'2023-01-05 17:58:42','2023-01-05 17:58:42'),(5,2,1,1,0,'2023-01-05 17:58:46','2023-01-05 17:58:46'),(7,2,1,1,NULL,'2023-01-05 17:59:35','2023-01-05 17:59:35'),(9,8,1,1,NULL,'2023-01-05 18:03:52','2023-01-05 18:03:52'),(11,10,1,1,NULL,'2023-01-05 18:04:00','2023-01-05 18:04:00');
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks_owners`
--

LOCK TABLES `neoblocks_owners` WRITE;
/*!40000 ALTER TABLE `neoblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocks_owners` VALUES (3,2,1),(3,10,1),(4,2,1),(4,10,1),(5,2,1),(5,10,1),(7,2,1),(9,8,1),(11,10,1);
/*!40000 ALTER TABLE `neoblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblockstructures` VALUES (4,5,2,1,1,'2023-01-05 17:59:35','2023-01-05 17:59:35','2e4ba851-9bc6-40a4-8571-744b608d9568'),(6,6,8,1,1,'2023-01-05 18:03:53','2023-01-05 18:03:53','683d9ad0-feb1-485b-b146-0b62d3cce82e'),(8,8,10,1,1,'2023-01-05 18:04:00','2023-01-05 18:04:00','1dd5d6b7-60d6-4c36-8d1f-da548c390f17');
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocktypes` VALUES (1,1,3,NULL,'Topic','topic','',1,0,0,0,0,0,0,1,NULL,1,1,1,'[]','2023-01-05 17:50:03','2023-01-05 17:57:37','2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28');
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'neo','3.5.16','3.5.2','trial',NULL,'2023-01-05 17:42:57','2023-01-05 17:42:57','2023-01-05 17:47:06','c5683f64-059a-4aa2-b45a-4301bf2a1852'),(2,'vizy','2.0.10','0.9.0','trial',NULL,'2023-01-05 17:47:01','2023-01-05 17:47:01','2023-01-05 17:47:06','6ca28ea3-0bab-417a-8c84-f241b955bea3');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1672941497'),('email.fromEmail','\"yoannis@ynm.studio\"'),('email.fromName','\"Debug Vizy 181\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.autocomplete','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.autocorrect','true'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.class','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.disabled','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.id','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.instructions','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.label','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.max','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.min','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.name','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.orientation','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.placeholder','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.readonly','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.requirable','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.size','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.step','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.tip','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.title','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.uid','\"143cf26b-a477-487b-bfe4-8eed39fcf203\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.warning','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.0.width','100'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.fieldUid','\"487cd774-5abb-4659-9a44-bdf26d8cf61e\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.instructions','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.label','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.required','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.tip','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.uid','\"57d81a52-67b6-46ec-b461-951dba136883\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.warning','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.1.width','100'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.fieldUid','\"12ad923c-1b47-4be3-9f2d-6fbeae0aa93e\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.instructions','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.label','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.required','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.tip','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.uid','\"26c45475-80ef-407f-bb8d-8a49562a4dbb\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.warning','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.2.width','100'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.3.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.3.uid','\"d62f293a-86e2-405d-bc15-d0e1517ce037\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.3.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.elementCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.fieldUid','\"3f82f98e-b9b7-45de-a8c9-9d48fef07bcd\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.instructions','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.label','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.required','false'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.tip','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.uid','\"0108be4d-4975-42af-837b-f458aa7a5244\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.warning','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.elements.4.width','100'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.name','\"Content\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.uid','\"857be776-7e36-46c3-b55b-1e1661d94a86\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.fieldLayouts.5c181466-d33d-46e2-8ca7-554fec374c6d.tabs.0.userCondition','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.handle','\"page\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.hasTitleField','true'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.name','\"Page\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.section','\"006bba92-4695-41cf-840d-8c701633c691\"'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.sortOrder','1'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.titleFormat','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.titleTranslationKeyFormat','null'),('entryTypes.c383d535-f125-44a2-8c7e-c83a816b00d6.titleTranslationMethod','\"site\"'),('fieldGroups.7b61504b-8052-43b5-89c3-0e16dad5efba.name','\"Common\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.columnSuffix','\"dmndrogy\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.contentColumnType','\"text\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.fieldGroup','\"7b61504b-8052-43b5-89c3-0e16dad5efba\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.handle','\"richContent\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.instructions','null'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.name','\"Rich Content (Vizy)\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.searchable','false'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.availableTransforms','\"\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.availableVolumes','\"\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.columnType','\"text\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.configSelectionMode','\"choose\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.defaultTransform','\"\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.0.0','\"id\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.0.1','\"group-IswqcoYZQs\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.1.0','\"name\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.1.1','\"Media\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.0','\"blockTypes\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.0.0','\"id\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.0.1','\"type-WDAor1xNrx\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.1.0','\"name\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.1.1','\"Image\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.2.0','\"handle\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.2.1','\"image\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.3.0','\"icon\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.3.1.__assoc__.0.0','\"label\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.3.1.__assoc__.0.1','\"Image\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.3.1.__assoc__.1.0','\"value\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.3.1.__assoc__.1.1','\"image-regular\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.5.0','\"enabled\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.5.1','true'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.6.0','\"layoutUid\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.6.1','\"fbaff0a2-f624-437b-98b3-a5d96b3de685\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.0','\"layoutConfig\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.0','\"tabs\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.0.1','\"Main\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.1.1','\"9bb381c4-ebf4-460b-aa4d-bed5522abb4d\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.0','\"fieldUid\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.10.1','\"487cd774-5abb-4659-9a44-bdf26d8cf61e\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.5.0','\"required\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.5.1','false'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"width\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','100'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"uid\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.fieldData.0.__assoc__.2.1.0.__assoc__.7.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','\"0b17e829-6195-47eb-a0b0-042232bbd673\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.manualConfig','\"\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.showUnpermittedFiles','false'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.showUnpermittedVolumes','false'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.trimEmptyParagraphs','true'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.settings.vizyConfig','\"\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.translationKeyFormat','null'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.translationMethod','\"none\"'),('fields.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e.type','\"verbb\\\\vizy\\\\fields\\\\VizyField\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.columnSuffix','\"kuewftyt\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.contentColumnType','\"text\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.fieldGroup','\"7b61504b-8052-43b5-89c3-0e16dad5efba\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.handle','\"heading\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.instructions','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.name','\"Heading\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.searchable','false'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.byteLimit','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.charLimit','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.code','false'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.columnType','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.initialRows','4'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.multiline','false'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.placeholder','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.settings.uiMode','\"normal\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.translationKeyFormat','null'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.translationMethod','\"none\"'),('fields.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.columnSuffix','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.contentColumnType','\"string\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.fieldGroup','\"7b61504b-8052-43b5-89c3-0e16dad5efba\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.handle','\"contentBlocks\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.instructions','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.name','\"Content Blocks (Neo)\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.searchable','false'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.maxBlocks','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.maxLevels','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.maxTopBlocks','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.minBlocks','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.minLevels','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.minTopBlocks','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.propagationKeyFormat','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.settings.propagationMethod','\"all\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.translationKeyFormat','null'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.translationMethod','\"site\"'),('fields.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd.type','\"benf\\\\neo\\\\Field\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.columnSuffix','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.contentColumnType','\"string\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.fieldGroup','\"7b61504b-8052-43b5-89c3-0e16dad5efba\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.handle','\"image\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.instructions','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.name','\"Image\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.searchable','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.allowedKinds.0','\"image\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.allowSelfRelations','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.allowSubfolders','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.allowUploads','true'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.defaultUploadLocationSource','\"volume:a0955f9e-2dd8-4c0d-88e7-561a0d2f0973\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.defaultUploadLocationSubpath','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.localizeRelations','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.maxRelations','1'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.minRelations','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.previewMode','\"full\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.restrictedDefaultUploadSubpath','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.restrictedLocationSource','\"volume:a0955f9e-2dd8-4c0d-88e7-561a0d2f0973\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.restrictedLocationSubpath','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.restrictFiles','true'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.restrictLocation','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.selectionLabel','\"Select Image\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.showSiteMenu','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.showUnpermittedFiles','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.showUnpermittedVolumes','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.source','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.sources','\"*\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.targetSiteId','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.validateRelatedElements','false'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.settings.viewMode','\"large\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.translationKeyFormat','null'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.translationMethod','\"site\"'),('fields.487cd774-5abb-4659-9a44-bdf26d8cf61e.type','\"craft\\\\fields\\\\Assets\"'),('fs.localFiles.hasUrls','true'),('fs.localFiles.name','\"Local Files\"'),('fs.localFiles.settings.path','\"@localFilesPath\"'),('fs.localFiles.type','\"craft\\\\fs\\\\Local\"'),('fs.localFiles.url','\"@localFilesUrl\"'),('meta.__names__.006bba92-4695-41cf-840d-8c701633c691','\"Pages\"'),('meta.__names__.12ad923c-1b47-4be3-9f2d-6fbeae0aa93e','\"Rich Content (Vizy)\"'),('meta.__names__.1e9e9a14-72a4-4093-b02b-6869e1ae9fa0','\"Heading\"'),('meta.__names__.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28','\"Topic\"'),('meta.__names__.3f82f98e-b9b7-45de-a8c9-9d48fef07bcd','\"Content Blocks (Neo)\"'),('meta.__names__.487cd774-5abb-4659-9a44-bdf26d8cf61e','\"Image\"'),('meta.__names__.7b61504b-8052-43b5-89c3-0e16dad5efba','\"Common\"'),('meta.__names__.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973','\"Local Files\"'),('meta.__names__.c1d05648-15bc-4c24-8069-b17513693b45','\"Debug Vizy 181\"'),('meta.__names__.c383d535-f125-44a2-8c7e-c83a816b00d6','\"Page\"'),('meta.__names__.d69a17cc-1b68-4b04-859e-a385ae46ab5d','\"Debug Vizy 181\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.childBlocks','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.conditions','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.description','\"\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.enabled','true'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.field','\"3f82f98e-b9b7-45de-a8c9-9d48fef07bcd\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elementCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.elementCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.fieldUid','\"1e9e9a14-72a4-4093-b02b-6869e1ae9fa0\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.instructions','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.label','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.required','false'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.tip','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.uid','\"b385f0b4-3072-47f4-bfea-34ea8bc0c18d\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.userCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.warning','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.0.width','100'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.elementCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.fieldUid','\"12ad923c-1b47-4be3-9f2d-6fbeae0aa93e\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.instructions','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.label','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.required','false'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.tip','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.uid','\"f6154c55-f880-44cc-8e3e-224c28a3eee1\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.userCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.warning','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.elements.1.width','100'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.name','\"Main\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.uid','\"763e4886-11d8-4771-8d8b-39b0e4a04c28\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.fieldLayouts.05e80779-d457-459d-90a8-601c6a72c5fb.tabs.0.userCondition','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.group','null'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.groupChildBlockTypes','true'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.handle','\"topic\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.ignorePermissions','true'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.maxBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.maxChildBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.maxSiblingBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.minBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.minChildBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.minSiblingBlocks','0'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.name','\"Topic\"'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.sortOrder','1'),('neoBlockTypes.2e1b87c9-2c85-4e01-8cd3-02ff75c6fc28.topLevel','true'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"CC1X2WZ5X4RKX2WRVFDHJW2Q\"'),('plugins.neo.schemaVersion','\"3.5.2\"'),('plugins.vizy.edition','\"standard\"'),('plugins.vizy.enabled','true'),('plugins.vizy.licenseKey','\"HBP6NZT6766CNKJN5ELYHUR3\"'),('plugins.vizy.schemaVersion','\"0.9.0\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.defaultPlacement','\"end\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.enableVersioning','true'),('sections.006bba92-4695-41cf-840d-8c701633c691.handle','\"pages\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.name','\"Pages\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.propagationMethod','\"all\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.siteSettings.c1d05648-15bc-4c24-8069-b17513693b45.enabledByDefault','true'),('sections.006bba92-4695-41cf-840d-8c701633c691.siteSettings.c1d05648-15bc-4c24-8069-b17513693b45.hasUrls','true'),('sections.006bba92-4695-41cf-840d-8c701633c691.siteSettings.c1d05648-15bc-4c24-8069-b17513693b45.template','\"pages/_entry\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.siteSettings.c1d05648-15bc-4c24-8069-b17513693b45.uriFormat','\"{{ (object.parent ? object.parent.uri ~ \'/\' : \'\') }}{slug}\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.structure.maxLevels','3'),('sections.006bba92-4695-41cf-840d-8c701633c691.structure.uid','\"08dd0044-b305-4983-b706-a75374370869\"'),('sections.006bba92-4695-41cf-840d-8c701633c691.type','\"structure\"'),('siteGroups.d69a17cc-1b68-4b04-859e-a385ae46ab5d.name','\"Debug Vizy 181\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.handle','\"default\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.hasUrls','true'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.language','\"en-US\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.name','\"Debug Vizy 181\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.primary','true'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.siteGroup','\"d69a17cc-1b68-4b04-859e-a385ae46ab5d\"'),('sites.c1d05648-15bc-4c24-8069-b17513693b45.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Debug Vizy 181\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elementCondition','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.autocapitalize','true'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.autocomplete','false'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.autocorrect','true'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.class','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.disabled','false'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.elementCondition','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.id','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.instructions','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.label','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.max','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.min','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.name','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.orientation','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.placeholder','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.readonly','false'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.requirable','false'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.size','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.step','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.tip','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.title','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.uid','\"df0ba3e5-f5f4-47a1-bcf2-f08fd173a89b\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.userCondition','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.warning','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.elements.0.width','100'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.name','\"Content\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.uid','\"755dfdc3-10ac-486c-be29-dea7bbecb180\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fieldLayouts.f198a667-ee5e-498d-a2ff-b04ea0b5437c.tabs.0.userCondition','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.fs','\"localFiles\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.handle','\"localFiles\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.name','\"Local Files\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.sortOrder','1'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.titleTranslationKeyFormat','null'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.titleTranslationMethod','\"site\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.transformFs','\"\"'),('volumes.a0955f9e-2dd8-4c0d-88e7-561a0d2f0973.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `queue` VALUES (22,'queue','O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:10;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:3:{i:0;s:5:\"image\";i:1;s:11:\"richContent\";i:2;s:13:\"contentBlocks\";}s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}','t9n:[\"app\",\"Updating search indexes\"]',1672941840,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(23,'queue','O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"elementType\";s:23:\"benf\\neo\\elements\\Block\";s:9:\"elementId\";i:11;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:2:{i:0;s:7:\"heading\";i:1;s:11:\"richContent\";}s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}','t9n:[\"app\",\"Updating search indexes\"]',1672941840,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(24,'queue','O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"elementType\";s:23:\"benf\\neo\\elements\\Block\";s:9:\"elementId\";i:11;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:0:{}s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}','t9n:[\"app\",\"Updating search indexes\"]',1672941840,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(25,'queue','O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"elementType\";s:20:\"craft\\elements\\Entry\";s:9:\"elementId\";i:10;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:1:{i:0;s:13:\"contentBlocks\";}s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}','t9n:[\"app\",\"Updating search indexes\"]',1672941840,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (1,4,2,NULL,6,1,'2023-01-05 17:59:13','2023-01-05 17:59:13','03acc324-2aab-4de0-b0a7-8b168d84585d'),(2,4,8,NULL,6,1,'2023-01-05 18:03:52','2023-01-05 18:03:52','b9a2be47-9ab5-4e35-8e37-95d1c8eab5ec'),(3,4,10,NULL,6,1,'2023-01-05 18:04:00','2023-01-05 18:04:00','96069103-87cb-42d3-b296-726a894a1009');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,7,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' yoannis ynm studio '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' yoannis ynm studio '),(2,'slug',0,1,' my trip to asia '),(2,'title',0,1,' my trip to asia '),(6,'extension',0,1,' jpg '),(6,'filename',0,1,' fujifilm sample images 5 jpg '),(6,'kind',0,1,' image '),(6,'slug',0,1,''),(6,'title',0,1,' fujifilm sample images 5 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,1,'Pages','pages','structure',1,'all','end',NULL,'2023-01-05 17:56:41','2023-01-05 17:56:41',NULL,'006bba92-4695-41cf-840d-8c701633c691');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'{{ (object.parent ? object.parent.uri ~ \'/\' : \'\') }}{slug}','pages/_entry',1,'2023-01-05 17:56:41','2023-01-05 17:56:41','5f11796c-9260-4721-bd6e-493a0d76f06a');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Debug Vizy 181','2023-01-05 17:41:35','2023-01-05 17:41:35',NULL,'d69a17cc-1b68-4b04-859e-a385ae46ab5d');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Debug Vizy 181','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-01-05 17:41:35','2023-01-05 17:41:35',NULL,'c1d05648-15bc-4c24-8069-b17513693b45');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,4,0,'2023-01-05 17:58:24','2023-01-05 17:58:25','23436680-820a-4913-b497-d5f79899bd9d'),(2,1,2,1,2,3,1,'2023-01-05 17:58:24','2023-01-05 17:58:24','df6ecf37-6537-4cf4-9b25-58f3528511d5'),(3,2,NULL,3,1,2,0,'2023-01-05 17:58:35','2023-01-05 17:58:42','6abc1ccb-3e35-4695-b8f1-d381b8c93e66'),(5,3,NULL,5,1,2,0,'2023-01-05 17:58:42','2023-01-05 17:58:46','c082e2a3-ccb3-4214-959b-5fbc010d67a0'),(7,4,NULL,7,1,2,0,'2023-01-05 17:58:46','2023-01-05 17:59:35','132af63f-ceb3-47c0-88cb-c7bbaa4827fe'),(9,5,NULL,9,1,4,0,'2023-01-05 17:59:35','2023-01-05 17:59:35','e5fd1896-4498-4fc9-9ea1-c962c69c3538'),(10,5,7,9,2,3,1,'2023-01-05 17:59:35','2023-01-05 17:59:35','967f9fdb-e6a5-4853-8577-dad19e964265'),(11,6,NULL,11,1,4,0,'2023-01-05 18:03:53','2023-01-05 18:03:53','241203bf-7ef9-449a-9d98-8b037f2cb430'),(12,6,9,11,2,3,1,'2023-01-05 18:03:53','2023-01-05 18:03:53','70d405c6-869f-4014-8e7d-7d67b85a89a3'),(13,7,NULL,13,1,4,0,'2023-01-05 18:04:00','2023-01-05 18:04:00','92308532-9ee4-455f-9a53-63c94c7094e4'),(14,7,7,13,2,3,1,'2023-01-05 18:04:00','2023-01-05 18:04:00','2caf5971-4613-4448-a58c-b19ecad3d6c0'),(15,8,NULL,15,1,4,0,'2023-01-05 18:04:00','2023-01-05 18:04:00','a97cd6ba-868a-4900-95f5-0b4f22e6bc36'),(16,8,11,15,2,3,1,'2023-01-05 18:04:00','2023-01-05 18:04:00','eb629b57-a405-483d-8f22-637cbf35f699');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,3,'2023-01-05 17:56:41','2023-01-05 17:56:41',NULL,'08dd0044-b305-4983-b706-a75374370869'),(2,NULL,'2023-01-05 17:58:35','2023-01-05 17:58:35','2023-01-05 17:58:42','7c6ee6f9-4fc8-4a8b-9063-5ee776edf370'),(3,NULL,'2023-01-05 17:58:42','2023-01-05 17:58:42','2023-01-05 17:58:46','85cbbd91-ba01-4f9f-8e87-896498d79f16'),(4,NULL,'2023-01-05 17:58:46','2023-01-05 17:58:46','2023-01-05 17:59:35','fb7b54b6-0c57-4ffb-8b99-0db4153fc249'),(5,NULL,'2023-01-05 17:59:35','2023-01-05 17:59:35',NULL,'d0bd2098-f83e-4d6f-b1a2-a772d014259e'),(6,NULL,'2023-01-05 18:03:53','2023-01-05 18:03:53','2023-01-05 18:03:53','6e980602-63c9-48d9-9d80-4489207e7e2d'),(7,NULL,'2023-01-05 18:04:00','2023-01-05 18:04:00','2023-01-05 18:04:00','a080ad3a-b8b4-4e2f-9897-7f5f5147b770'),(8,NULL,'2023-01-05 18:04:00','2023-01-05 18:04:00',NULL,'2a3f14a1-afd0-4285-982f-14c8cfa7bbb3');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'yoannis@ynm.studio',NULL,NULL,NULL,'yoannis@ynm.studio','$2y$13$6w9b/U3q4GWxlTWgY4PQ4ODqPRxPnI3Da21iixpH0u23rJqf51nSq','2023-01-05 17:41:57',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-01-05 17:41:35','2023-01-05 17:41:35','2023-01-05 17:41:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Local Files','','2023-01-05 17:54:21','2023-01-05 17:54:21','3b73452e-8708-4ea5-ab8f-87d2b75ba5cb'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-01-05 17:58:25','2023-01-05 17:58:25','7446221b-6663-49ce-8154-62c3b83ec8bd'),(3,2,NULL,'user_1','user_1/','2023-01-05 17:58:25','2023-01-05 17:58:25','b2f483d4-c80f-45b6-8ef4-e2e3c8e675c2');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Local Files','localFiles','localFiles','','','site',NULL,1,'2023-01-05 17:54:21','2023-01-05 17:54:21',NULL,'a0955f9e-2dd8-4c0d-88e7-561a0d2f0973');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-01-05 17:41:58','2023-01-05 17:41:58','54d7f9cc-5b7f-4d56-91f4-eb7a1b6df971'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-01-05 17:41:58','2023-01-05 17:41:58','4dcd4e3b-dc75-4349-b9e4-0f8c485222ef'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-01-05 17:41:58','2023-01-05 17:41:58','98d1faf5-ee91-4cac-a0b5-d9cec01974c5'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-01-05 17:41:58','2023-01-05 17:41:58','a858618c-f544-43c4-a617-68ca7f1bd26e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-05 18:12:44
