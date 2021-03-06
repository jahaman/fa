# MySQL dump of database 'faupgrade' on host 'localhost'
# Backup Date and Time: 2010-08-06 13:56
# Built by FrontAccounting 2.3RC1
# http://frontaccounting.com
# Company: Company name
# User: 



### Structure of table `0_areas` ###

DROP TABLE IF EXISTS `0_areas`;

CREATE TABLE `0_areas` (
  `area_code` int(11) NOT NULL auto_increment,
  `description` varchar(60) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`area_code`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_areas` ###

INSERT INTO `0_areas` VALUES ('1', 'USA', '0');


### Structure of table `0_attachments` ###

DROP TABLE IF EXISTS `0_attachments`;

CREATE TABLE `0_attachments` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `description` varchar(60) NOT NULL default '',
  `type_no` int(11) NOT NULL default '0',
  `trans_no` int(11) NOT NULL default '0',
  `unique_name` varchar(60) NOT NULL default '',
  `tran_date` date NOT NULL default '0000-00-00',
  `filename` varchar(60) NOT NULL default '',
  `filesize` int(11) NOT NULL default '0',
  `filetype` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `type_no` (`type_no`,`trans_no`)
) ENGINE=MyISAM  ;


### Data of table `0_attachments` ###



### Structure of table `0_audit_trail` ###

DROP TABLE IF EXISTS `0_audit_trail`;

CREATE TABLE `0_audit_trail` (
  `id` int(11) NOT NULL auto_increment,
  `type` smallint(6) unsigned NOT NULL default '0',
  `trans_no` int(11) unsigned NOT NULL default '0',
  `user` smallint(6) unsigned NOT NULL default '0',
  `stamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `description` varchar(60) default NULL,
  `fiscal_year` int(11) NOT NULL,
  `gl_date` date NOT NULL default '0000-00-00',
  `gl_seq` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `Seq` (`fiscal_year`,`gl_date`,`gl_seq`),
  KEY `Type_and_Number` (`type`,`trans_no`)
) ENGINE=InnoDB  ;


### Data of table `0_audit_trail` ###



### Structure of table `0_bank_accounts` ###

DROP TABLE IF EXISTS `0_bank_accounts`;

CREATE TABLE `0_bank_accounts` (
  `account_code` varchar(15) NOT NULL default '',
  `account_type` smallint(6) NOT NULL default '0',
  `bank_account_name` varchar(60) NOT NULL default '',
  `bank_account_number` varchar(100) NOT NULL default '',
  `bank_name` varchar(60) NOT NULL default '',
  `bank_address` tinytext,
  `bank_curr_code` char(3) NOT NULL default '',
  `dflt_curr_act` tinyint(1) NOT NULL default '0',
  `id` smallint(6) NOT NULL auto_increment,
  `last_reconciled_date` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ending_reconcile_balance` double NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `bank_account_name` (`bank_account_name`),
  KEY `bank_account_number` (`bank_account_number`),
  KEY `account_code` (`account_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3  ;


### Data of table `0_bank_accounts` ###



### Structure of table `0_bank_trans` ###

DROP TABLE IF EXISTS `0_bank_trans`;

CREATE TABLE `0_bank_trans` (
  `id` int(11) NOT NULL auto_increment,
  `type` smallint(6) default NULL,
  `trans_no` int(11) default NULL,
  `bank_act` varchar(15) NOT NULL default '',
  `ref` varchar(40) default NULL,
  `trans_date` date NOT NULL default '0000-00-00',
  `amount` double default NULL,
  `dimension_id` int(11) NOT NULL default '0',
  `dimension2_id` int(11) NOT NULL default '0',
  `person_type_id` int(11) NOT NULL default '0',
  `person_id` tinyblob,
  `reconciled` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `bank_act` (`bank_act`,`ref`),
  KEY `type` (`type`,`trans_no`),
  KEY `bank_act_2` (`bank_act`,`reconciled`),
  KEY `bank_act_3` (`bank_act`,`trans_date`)
) ENGINE=InnoDB  ;


### Data of table `0_bank_trans` ###



### Structure of table `0_bom` ###

DROP TABLE IF EXISTS `0_bom`;

CREATE TABLE `0_bom` (
  `id` int(11) NOT NULL auto_increment,
  `parent` char(20) NOT NULL default '',
  `component` char(20) NOT NULL default '',
  `workcentre_added` int(11) NOT NULL default '0',
  `loc_code` char(5) NOT NULL default '',
  `quantity` double NOT NULL default '1',
  PRIMARY KEY  (`parent`,`component`,`workcentre_added`,`loc_code`),
  KEY `component` (`component`),
  KEY `id` (`id`),
  KEY `loc_code` (`loc_code`),
  KEY `parent` (`parent`,`loc_code`),
  KEY `workcentre_added` (`workcentre_added`)
) ENGINE=MyISAM  ;


### Data of table `0_bom` ###



### Structure of table `0_budget_trans` ###

DROP TABLE IF EXISTS `0_budget_trans`;

CREATE TABLE `0_budget_trans` (
  `counter` int(11) NOT NULL auto_increment,
  `type` smallint(6) NOT NULL default '0',
  `type_no` bigint(16) NOT NULL default '1',
  `tran_date` date NOT NULL default '0000-00-00',
  `account` varchar(15) NOT NULL default '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL default '0',
  `dimension_id` int(11) default '0',
  `dimension2_id` int(11) default '0',
  `person_type_id` int(11) default NULL,
  `person_id` tinyblob,
  PRIMARY KEY  (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `Account` (`account`,`tran_date`,`dimension_id`,`dimension2_id`)
) ENGINE=InnoDB  ;


### Data of table `0_budget_trans` ###



### Structure of table `0_chart_class` ###

DROP TABLE IF EXISTS `0_chart_class`;

CREATE TABLE `0_chart_class` (
  `cid` varchar(3) NOT NULL,
  `class_name` varchar(60) NOT NULL default '',
  `ctype` tinyint(1) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  ;


### Data of table `0_chart_class` ###

INSERT INTO `0_chart_class` VALUES ('1', 'Assets', '1', '0');
INSERT INTO `0_chart_class` VALUES ('2', 'Liabilities', '2', '0');
INSERT INTO `0_chart_class` VALUES ('3', 'Income', '4', '0');
INSERT INTO `0_chart_class` VALUES ('4', 'Costs', '6', '0');


### Structure of table `0_chart_master` ###

DROP TABLE IF EXISTS `0_chart_master`;

CREATE TABLE `0_chart_master` (
  `account_code` varchar(15) NOT NULL default '',
  `account_code2` varchar(15) NOT NULL default '',
  `account_name` varchar(60) NOT NULL default '',
  `account_type` varchar(10) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`account_code`),
  KEY `account_name` (`account_name`),
  KEY `accounts_by_type` (`account_type`,`account_code`)
) ENGINE=MyISAM  ;


### Data of table `0_chart_master` ###

INSERT INTO `0_chart_master` VALUES ('1111', '', 'Alap??t??s, ??tszervez??s aktiv??lt ??rt??ke', '11', '0');
INSERT INTO `0_chart_master` VALUES ('1131', '', 'Vagyoni ??rt??k?? jogok', '11', '0');
INSERT INTO `0_chart_master` VALUES ('1141', '', 'Szellemi term??kek', '114', '0');
INSERT INTO `0_chart_master` VALUES ('1171', '', 'Immateri??lis javak ??rt??khelyesb??t??se', '117', '0');
INSERT INTO `0_chart_master` VALUES ('1181', '', 'Immateri??lis javak terven fel??li ??rt??kcs??kken??se', '118', '0');
INSERT INTO `0_chart_master` VALUES ('1191', '', 'Alapit??s, ??tszervez??s elsz??molt ??rt??kcs??kken??se', '119', '0');
INSERT INTO `0_chart_master` VALUES ('1193', '', 'Vagyoni ??rt??k?? jogok elsz??molt ??rt??kcs??kken??se', '119', '0');
INSERT INTO `0_chart_master` VALUES ('1194', '', 'Szellemi term??kek elsz??molt ??rt??kcs??kken??se', '119', '0');
INSERT INTO `0_chart_master` VALUES ('1311', '', 'Termel?? g??pek, berendez??sek', '131', '0');
INSERT INTO `0_chart_master` VALUES ('1321', '', 'J??rm??vek', '132', '0');
INSERT INTO `0_chart_master` VALUES ('1371', '', 'M??szaki g??pek, berendez??sek, j??rm??vek ??rt??khelyesb??t', '137', '0');
INSERT INTO `0_chart_master` VALUES ('1381', '', '', '138', '0');
INSERT INTO `0_chart_master` VALUES ('1391', '', 'Termel?? g??pek, berendez??sek elsz??molt ??rt??kcs??kken??s', '139', '0');
INSERT INTO `0_chart_master` VALUES ('1392', '', 'J??rm??vek ??rt??kcs??kken??se', '139', '0');
INSERT INTO `0_chart_master` VALUES ('1411', '', 'Egy??b g??p, berendez??se, szersz??m', '141', '0');
INSERT INTO `0_chart_master` VALUES ('1421', '', 'Egy??b j??rm??vek', '142', '0');
INSERT INTO `0_chart_master` VALUES ('1431', '', 'Irodai, igazgat??si berendez??s, felszerel??s', '143', '0');
INSERT INTO `0_chart_master` VALUES ('1451', '', 'Kis??rt??k?? g??p, berendez??s, felszerel??s', '145', '0');
INSERT INTO `0_chart_master` VALUES ('1452', '', 'Kis??rt??k?? irodai, igazgat??si berendez??s, felszerel??s', '145', '0');
INSERT INTO `0_chart_master` VALUES ('1471', '', 'Egy??b g??p, berendez??s, szersz??m ??rt??khelyesb??t??se', '147', '0');
INSERT INTO `0_chart_master` VALUES ('1472', '', 'Egy??b j??rm??vek ??rt??khelyesb??t??se', '147', '0');
INSERT INTO `0_chart_master` VALUES ('1473', '', 'Irodai, igazgat??si berendez??s, felszerel??s ??rt??khelyesb', '147', '0');
INSERT INTO `0_chart_master` VALUES ('1481', '', 'Egy??b g??p, berendez??s, felszerel??s terven fel??li ??rt??', '148', '0');
INSERT INTO `0_chart_master` VALUES ('1482', '', 'Egy??b j??rm??vek terven fel??li ??rt??kcs??kken??se', '148', '0');
INSERT INTO `0_chart_master` VALUES ('1483', '', 'Irodai, igazgat??si berendez??sek terven fel??li ??rt??kcs??', '148', '0');
INSERT INTO `0_chart_master` VALUES ('1491', '', 'Egy??b g??p, berendez??s, szersz??m elsz??molt ??rt??kcs??kk', '149', '0');
INSERT INTO `0_chart_master` VALUES ('1492', '', 'Egy??b j??rm??vek elsz??molt ??rt??kcs??kken??se', '149', '0');
INSERT INTO `0_chart_master` VALUES ('1493', '', 'Irodai, igazgat??si berendez??s, felszerel??s elsz??molt ??r', '149', '0');
INSERT INTO `0_chart_master` VALUES ('1495', '', 'Kis??rt??k?? t??rgyi eszk??z??k ??rt??kcs??kken??se', '149', '0');
INSERT INTO `0_chart_master` VALUES ('1611', '', 'Befejezetlen beruh??z??s', '161', '0');
INSERT INTO `0_chart_master` VALUES ('2690', '', 'Uton levo keszlet', '26', '0');
INSERT INTO `0_chart_master` VALUES ('2610', '', '??ruk beszerz??si ??ron', '26', '0');
INSERT INTO `0_chart_master` VALUES ('3111', '', 'Belf??ldi vev??k', '311', '0');
INSERT INTO `0_chart_master` VALUES ('3150', '', 'Belf??ldi k??vetel??sek ??rt??kveszt??se ??s visszair??sa', '311', '0');
INSERT INTO `0_chart_master` VALUES ('3161', '', 'K??lf??ldi vev??k', '316', '0');
INSERT INTO `0_chart_master` VALUES ('3190', '', 'K??lf??ldi k??vetel??sek ??rt??kveszt??se ??s visszair??sa', '316', '0');
INSERT INTO `0_chart_master` VALUES ('3211', '', 'K??vetel??sek anyav??llalattal szemben', '321', '0');
INSERT INTO `0_chart_master` VALUES ('3251', '', 'Jegyzett, de m??g be nem fizetett t??ke', '325', '0');
INSERT INTO `0_chart_master` VALUES ('3291', '', 'K??vetel??sek ??rt??kveszt??se ', '329', '0');
INSERT INTO `0_chart_master` VALUES ('3311', '', 'K??vetel??sek egy??b r??szesed??si viszonyban l??v?? v??llal', '331', '0');
INSERT INTO `0_chart_master` VALUES ('3321', '', 'Jegyzett, de m??g be nem fizetett t??ke', '332', '0');
INSERT INTO `0_chart_master` VALUES ('3391', '', 'Egy??b r??szesed??si viszonyban l??v?? v??llakoz??ssal szemb', '339', '0');
INSERT INTO `0_chart_master` VALUES ('3410', '', 'Belf??ldi v??lt??k??vetel??sek', '34', '0');
INSERT INTO `0_chart_master` VALUES ('3460', '', 'K??lf??ldi v??lt??k??vetel??sek', '34', '0');
INSERT INTO `0_chart_master` VALUES ('3510', '', 'Immateri??lis javakra adott el??leg', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3520', '', 'Beruh??z??sokra adott el??leg', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3530', '', 'K??szletekre adott el??leg', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3540', '', 'Osztal??k el??leg', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3550', '', 'VPOP ??FA elsz??mol??si sz??mla', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3560', '', 'Egy??b el??legek', '35', '0');
INSERT INTO `0_chart_master` VALUES ('3610', '', 'Munkav??llal??kkal szembeni k??vetel??s', '36', '0');
INSERT INTO `0_chart_master` VALUES ('3620', '', 'K??lts??gvet??si kiut??l??si ig??nyek', '36', '0');
INSERT INTO `0_chart_master` VALUES ('3630', '', 'K??lts??gvet??si kiutal??si ig??nyek teljesit??se', '36', '0');
INSERT INTO `0_chart_master` VALUES ('3640', '', 'Vev??t??l kapott el??leg ??F??-ja', '36', '0');
INSERT INTO `0_chart_master` VALUES ('3661', '', 'R??vid lej??ratra adott p??nzk??lcs??n', '366', '0');
INSERT INTO `0_chart_master` VALUES ('3662', '', 'R??vid lej??rat?? bet??tek', '366', '0');
INSERT INTO `0_chart_master` VALUES ('3680', '', 'Egy??b k??vetel??sek', '366', '0');
INSERT INTO `0_chart_master` VALUES ('3690', '', 'Egy??b k??vetel??sek ??rt??kveszt??se ??s visszair??sa', '366', '0');
INSERT INTO `0_chart_master` VALUES ('3710', '', 'R??szesed??s kapcsolt v??llakoz??sban', '37', '0');
INSERT INTO `0_chart_master` VALUES ('3720', '', 'Egy??b r??szesed??s', '37', '0');
INSERT INTO `0_chart_master` VALUES ('3790', '', '??rt??kpapirok ??rt??kveszt??se ??s visszair??sa', '37', '0');
INSERT INTO `0_chart_master` VALUES ('3811', '', 'F??p??nzt??r', '381', '0');
INSERT INTO `0_chart_master` VALUES ('3822', '', 'USD valutap??nzt??r', '382', '0');
INSERT INTO `0_chart_master` VALUES ('3821', '', 'EURO valutap??nzt??r', '382', '0');
INSERT INTO `0_chart_master` VALUES ('3841', '', 'Banksz??mla (Ft)', '384', '0');
INSERT INTO `0_chart_master` VALUES ('3861', '', 'Banksz??mla (EUR)', '386', '0');
INSERT INTO `0_chart_master` VALUES ('3862', '', 'Deviza bet??tsz??mla USD', '386', '0');
INSERT INTO `0_chart_master` VALUES ('3893', '', '??tvezet??s Bank (HUF) - Bank (EUR)', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3891', '', '??tvezet??s Bank (HUF) - P??nzt??r (HUF)', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3892', '', '??tvezet??s Bank (EUR) - P??nzt??r (EUR)', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3894', '', '??tvezet??s P??nzt??r (HUF) - P??nzt??r (EUR)', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3895', '', '??tvezet??s Bank (HUF) - Bank (USD)', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3896', '', 'Bankk??rtya ??tvezet??s', '389', '0');
INSERT INTO `0_chart_master` VALUES ('3920', '', 'K??lts??gek r??fordit??sok aktiv id??beli elhat??rol??sa', '39', '0');
INSERT INTO `0_chart_master` VALUES ('3910', '', 'Bev??telek aktiv id??beli elhat??rol??sa', '39', '0');
INSERT INTO `0_chart_master` VALUES ('3930', '', 'Halasztott r??fordit??sok', '39', '0');
INSERT INTO `0_chart_master` VALUES ('4110', '', 'Jegyzett t??ke', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4120', '', 'T??ketartal??k', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4130', '', 'Eredm??nytartal??k', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4140', '', 'Lek??t??tt tartal??k', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4170', '', '??rt??kel??si tartal??k', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4190', '', 'M??rleg szerinti eredm??ny', '41', '0');
INSERT INTO `0_chart_master` VALUES ('4210', '', 'C??ltartal??kok v??rhat?? k??telezetts??gekre', '42', '0');
INSERT INTO `0_chart_master` VALUES ('4220', '', 'C??ltartal??kok a j??v??beni k??lts??gekre', '42', '0');
INSERT INTO `0_chart_master` VALUES ('4230', '', 'Egy??b c??ltartal??kok', '42', '0');
INSERT INTO `0_chart_master` VALUES ('4421', '', 'Hossz?? lej??ratra kapott k??lcs??n??k', '442', '0');
INSERT INTO `0_chart_master` VALUES ('4431', '', 'Beruh??z??si ??s fejleszt??si hitelek', '443', '0');
INSERT INTO `0_chart_master` VALUES ('4441', '', 'Egy??b hossz?? lej??rat?? hitel', '444', '0');
INSERT INTO `0_chart_master` VALUES ('4461', '', 'Tart??s k??telezetts??g', '446', '0');
INSERT INTO `0_chart_master` VALUES ('4471', '', 'Tart??s k??telezetts??g egy??b v??llakoz??ssal szemben', '447', '0');
INSERT INTO `0_chart_master` VALUES ('4491', '', 'Egy??b hossz?? lej??rat?? k??telezetts??g', '449', '0');
INSERT INTO `0_chart_master` VALUES ('4511', '', 'Vev??kt??l kapott el??leg', '451', '0');
INSERT INTO `0_chart_master` VALUES ('4541', '', 'Belf??ldi sz??ll??t??k', '454', '0');
INSERT INTO `0_chart_master` VALUES ('4542', '', 'K??lf??ldi sz??ll??t??k', '454', '0');
INSERT INTO `0_chart_master` VALUES ('4551', '', 'P??nz??gyi l??zing (??ven bel??li)', '455', '0');
INSERT INTO `0_chart_master` VALUES ('4561', '', 'R??vid lej??rat?? k??telezetts??g', '456', '0');
INSERT INTO `0_chart_master` VALUES ('4571', '', 'R??vid lej??rat?? k??telezetts??g egy??b', '457', '0');
INSERT INTO `0_chart_master` VALUES ('4591', '', 'Egy??b r??vid lej??rat?? k??telezetts??g', '459', '0');
INSERT INTO `0_chart_master` VALUES ('4611', '', 'T??rsas??gi ad??', '461', '0');
INSERT INTO `0_chart_master` VALUES ('4619', '', 'T??rsas??gi ad?? megfizet??se', '461', '0');
INSERT INTO `0_chart_master` VALUES ('4621', '', 'Munkaviszonyb??l sz??rmaz?? SZJA', '462', '0');
INSERT INTO `0_chart_master` VALUES ('4629', '', 'SZJA befizet??s', '462', '0');
INSERT INTO `0_chart_master` VALUES ('4631', '', 'Nyugd??jbiztos??t??s', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4632', '', 'Eg??szs??gbiztos??t??s', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4633', '', 'Munkaad??i j??rul??k', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4634', '', 'Munkav??llal??i j??rul??k', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4635', '', 'Szakk??pz??si hozz??j??rul??s', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4636', '', 'Rehabilit??ci??s hozz??j??rul??s', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4637', '', 'EHO', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4638', '', '??nellen??rz??si, k??sedelmi p??tl??k', '463', '0');
INSERT INTO `0_chart_master` VALUES ('4641', '', 'Nyugd??jbiztos??t??s teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4642', '', 'EEg??szs??gbiztos??t??s teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4643', '', 'Munkaad??i j??rul??k teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4644', '', 'Munkav??llal??i j??rul??k teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4645', '', 'Szakk??pz??si hozz??j??rul??s teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4646', '', 'Rehabilit??ci??s hozz??j??rul??s teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4647', '', 'EHO teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4648', '', '??nellen??rz??si, k??sedelmi p??tl??k teljesit??se', '464', '0');
INSERT INTO `0_chart_master` VALUES ('4651', '', 'VPOP elsz??mol??si sz??mla', '465', '0');
INSERT INTO `0_chart_master` VALUES ('4661', '', 'El??zetesen felsz??m??tottt ??FA 20%', '466', '0');
INSERT INTO `0_chart_master` VALUES ('4662', '', 'El??zetesen felsz??m??tottt ??FA 5%', '466', '0');
INSERT INTO `0_chart_master` VALUES ('4663', '', 'El??zetesen felsz??m??tottt ??FA 0%', '466', '0');
INSERT INTO `0_chart_master` VALUES ('4664', '', 'El??zetesen felsz??m??tottt ??FA ad??mentes', '466', '0');
INSERT INTO `0_chart_master` VALUES ('4671', '', 'Fizetend?? ??FA 20%', '467', '0');
INSERT INTO `0_chart_master` VALUES ('4672', '', 'Fizetend?? ??FA 5%', '467', '0');
INSERT INTO `0_chart_master` VALUES ('4673', '', 'Fizetend?? ??FA 0%', '467', '0');
INSERT INTO `0_chart_master` VALUES ('4674', '', 'Fizetend?? ??FA ad??mentes', '467', '0');
INSERT INTO `0_chart_master` VALUES ('4680', '', '??FA elsz??mol??si sz??mla', '467', '0');
INSERT INTO `0_chart_master` VALUES ('4691', '', 'Ipar??z??si ad??', '469', '0');
INSERT INTO `0_chart_master` VALUES ('4692', '', 'G??pj??rm??ad??', '469', '0');
INSERT INTO `0_chart_master` VALUES ('4693', '', 'Kommun??lis ad??', '469', '0');
INSERT INTO `0_chart_master` VALUES ('47101', '', 'J??vedelem elsz??mol??s janu??r', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47102', '', 'J??vedelem elsz??mol??s febru??r', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47103', '', 'J??vedelem elsz??mol??s m??rcius', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47104', '', 'J??vedelem elsz??mol??s ??prilis', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47105', '', 'J??vedelem elsz??mol??s m??jus', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47106', '', 'J??vedelem elsz??mol??s j??nius', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47107', '', 'J??vedelem elsz??mol??s j??lius', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47108', '', 'J??vedelem elsz??mol??s augusztus', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47109', '', 'J??vedelem elsz??mol??s szeptember', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47110', '', 'J??vedelem elsz??mol??s okt??ber', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47111', '', 'J??vedelem elsz??mol??s november', '471', '0');
INSERT INTO `0_chart_master` VALUES ('47112', '', 'J??vedelem elsz??mol??s december', '471', '0');
INSERT INTO `0_chart_master` VALUES ('4721', '', 'Fel nem vett j??rand??s??g', '472', '0');
INSERT INTO `0_chart_master` VALUES ('47311', '', 'Nyugd??jbiztos??t??si Alap k??telezetts??g', '4731', '0');
INSERT INTO `0_chart_master` VALUES ('47319', '', 'Nyugd??jbiztos??t??si Alap k??telezetts??g teljesit??se', '4731', '0');
INSERT INTO `0_chart_master` VALUES ('47321', '', 'Eg??szs??gbiztos??t??si Alap k??telezetts??g', '4731', '0');
INSERT INTO `0_chart_master` VALUES ('47329', '', 'Eg??szs??gbiztos??t??si Alap k??telezetts??g teljesit??se', '4732', '0');
INSERT INTO `0_chart_master` VALUES ('47331', '', 'Mag??nnyugd??jp??nzt??r', '4733', '0');
INSERT INTO `0_chart_master` VALUES ('4781', '', 'Osztal??k', '478', '0');
INSERT INTO `0_chart_master` VALUES ('4799', '', 'Technikai sz??mla', '479', '0');
INSERT INTO `0_chart_master` VALUES ('4810', '', 'K??lts??gek, r??fordit??sok passz??v id??beli elhat??rol??sa', '48', '0');
INSERT INTO `0_chart_master` VALUES ('4820', '', '??rbev??telek passz??v id??beli elhat??rol??sa', '48', '0');
INSERT INTO `0_chart_master` VALUES ('4830', '', 'Halasztott bev??telek', '48', '0');
INSERT INTO `0_chart_master` VALUES ('4910', '', 'Nyit??m??rleg sz??mla', '48', '0');
INSERT INTO `0_chart_master` VALUES ('4920', '', 'Z??r?? m??rleg sz??mla', '49', '0');
INSERT INTO `0_chart_master` VALUES ('4930', '', 'Ad??zott eredm??ny elsz??mol??si sz??mla', '49', '0');
INSERT INTO `0_chart_master` VALUES ('5110', '', 'Anyagk??lts??g', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5120', '', 'Energia, szem??t, k??z??zemi d??j', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5130', '', '??zemanyag', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5140', '', 'Nyomtatv??nyok, irodaszerek', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5150', '', 'Tiszt??t??szer', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5160', '', 'Szakk??nyv, foly??irat', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5190', '', 'Egy??b anyagk??lts??g', '51', '0');
INSERT INTO `0_chart_master` VALUES ('5211', '', 'Belf??ldi sz??ll??t??si k??lts??g', '521', '0');
INSERT INTO `0_chart_master` VALUES ('5212', '', 'K??lf??ldi sz??ll??t??si k??lts??g', '521', '0');
INSERT INTO `0_chart_master` VALUES ('5221', '', 'Irodab??rleti d??j', '522', '0');
INSERT INTO `0_chart_master` VALUES ('5241', '', 'Belf??ldi utaz??si k??lts??g', '524', '0');
INSERT INTO `0_chart_master` VALUES ('5242', '', 'K??lf??ldi utaz??si k??lts??g', '524', '0');
INSERT INTO `0_chart_master` VALUES ('5251', '', 'Rekl??m k??lts??g', '525', '0');
INSERT INTO `0_chart_master` VALUES ('5252', '', 'Hirdet??s k??lts??ge', '525', '0');
INSERT INTO `0_chart_master` VALUES ('5261', '', 'Oktat??s k??lts??ge', '526', '0');
INSERT INTO `0_chart_master` VALUES ('5271', '', 'Posta k??lts??g', '527', '0');
INSERT INTO `0_chart_master` VALUES ('5281', '', 'Telefonk??lts??g', '528', '0');
INSERT INTO `0_chart_master` VALUES ('5282', '', 'Internet k??lts??g', '528', '0');
INSERT INTO `0_chart_master` VALUES ('52901', '', 'K??nyvvezet??s k??lts??ge', '529', '0');
INSERT INTO `0_chart_master` VALUES ('52902', '', '??gyv??di k??lts??g', '529', '0');
INSERT INTO `0_chart_master` VALUES ('52903', '', 'Tan??csad??s', '529', '0');
INSERT INTO `0_chart_master` VALUES ('52904', '', 'V??m??gyint??z??s', '529', '0');
INSERT INTO `0_chart_master` VALUES ('5299', '', 'Egy??b ig??nybevett szolg??ltat??s', '529', '0');
INSERT INTO `0_chart_master` VALUES ('5311', '', 'Illet??kek, tagd??jak', '531', '0');
INSERT INTO `0_chart_master` VALUES ('5321', '', 'Bankk??lts??g', '532', '0');
INSERT INTO `0_chart_master` VALUES ('5331', '', 'Vagyonbiztos??t??s', '533', '0');
INSERT INTO `0_chart_master` VALUES ('5391', '', 'Faktord??j', '539', '0');
INSERT INTO `0_chart_master` VALUES ('5410', '', 'B??rk??lts??g (munkav??llal??, tag)', '54', '0');
INSERT INTO `0_chart_master` VALUES ('5420', '', 'Megbiz??si jogviszony k??lts??ge', '54', '0');
INSERT INTO `0_chart_master` VALUES ('5450', '', 'Pr??mium', '54', '0');
INSERT INTO `0_chart_master` VALUES ('5510', '', '??tkez??si jegy', '55', '0');
INSERT INTO `0_chart_master` VALUES ('5520', '', 'Reprezent??ci??', '55', '0');
INSERT INTO `0_chart_master` VALUES ('5590', '', 'Egy??b szem??lyi jelleg?? kifizet??s', '55', '0');
INSERT INTO `0_chart_master` VALUES ('5611', '', 'Nyugd??jbiztos??t??si j??rul??k', '561', '0');
INSERT INTO `0_chart_master` VALUES ('5612', '', 'Eg??szs??gbiztos??t??si j??rul??k', '561', '0');
INSERT INTO `0_chart_master` VALUES ('5621', '', 'T??teles EHO', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5622', '', 'Sz??zal??kos EHO', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5630', '', 'Munkaad??i j??rul??k', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5640', '', 'Szakk??pz??si hozz??j??rul??s', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5650', '', 'Rehabilit??ci??s hozz??j??rul??s', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5690', '', 'Egy??b b??rj??rul??kok', '562', '0');
INSERT INTO `0_chart_master` VALUES ('5710', '', 'Terv szerinti ??rt??kcs??kken??si leir??s', '57', '0');
INSERT INTO `0_chart_master` VALUES ('5720', '', 'Kis??rt??k?? eszk??z??k ??rt??kcs??kken??se', '57', '0');
INSERT INTO `0_chart_master` VALUES ('8110', '', 'Anyagk??lts??g', '81', '0');
INSERT INTO `0_chart_master` VALUES ('8120', '', 'Ig??nybevett szolg??ltat??s', '81', '0');
INSERT INTO `0_chart_master` VALUES ('8130', '', 'Eladott szolg??ltat??sok ??rt??ke', '81', '0');
INSERT INTO `0_chart_master` VALUES ('8140', '', 'EL??B??', '81', '0');
INSERT INTO `0_chart_master` VALUES ('8150', '', 'Eladott (k??zvetitett) szolg??ltat??s ??rt??ke', '81', '0');
INSERT INTO `0_chart_master` VALUES ('8611', '', '??rt??kesitett immateri??lis javak nyilv??ntart??si ??rt??ke', '861', '0');
INSERT INTO `0_chart_master` VALUES ('8612', '', '??rt??kesitett t??rgyi eszk??z??k nyilv??ntart??si ??rt??ke', '861', '0');
INSERT INTO `0_chart_master` VALUES ('8631', '', 'k??sedelmi kamatok', '863', '0');
INSERT INTO `0_chart_master` VALUES ('8641', '', 'C??ltartal??k k??pz??se', '864', '0');
INSERT INTO `0_chart_master` VALUES ('8651', '', 'K??vetel??sek ??rt??kveszt??se', '865', '0');
INSERT INTO `0_chart_master` VALUES ('8652', '', 'Immateri??lis javak terven fel??li ??rt??kcs??kken??se', '865', '0');
INSERT INTO `0_chart_master` VALUES ('8653', '', 'T??rgyi eszk??z??k terven fel??li ??rt??kcs??kken??se', '865', '0');
INSERT INTO `0_chart_master` VALUES ('8661', '', 'Ipar??z??si ad??', '866', '0');
INSERT INTO `0_chart_master` VALUES ('8662', '', 'G??pj??rm??ad??', '866', '0');
INSERT INTO `0_chart_master` VALUES ('8663', '', 'Kommun??lis ad??', '866', '0');
INSERT INTO `0_chart_master` VALUES ('8681', '', 'Le nem vonhat?? ??FA', '868', '0');
INSERT INTO `0_chart_master` VALUES ('8682', '', '??nellen??rz??si p??tl??k', '868', '0');
INSERT INTO `0_chart_master` VALUES ('8691', '', 'K??resem??nyek', '869', '0');
INSERT INTO `0_chart_master` VALUES ('8694', '', 'El??z?? ??vet terhel?? r??fordit??sok', '869', '0');
INSERT INTO `0_chart_master` VALUES ('8699', '', 'Egy??b r??fordit??sok', '869', '0');
INSERT INTO `0_chart_master` VALUES ('8698', '', 'Kerekit??si k??l??nb??zet', '869', '0');
INSERT INTO `0_chart_master` VALUES ('8710', '', 'Fizetett osztal??k, r??szesed??s', '87', '0');
INSERT INTO `0_chart_master` VALUES ('8720', '', 'R??szesed??sek, ??rt??kpapirok, bankbet??tek ??rt??kveszt??s', '87', '0');
INSERT INTO `0_chart_master` VALUES ('8730', '', 'Befektett p??nz??gyi eszk??z??k ??rfolyam vesztes??ge', '87', '0');
INSERT INTO `0_chart_master` VALUES ('8741', '', 'Fizetett kamatok kapcsolt v??llakoz??snak', '874', '0');
INSERT INTO `0_chart_master` VALUES ('8742', '', 'Fizetett kamatok egy??b v??llakoz??soknak', '874', '0');
INSERT INTO `0_chart_master` VALUES ('8743', '', 'P??nzint??zetnek fizetett kamatok', '874', '0');
INSERT INTO `0_chart_master` VALUES ('8744', '', 'Mag??nszem??lyeknek fizetett kamatok', '874', '0');
INSERT INTO `0_chart_master` VALUES ('8761', '', 'Deviza ??s valutak??szletek ??tv??lt??si ??rfolyamvesztes??g', '876', '0');
INSERT INTO `0_chart_master` VALUES ('8762', '', 'K??vetel??sek ??s k??telezetts??gek ??rfolyamvesztes??ge', '876', '0');
INSERT INTO `0_chart_master` VALUES ('8791', '', 'Faktord??j', '879', '0');
INSERT INTO `0_chart_master` VALUES ('8820', '', 'T??rsas??gba bevitt vagyont??rgyak nyilv??ntart??s szerinti ', '881', '0');
INSERT INTO `0_chart_master` VALUES ('8830', '', 'V??glegesen ??tadott p??nzeszk??z', '881', '0');
INSERT INTO `0_chart_master` VALUES ('8840', '', 'Elengedett k??vetel??s', '881', '0');
INSERT INTO `0_chart_master` VALUES ('8890', '', 'Egy??b rendk??v??li r??fordit??sok', '881', '0');
INSERT INTO `0_chart_master` VALUES ('8910', '', 'T??rsas??gi ad??', '89', '0');
INSERT INTO `0_chart_master` VALUES ('9112', '', 'Belf??ldi szolg??ltat??s ??rbev??tele', '911', '0');
INSERT INTO `0_chart_master` VALUES ('9111', '', 'Belf??ldi termek??rt??kes??t??s ??rbev??tele', '911', '0');
INSERT INTO `0_chart_master` VALUES ('9311', '', 'Export termek??rt??kes??t??s ??rbev??tele', '931', '0');
INSERT INTO `0_chart_master` VALUES ('9312', '', 'Export szolg??ltat??s ??rbev??tele', '931', '0');
INSERT INTO `0_chart_master` VALUES ('9611', '', '??rt??kesitett immateri??lis javak bev??tele', '961', '0');
INSERT INTO `0_chart_master` VALUES ('9612', '', '??rt??kesitett t??rgyi eszk??z??k bev??tele', '961', '0');
INSERT INTO `0_chart_master` VALUES ('9631', '', 'Kapott k??sedelmi kamatok', '963', '0');
INSERT INTO `0_chart_master` VALUES ('9641', '', 'C??ltartal??k k??pz??se', '964', '0');
INSERT INTO `0_chart_master` VALUES ('9651', '', 'K??vetel??sek ??rt??kveszt??s??nek visszair??sa', '965', '0');
INSERT INTO `0_chart_master` VALUES ('9652', '', 'Immateri??lis javak terven fel??li ??rt??kcs??kken??s??nek v', '965', '0');
INSERT INTO `0_chart_master` VALUES ('9653', '', 'T??rgyi eszk??z??k terven fel??li ??r??tkcs??kken??s??nek vi', '965', '0');
INSERT INTO `0_chart_master` VALUES ('9691', '', 'K??resem??nyek bev??telei', '965', '0');
INSERT INTO `0_chart_master` VALUES ('9698', '', 'Kerek??t??si k??l??nb??zet', '965', '0');
INSERT INTO `0_chart_master` VALUES ('9699', '', 'Egy??b bev??telek', '969', '0');
INSERT INTO `0_chart_master` VALUES ('9710', '', 'Kapott osztal??k, r??szesed??s', '97', '0');
INSERT INTO `0_chart_master` VALUES ('9720', '', 'R??szesed??sek, ??rt??kpapirok, bankbet??tek ??rt??kveszt??s', '97', '0');
INSERT INTO `0_chart_master` VALUES ('9730', '', 'Befektetett p??nz??gyi eszk??z??k ??rfolyam nyeres??ge', '97', '0');
INSERT INTO `0_chart_master` VALUES ('9741', '', 'Kapott kamatok kapcsolt v??llalkoz??st??l', '974', '0');
INSERT INTO `0_chart_master` VALUES ('9742', '', 'Kapott kamatok egy??b v??llakoz??st??l', '974', '0');
INSERT INTO `0_chart_master` VALUES ('9743', '', 'Kapott kamatok p??nzint??zett??l', '974', '0');
INSERT INTO `0_chart_master` VALUES ('9744', '', 'Mag??nszem??lyt??l kapott kamatok', '974', '0');
INSERT INTO `0_chart_master` VALUES ('9761', '', 'Deviza ??s valutak??szlet ??tv??lt??si ??rfolyamnyeres??ge', '976', '0');
INSERT INTO `0_chart_master` VALUES ('9762', '', 'K??vetel??sek ??s k??telezetts??gek ??rfolyamnyeres??ge', '976', '0');
INSERT INTO `0_chart_master` VALUES ('9791', '', 'Egy??b p??nz??gyi bev??telek', '979', '0');
INSERT INTO `0_chart_master` VALUES ('9810', '', 'Ellen??rt??k n??lk??l kapott eszk??z??k ??rt??ke', '98', '0');
INSERT INTO `0_chart_master` VALUES ('9820', '', 'T??rsas??gba bevitt vagyont??rgyak szerz??d??s szerinti ??rt', '98', '0');
INSERT INTO `0_chart_master` VALUES ('9830', '', 'V??glegesen kapott p??nzeszk??z', '98', '0');
INSERT INTO `0_chart_master` VALUES ('9840', '', 'Elengedett k??telezetts??g', '98', '0');
INSERT INTO `0_chart_master` VALUES ('9890', '', 'Egy??b rendk??v??li bev??telek', '98', '0');


### Structure of table `0_chart_types` ###

DROP TABLE IF EXISTS `0_chart_types`;

CREATE TABLE `0_chart_types` (
  `id` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL default '',
  `class_id` varchar(3) NOT NULL default '',
  `parent` varchar(10) NOT NULL default '-1',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4734  ;


### Data of table `0_chart_types` ###

INSERT INTO `0_chart_types` VALUES ('11', 'Immateri??lis javak', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('114', 'Szellemi term??kek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('117', 'Immateri??lis javak ??rt??khelyesb??t??se', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('118', 'Immateri??lis javak terven fel??li ??rt??kcs??kken??se', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('119', 'Immateri??lis javak ??rt??kcs??kken??se', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('12', 'Ingatlanok', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('13', 'M??szaki g??pek, berendez??sek, j??rm??vek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('131', 'Termel?? g??pek, berendez??sek', '1', '13', '0');
INSERT INTO `0_chart_types` VALUES ('132', 'J??rm??vek', '1', '13', '0');
INSERT INTO `0_chart_types` VALUES ('137', 'M??szaki g??pek, berendez??sek j??rm??vek ??rt??khelyesb.', '1', '13', '0');
INSERT INTO `0_chart_types` VALUES ('138', 'M??szaki g??pek, berendez??sek, j??rm??vek terven fel??li ??', '1', '13', '0');
INSERT INTO `0_chart_types` VALUES ('139', 'M??szaki g??pek, berendez??sek, j??rm??vek ??rt??kcs??kk.', '1', '13', '0');
INSERT INTO `0_chart_types` VALUES ('14', 'Egy??b g??pek, berendez??sek, j??rm??vek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('141', 'Egy??b g??p, berendez??s, szersz??m', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('142', 'Egy??b j??rm??vek', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('143', 'Irodai, igazgat??si berendez??s, felszerel??s', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('145', 'Kis??rt??k?? t??rgyi eszk??z', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('147', 'Egy??b g??pek, berendez??sek, j??rm??vek ??rt??khelyesb??t??', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('148', 'Egy??b g??pek, berendez??sek, j??rm??vek terven fel??li ??rt', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('149', 'Egy??b g??pek, berendez??sek, j??rm??vek elsz??molt ??rt??kc', '1', '14', '0');
INSERT INTO `0_chart_types` VALUES ('15', 'Beruh??z??sok', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('161', 'Befejezetlen beruh??z??sok', '1', '15', '0');
INSERT INTO `0_chart_types` VALUES ('21', 'Anyagok', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('26', 'Kereskedelmi ??ruk', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('31', 'K??vetel??sek ??rusz??ll??t??sb??l, szolg??ltat??sb??l', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('311', 'Belf??ldi vev??k', '1', '31', '0');
INSERT INTO `0_chart_types` VALUES ('316', 'K??lf??ldi vev??k', '1', '31', '0');
INSERT INTO `0_chart_types` VALUES ('32', 'K??vetel??sek kapcsolt v??llakoz??ssal szemben', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('321', 'K??vetel??sek', '1', '32', '0');
INSERT INTO `0_chart_types` VALUES ('325', 'Jegyzett de be nem fizetett t??ke', '1', '32', '0');
INSERT INTO `0_chart_types` VALUES ('329', 'K??vetel??sek ??rt??kveszt??se', '1', '32', '0');
INSERT INTO `0_chart_types` VALUES ('33', 'K??vetel??sek egy??b r??szesed??si viszonyban l??v?? v??llal', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('331', 'K??vetel??sek egy??b r??szesed??si viszonyban l??v?? v??llal', '1', '33', '0');
INSERT INTO `0_chart_types` VALUES ('332', 'Jegyzett, de m??g be nem fizetett t??ke egy??b r??szesed??si', '1', '33', '0');
INSERT INTO `0_chart_types` VALUES ('339', 'Egy??b r??szesed??si viszonyban l??v?? v??llakoz??ssal szemb', '1', '33', '0');
INSERT INTO `0_chart_types` VALUES ('34', 'V??lt??k??vetel??sek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('35', 'Adott el??legek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('36', 'Egy??b k??vetel??sek', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('366', 'R??vid lej??ratra adott p??nzk??lcs??n??k', '1', '36', '0');
INSERT INTO `0_chart_types` VALUES ('37', '??rt??kpapirok', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('38', 'P??nzeszk??z??k', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('381', 'P??nzt??rak', '1', '38', '0');
INSERT INTO `0_chart_types` VALUES ('382', 'Valutap??nzt??rak', '1', '38', '0');
INSERT INTO `0_chart_types` VALUES ('384', 'Elsz??mol??si bet??tsz??ml??k (Ft)', '1', '38', '0');
INSERT INTO `0_chart_types` VALUES ('386', 'Deviza bet??tsz??ml??k', '1', '38', '0');
INSERT INTO `0_chart_types` VALUES ('389', '??tvezet??si sz??ml??k', '1', '38', '0');
INSERT INTO `0_chart_types` VALUES ('39', 'Aktiv id??beli elhat??rol??sok', '1', '', '0');
INSERT INTO `0_chart_types` VALUES ('41', 'Saj??t t??ke', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('42', 'C??ltartal??kok', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('43', 'H??trasorolt k??telezetts??gek', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('44', 'Hossz?? lej??rat?? k??telezetts??gek', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('442', 'Hossz?? lej??ratra kapott k??lcs??n??k', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('443', 'Beruh??z??si fejleszt??si hitelek', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('444', 'Egy??b hossz?? lej??rat?? hitelek', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('446', 'Tart??s k??telezetts??g kapcsolt v??llalkoz??ssal szemben', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('447', 'Tart??s k??telezetts??g egy??b v??llalkoz??ssal szemben', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('449', 'Egy??b hossz?? lej??rat?? k??telezetts??g', '2', '44', '0');
INSERT INTO `0_chart_types` VALUES ('45', 'R??vid lej??rat?? k??telezetts??gek', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('451', 'Vev??kt??l kapott el??legek', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('452', 'R??vid lej??rat?? k??lcs??n??k', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('453', 'R??vid lej??rat?? hitelek', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('454', 'K??telezetts??gek ??rusz??ll??t??sb??l ??s szolg??ltat??s ny', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('455', 'P??nz??gyi l??zing miatti k??telezetts??g', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('456', 'R??vid lej??rat?? k??telezetts??g kapcsolt v??llalkoz??ssal ', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('457', 'R??vid lej??rat?? k??telezetts??g egy??b v??llakoz??ssal sze', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('459', 'Egy??b r??vid lej??rat?? k??telezetts??g', '2', '45', '0');
INSERT INTO `0_chart_types` VALUES ('46', 'Ad??hat??s??ggal szembeni k??telezetts??gek', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('461', 'T??rsas??gi ad?? elsz??mol??sa', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('462', 'SZJA elsz??mol??s', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('463', 'K??lts??gvet??si befizet??si k??telezetts??g', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('464', 'K??lts??gvet??si befizet??si k??telezetts??g teljesit??se', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('465', 'VPOP elsz??mol??si sz??mla', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('466', 'El??zetesen felsz??m??tottt ??FA', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('467', 'Fizetend?? ??FA', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('469', 'Helyi ad??k elsz??mol??si sz??mla', '2', '46', '0');
INSERT INTO `0_chart_types` VALUES ('47', 'Egy??b k??telezetts??gek', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('471', 'J??vedelem elsz??mol??si sz??mla', '2', '47', '0');
INSERT INTO `0_chart_types` VALUES ('472', 'Fel nem vett j??rand??s??g', '2', '47', '0');
INSERT INTO `0_chart_types` VALUES ('473', 'Nyugd??j- ??s eg??szs??gbiztos??t??s', '2', '47', '0');
INSERT INTO `0_chart_types` VALUES ('4731', 'Nyugd??jbiztos??t??si Alap', '2', '473', '0');
INSERT INTO `0_chart_types` VALUES ('4732', 'Eg??szs??gbiztos??t??si Alap', '2', '473', '0');
INSERT INTO `0_chart_types` VALUES ('4733', 'Mag??nnyugd??jp??nzt??r', '2', '473', '0');
INSERT INTO `0_chart_types` VALUES ('478', 'Osztal??kelsz??mol??si sz??mla', '2', '47', '0');
INSERT INTO `0_chart_types` VALUES ('479', 'Egy??b r??vid lej??rat?? k??telezetts??g', '2', '47', '0');
INSERT INTO `0_chart_types` VALUES ('48', 'Passz??v id??beli elhat??rol??sok', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('49', '??vi m??rlegsz??ml??k', '2', '', '0');
INSERT INTO `0_chart_types` VALUES ('51', 'Anyagjelleg?? k??lts??gek', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('52', 'Ig??nybevett szolg??ltat??sok k??lts??gei', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('521', 'Sz??ll??t??si, rakod??si k??lts??g', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('522', 'B??rleti d??jak', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('524', 'Utaz??si ??s sz??ll??s k??lts??g', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('525', 'Hirdet??s ??s rekl??m k??lts??g', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('526', 'Oktat??s, tov??bbk??pz??s k??lts??ge', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('527', 'Posta k??lts??g', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('528', 'Kommunik??ci??s k??lts??gek', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('529', 'Egy??b ig??nybevett szolg??ltat??sok', '4', '52', '0');
INSERT INTO `0_chart_types` VALUES ('53', 'Egy??b szolg??ltat??sok k??lts??gei', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('531', 'Hat??s??gi, igazgat??si, szolg. illet??k', '4', '53', '0');
INSERT INTO `0_chart_types` VALUES ('532', 'Bankk??lts??g', '4', '53', '0');
INSERT INTO `0_chart_types` VALUES ('533', 'Biztos??t??si d??jak', '4', '53', '0');
INSERT INTO `0_chart_types` VALUES ('539', 'Egy??b szolg??ltat??sok ', '4', '53', '0');
INSERT INTO `0_chart_types` VALUES ('54', 'B??rk??lts??g', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('55', 'Szem??lyi jelleg?? egy??b kifizet??s', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('56', 'B??rj??rul??kok', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('561', 'Nyugd??j ??s eg??szs??gbiztos??t??s', '4', '56', '0');
INSERT INTO `0_chart_types` VALUES ('562', 'EHO', '4', '56', '0');
INSERT INTO `0_chart_types` VALUES ('57', '??rt??kcs??kken??si leir??s', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('81', 'Anyagjelleg?? r??fordit??sok', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('86', 'Egy??b r??fordit??sok', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('861', '??rt??kesitett eszk??z??k nyilv??ntart??si ??rt??ke', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('863', 'Egy??b eredm??nyt cs??kkent?? t??telek', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('864', 'C??ltartal??k k??pz??se', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('865', '??rt??kveszt??s, terven fel??li ??rt??kcs??kken??s', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('866', '??nkorm??nyzatokkal elsz??molt ad??k, illet??kek', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('868', '??llami k??lts??gvet??ssel elsz??molt ad??k', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('869', 'K??l??nf??le egy??b r??fordit??sok', '4', '86', '0');
INSERT INTO `0_chart_types` VALUES ('87', 'P??nz??gyi m??veletek r??fordit??sai', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('874', 'Fizetend?? kamatok ??s kamatjelleg?? r??fordit??sok', '4', '87', '0');
INSERT INTO `0_chart_types` VALUES ('876', '??tv??lt??skori ??s ??rt??kesit??skori ??rfolyamvesztes??gek', '4', '87', '0');
INSERT INTO `0_chart_types` VALUES ('879', 'Egy??b p??nz??gyi r??fordit??sok', '4', '87', '0');
INSERT INTO `0_chart_types` VALUES ('88', 'Rendkiv??li r??fordit??sok', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('881', 'T??rit??s n??lk??l ??tadott eszk??z??k nyilv??ntart??si ??rt', '4', '88', '0');
INSERT INTO `0_chart_types` VALUES ('89', 'Nyeres??get terhel?? ad??k', '4', '', '0');
INSERT INTO `0_chart_types` VALUES ('91', '??rt??kesit??s ??rbev??tele', '3', '', '0');
INSERT INTO `0_chart_types` VALUES ('911', 'Belf??ldi ??rt??kesit??s ??rbev??tele', '3', '91', '0');
INSERT INTO `0_chart_types` VALUES ('93', 'Export ??rt??kesit??s ??rbev??tele', '3', '', '0');
INSERT INTO `0_chart_types` VALUES ('931', 'Export ??rt??kesit??s ??rbev??tele', '3', '93', '0');
INSERT INTO `0_chart_types` VALUES ('96', 'Egy??b bev??telek', '3', '', '0');
INSERT INTO `0_chart_types` VALUES ('961', '??rt??kesitett eszk??z??k bev??tele', '3', '96', '0');
INSERT INTO `0_chart_types` VALUES ('963', 'Egy??b eredm??nyt n??vel?? t??telek', '3', '96', '0');
INSERT INTO `0_chart_types` VALUES ('964', 'C??ltartal??k k??pz??se', '3', '96', '0');
INSERT INTO `0_chart_types` VALUES ('965', '', '3', '96', '0');
INSERT INTO `0_chart_types` VALUES ('969', 'K??l??nf??le egy??b bev??telek', '3', '96', '0');
INSERT INTO `0_chart_types` VALUES ('97', 'P??nz??gyi bev??telek', '3', '', '0');
INSERT INTO `0_chart_types` VALUES ('974', 'Kapott kamatok ??s kamatjelleg?? r??fordit??sok', '3', '97', '0');
INSERT INTO `0_chart_types` VALUES ('976', '??tv??lt??skori ??s ??rt??kesit??skori ??rfolyamnyeres??g', '3', '97', '0');
INSERT INTO `0_chart_types` VALUES ('979', 'Egy??b p??nz??gyi bev??telek', '3', '97', '0');
INSERT INTO `0_chart_types` VALUES ('98', 'Rendkiv??li bev??telek', '3', '', '0');


### Structure of table `0_comments` ###

DROP TABLE IF EXISTS `0_comments`;

CREATE TABLE `0_comments` (
  `type` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL default '0',
  `date_` date default '0000-00-00',
  `memo_` tinytext,
  KEY `type_and_id` (`type`,`id`)
) ENGINE=InnoDB  ;


### Data of table `0_comments` ###



### Structure of table `0_credit_status` ###

DROP TABLE IF EXISTS `0_credit_status`;

CREATE TABLE `0_credit_status` (
  `id` int(11) NOT NULL auto_increment,
  `reason_description` char(100) NOT NULL default '',
  `dissallow_invoices` tinyint(1) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `reason_description` (`reason_description`)
) ENGINE=MyISAM AUTO_INCREMENT=5  ;


### Data of table `0_credit_status` ###

INSERT INTO `0_credit_status` VALUES ('1', 'Good History', '0', '0');
INSERT INTO `0_credit_status` VALUES ('3', 'No more work until payment received', '1', '0');
INSERT INTO `0_credit_status` VALUES ('4', 'In liquidation', '1', '0');


### Structure of table `0_crm_categories` ###

DROP TABLE IF EXISTS `0_crm_categories`;

CREATE TABLE `0_crm_categories` (
  `id` int(11) NOT NULL auto_increment COMMENT 'pure technical key',
  `type` varchar(20) NOT NULL COMMENT 'contact type e.g. customer',
  `action` varchar(20) NOT NULL COMMENT 'detailed usage e.g. department',
  `name` varchar(30) NOT NULL COMMENT 'for category selector',
  `description` tinytext NOT NULL COMMENT 'usage description',
  `system` tinyint(1) NOT NULL default '0' COMMENT 'nonzero for core system usage',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type` (`type`,`action`),
  UNIQUE KEY `type_2` (`type`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13  ;


### Data of table `0_crm_categories` ###

INSERT INTO `0_crm_categories` VALUES ('1', 'cust_branch', 'general', 'General', 'General contact data for customer branch (overrides company setting)', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('2', 'cust_branch', 'invoice', 'Invoices', 'Invoice posting (overrides company setting)', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('3', 'cust_branch', 'order', 'Orders', 'Order confirmation (overrides company setting)', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('4', 'cust_branch', 'delivery', 'Deliveries', 'Delivery coordination (overrides company setting)', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('5', 'customer', 'general', 'General', 'General contact data for customer', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('6', 'customer', 'order', 'Orders', 'Order confirmation', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('7', 'customer', 'delivery', 'Deliveries', 'Delivery coordination', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('8', 'customer', 'invoice', 'Invoices', 'Invoice posting', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('9', 'supplier', 'general', 'General', 'General contact data for supplier', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('10', 'supplier', 'order', 'Orders', 'Order confirmation', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('11', 'supplier', 'delivery', 'Deliveries', 'Delivery coordination', '1', '0');
INSERT INTO `0_crm_categories` VALUES ('12', 'supplier', 'invoice', 'Invoices', 'Invoice posting', '1', '0');


### Structure of table `0_crm_contacts` ###

DROP TABLE IF EXISTS `0_crm_contacts`;

CREATE TABLE `0_crm_contacts` (
  `id` int(11) NOT NULL auto_increment,
  `person_id` int(11) NOT NULL default '0' COMMENT 'foreign key to crm_contacts',
  `type` varchar(20) NOT NULL COMMENT 'foreign key to crm_categories',
  `action` varchar(20) NOT NULL COMMENT 'foreign key to crm_categories',
  `entity_id` varchar(11) default NULL COMMENT 'entity id in related class table',
  PRIMARY KEY  (`id`),
  KEY `type` (`type`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=7  ;


### Data of table `0_crm_contacts` ###

INSERT INTO `0_crm_contacts` VALUES ('1', '1', 'customer', 'general', '1');
INSERT INTO `0_crm_contacts` VALUES ('2', '2', 'customer', 'general', '2');
INSERT INTO `0_crm_contacts` VALUES ('3', '3', 'cust_branch', 'general', '1');
INSERT INTO `0_crm_contacts` VALUES ('4', '4', 'cust_branch', 'general', '2');
INSERT INTO `0_crm_contacts` VALUES ('5', '5', 'cust_branch', 'general', '3');
INSERT INTO `0_crm_contacts` VALUES ('6', '6', 'supplier', 'general', '1');


### Structure of table `0_crm_persons` ###

DROP TABLE IF EXISTS `0_crm_persons`;

CREATE TABLE `0_crm_persons` (
  `id` int(11) NOT NULL auto_increment,
  `ref` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `name2` varchar(60) default NULL,
  `address` tinytext,
  `phone` varchar(30) default NULL,
  `phone2` varchar(30) default NULL,
  `fax` varchar(30) default NULL,
  `email` varchar(100) default NULL,
  `lang` char(5) default NULL,
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `ref` (`ref`)
) ENGINE=InnoDB AUTO_INCREMENT=7  ;


### Data of table `0_crm_persons` ###

INSERT INTO `0_crm_persons` VALUES ('1', 'Kiss Anna', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');
INSERT INTO `0_crm_persons` VALUES ('2', 'Kis Vir??g', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');
INSERT INTO `0_crm_persons` VALUES ('3', 'Kis Vir??g', 'Main Branch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');
INSERT INTO `0_crm_persons` VALUES ('4', 'Kis Vir??g', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');
INSERT INTO `0_crm_persons` VALUES ('5', 'Kiss Anna', 'Main Branch', NULL, 'Budapest 1042', NULL, NULL, NULL, NULL, NULL, '', '0');
INSERT INTO `0_crm_persons` VALUES ('6', 'Adoniss', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0');


### Structure of table `0_currencies` ###

DROP TABLE IF EXISTS `0_currencies`;

CREATE TABLE `0_currencies` (
  `currency` varchar(60) NOT NULL default '',
  `curr_abrev` char(3) NOT NULL default '',
  `curr_symbol` varchar(10) NOT NULL default '',
  `country` varchar(100) NOT NULL default '',
  `hundreds_name` varchar(15) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  `auto_update` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`curr_abrev`)
) ENGINE=MyISAM  ;


### Data of table `0_currencies` ###

INSERT INTO `0_currencies` VALUES ('Euro', 'EUR', '?', 'Europe', 'Cents', '0', '1');
INSERT INTO `0_currencies` VALUES ('Pounds', 'GBP', '?', 'England', 'Pence', '0', '1');
INSERT INTO `0_currencies` VALUES ('US Dollars', 'USD', '$', 'United States', 'Cents', '0', '1');
INSERT INTO `0_currencies` VALUES ('Hungarian Forint', 'HUF', 'Ft', 'Magyarorsz??g', 'fill??r', '0', '1');


### Structure of table `0_cust_allocations` ###

DROP TABLE IF EXISTS `0_cust_allocations`;

CREATE TABLE `0_cust_allocations` (
  `id` int(11) NOT NULL auto_increment,
  `amt` double unsigned default NULL,
  `date_alloc` date NOT NULL default '0000-00-00',
  `trans_no_from` int(11) default NULL,
  `trans_type_from` int(11) default NULL,
  `trans_no_to` int(11) default NULL,
  `trans_type_to` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB  ;


### Data of table `0_cust_allocations` ###



### Structure of table `0_cust_branch` ###

DROP TABLE IF EXISTS `0_cust_branch`;

CREATE TABLE `0_cust_branch` (
  `branch_code` int(11) NOT NULL auto_increment,
  `debtor_no` int(11) NOT NULL default '0',
  `br_name` varchar(60) NOT NULL default '',
  `br_address` tinytext NOT NULL,
  `area` int(11) default NULL,
  `salesman` int(11) NOT NULL default '0',
  `contact_name` varchar(60) NOT NULL default '',
  `default_location` varchar(5) NOT NULL default '',
  `tax_group_id` int(11) default NULL,
  `sales_account` varchar(15) NOT NULL default '',
  `sales_discount_account` varchar(15) NOT NULL default '',
  `receivables_account` varchar(15) NOT NULL default '',
  `payment_discount_account` varchar(15) NOT NULL default '',
  `default_ship_via` int(11) NOT NULL default '1',
  `disable_trans` tinyint(4) NOT NULL default '0',
  `br_post_address` tinytext NOT NULL,
  `group_no` int(11) NOT NULL default '0',
  `notes` tinytext,
  `inactive` tinyint(1) NOT NULL default '0',
  `branch_ref` varchar(30) NOT NULL,
  PRIMARY KEY  (`branch_code`,`debtor_no`),
  KEY `branch_code` (`branch_code`),
  KEY `branch_ref` (`branch_ref`),
  KEY `group_no` (`group_no`)
) ENGINE=MyISAM AUTO_INCREMENT=4  ;


### Data of table `0_cust_branch` ###

INSERT INTO `0_cust_branch` VALUES ('1', '2', 'Kis Vir??g', '', '1', '1', 'Main Branch', 'DEF', '2', '9111', '9111', '3111', '9111', '1', '0', '', '0', NULL, '0', 'Kis Vir??g');
INSERT INTO `0_cust_branch` VALUES ('2', '2', 'Kis Vir??g', '', '1', '1', '', 'DEF', '3', '9111', '9111', '3111', '9111', '1', '0', '', '0', NULL, '0', 'Kis Vir??g');
INSERT INTO `0_cust_branch` VALUES ('3', '1', 'Kiss Anna', 'Budapest 1042', '1', '1', 'Main Branch', 'DEF', '3', '', '9111', '3111', '9111', '1', '0', 'Budapest 1042', '0', NULL, '0', 'Kiss Anna');


### Structure of table `0_debtor_trans` ###

DROP TABLE IF EXISTS `0_debtor_trans`;

CREATE TABLE `0_debtor_trans` (
  `trans_no` int(11) unsigned NOT NULL default '0',
  `type` smallint(6) unsigned NOT NULL default '0',
  `version` tinyint(1) unsigned NOT NULL default '0',
  `debtor_no` int(11) unsigned default NULL,
  `branch_code` int(11) NOT NULL default '-1',
  `tran_date` date NOT NULL default '0000-00-00',
  `due_date` date NOT NULL default '0000-00-00',
  `reference` varchar(60) NOT NULL default '',
  `tpe` int(11) NOT NULL default '0',
  `order_` int(11) NOT NULL default '0',
  `ov_amount` double NOT NULL default '0',
  `ov_gst` double NOT NULL default '0',
  `ov_freight` double NOT NULL default '0',
  `ov_freight_tax` double NOT NULL default '0',
  `ov_discount` double NOT NULL default '0',
  `alloc` double NOT NULL default '0',
  `rate` double NOT NULL default '1',
  `ship_via` int(11) default NULL,
  `dimension_id` int(11) NOT NULL default '0',
  `dimension2_id` int(11) NOT NULL default '0',
  `payment_terms` int(11) default NULL,
  PRIMARY KEY  (`type`,`trans_no`),
  KEY `debtor_no` (`debtor_no`,`branch_code`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB  ;


### Data of table `0_debtor_trans` ###



### Structure of table `0_debtor_trans_details` ###

DROP TABLE IF EXISTS `0_debtor_trans_details`;

CREATE TABLE `0_debtor_trans_details` (
  `id` int(11) NOT NULL auto_increment,
  `debtor_trans_no` int(11) default NULL,
  `debtor_trans_type` int(11) default NULL,
  `stock_id` varchar(20) NOT NULL default '',
  `description` tinytext,
  `unit_price` double NOT NULL default '0',
  `unit_tax` double NOT NULL default '0',
  `quantity` double NOT NULL default '0',
  `discount_percent` double NOT NULL default '0',
  `standard_cost` double NOT NULL default '0',
  `qty_done` double NOT NULL default '0',
  `src_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `Transaction` (`debtor_trans_type`,`debtor_trans_no`),
  KEY `src_id` (`src_id`)
) ENGINE=InnoDB  ;


### Data of table `0_debtor_trans_details` ###



### Structure of table `0_debtors_master` ###

DROP TABLE IF EXISTS `0_debtors_master`;

CREATE TABLE `0_debtors_master` (
  `debtor_no` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `address` tinytext,
  `tax_id` varchar(55) NOT NULL default '',
  `curr_code` char(3) NOT NULL default '',
  `sales_type` int(11) NOT NULL default '1',
  `dimension_id` int(11) NOT NULL default '0',
  `dimension2_id` int(11) NOT NULL default '0',
  `credit_status` int(11) NOT NULL default '0',
  `payment_terms` int(11) default NULL,
  `discount` double NOT NULL default '0',
  `pymt_discount` double NOT NULL default '0',
  `credit_limit` float NOT NULL default '1000',
  `notes` tinytext,
  `inactive` tinyint(1) NOT NULL default '0',
  `debtor_ref` varchar(30) NOT NULL,
  PRIMARY KEY  (`debtor_no`),
  KEY `name` (`name`),
  UNIQUE KEY `debtor_ref` (`debtor_ref`)
) ENGINE=MyISAM AUTO_INCREMENT=3  ;


### Data of table `0_debtors_master` ###

INSERT INTO `0_debtors_master` VALUES ('1', 'Kiss Anna', 'Budapest 1042', '', 'HUF', '1', '0', '0', '1', '4', '0', '0', '1000', NULL, '0', 'Kiss Anna');
INSERT INTO `0_debtors_master` VALUES ('2', 'Kis Vir??g', NULL, '', 'HUF', '1', '0', '0', '1', '4', '0', '0', '1000', NULL, '0', 'Kis Vir??g');


### Structure of table `0_dimensions` ###

DROP TABLE IF EXISTS `0_dimensions`;

CREATE TABLE `0_dimensions` (
  `id` int(11) NOT NULL auto_increment,
  `reference` varchar(60) NOT NULL default '',
  `name` varchar(60) NOT NULL default '',
  `type_` tinyint(1) NOT NULL default '1',
  `closed` tinyint(1) NOT NULL default '0',
  `date_` date NOT NULL default '0000-00-00',
  `due_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `date_` (`date_`),
  KEY `due_date` (`due_date`),
  KEY `type_` (`type_`)
) ENGINE=InnoDB  ;


### Data of table `0_dimensions` ###



### Structure of table `0_exchange_rates` ###

DROP TABLE IF EXISTS `0_exchange_rates`;

CREATE TABLE `0_exchange_rates` (
  `id` int(11) NOT NULL auto_increment,
  `curr_code` char(3) NOT NULL default '',
  `rate_buy` double NOT NULL default '0',
  `rate_sell` double NOT NULL default '0',
  `date_` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `curr_code` (`curr_code`,`date_`)
) ENGINE=MyISAM  ;


### Data of table `0_exchange_rates` ###



### Structure of table `0_fiscal_year` ###

DROP TABLE IF EXISTS `0_fiscal_year`;

CREATE TABLE `0_fiscal_year` (
  `id` int(11) NOT NULL auto_increment,
  `begin` date default '0000-00-00',
  `end` date default '0000-00-00',
  `closed` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `begin` (`begin`),
  UNIQUE KEY `end` (`end`)
) ENGINE=InnoDB AUTO_INCREMENT=2  ;


### Data of table `0_fiscal_year` ###

INSERT INTO `0_fiscal_year` VALUES ('1', '2008-01-01', '2008-12-31', '0');


### Structure of table `0_gl_trans` ###

DROP TABLE IF EXISTS `0_gl_trans`;

CREATE TABLE `0_gl_trans` (
  `counter` int(11) NOT NULL auto_increment,
  `type` smallint(6) NOT NULL default '0',
  `type_no` bigint(16) NOT NULL default '1',
  `tran_date` date NOT NULL default '0000-00-00',
  `account` varchar(15) NOT NULL default '',
  `memo_` tinytext NOT NULL,
  `amount` double NOT NULL default '0',
  `dimension_id` int(11) NOT NULL default '0',
  `dimension2_id` int(11) NOT NULL default '0',
  `person_type_id` int(11) default NULL,
  `person_id` tinyblob,
  PRIMARY KEY  (`counter`),
  KEY `Type_and_Number` (`type`,`type_no`),
  KEY `dimension_id` (`dimension_id`),
  KEY `dimension2_id` (`dimension2_id`),
  KEY `tran_date` (`tran_date`),
  KEY `account_and_tran_date` (`account`,`tran_date`)
) ENGINE=InnoDB  ;


### Data of table `0_gl_trans` ###



### Structure of table `0_grn_batch` ###

DROP TABLE IF EXISTS `0_grn_batch`;

CREATE TABLE `0_grn_batch` (
  `id` int(11) NOT NULL auto_increment,
  `supplier_id` int(11) NOT NULL default '0',
  `purch_order_no` int(11) default NULL,
  `reference` varchar(60) NOT NULL default '',
  `delivery_date` date NOT NULL default '0000-00-00',
  `loc_code` varchar(5) default NULL,
  PRIMARY KEY  (`id`),
  KEY `delivery_date` (`delivery_date`),
  KEY `purch_order_no` (`purch_order_no`)
) ENGINE=InnoDB  ;


### Data of table `0_grn_batch` ###



### Structure of table `0_grn_items` ###

DROP TABLE IF EXISTS `0_grn_items`;

CREATE TABLE `0_grn_items` (
  `id` int(11) NOT NULL auto_increment,
  `grn_batch_id` int(11) default NULL,
  `po_detail_item` int(11) NOT NULL default '0',
  `item_code` varchar(20) NOT NULL default '',
  `description` tinytext,
  `qty_recd` double NOT NULL default '0',
  `quantity_inv` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `grn_batch_id` (`grn_batch_id`)
) ENGINE=InnoDB  ;


### Data of table `0_grn_items` ###



### Structure of table `0_groups` ###

DROP TABLE IF EXISTS `0_groups`;

CREATE TABLE `0_groups` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `description` varchar(60) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=4  ;


### Data of table `0_groups` ###

INSERT INTO `0_groups` VALUES ('1', 'Small', '0');
INSERT INTO `0_groups` VALUES ('2', 'Medium', '0');
INSERT INTO `0_groups` VALUES ('3', 'Large', '0');


### Structure of table `0_item_codes` ###

DROP TABLE IF EXISTS `0_item_codes`;

CREATE TABLE `0_item_codes` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `item_code` varchar(20) NOT NULL,
  `stock_id` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL default '',
  `category_id` smallint(6) unsigned NOT NULL,
  `quantity` double NOT NULL default '1',
  `is_foreign` tinyint(1) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `stock_id` (`stock_id`,`item_code`),
  KEY `item_code` (`item_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_item_codes` ###

INSERT INTO `0_item_codes` VALUES ('1', '1', '1', 'K??k pap??r', '1', '1', '0', '0');


### Structure of table `0_item_tax_type_exemptions` ###

DROP TABLE IF EXISTS `0_item_tax_type_exemptions`;

CREATE TABLE `0_item_tax_type_exemptions` (
  `item_tax_type_id` int(11) NOT NULL default '0',
  `tax_type_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`item_tax_type_id`,`tax_type_id`)
) ENGINE=InnoDB  ;


### Data of table `0_item_tax_type_exemptions` ###

INSERT INTO `0_item_tax_type_exemptions` VALUES ('2', '1');
INSERT INTO `0_item_tax_type_exemptions` VALUES ('3', '1');
INSERT INTO `0_item_tax_type_exemptions` VALUES ('4', '1');
INSERT INTO `0_item_tax_type_exemptions` VALUES ('5', '1');


### Structure of table `0_item_tax_types` ###

DROP TABLE IF EXISTS `0_item_tax_types`;

CREATE TABLE `0_item_tax_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `exempt` tinyint(1) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6  ;


### Data of table `0_item_tax_types` ###

INSERT INTO `0_item_tax_types` VALUES ('1', 'Fizetend?? ??famentes 0%', '1', '0');
INSERT INTO `0_item_tax_types` VALUES ('2', 'El??zetesen felsz??m??tott EU 20%', '0', '0');
INSERT INTO `0_item_tax_types` VALUES ('3', 'El??zetesen felsz??m??tott 20%', '0', '0');
INSERT INTO `0_item_tax_types` VALUES ('4', 'Fizetend?? 20%', '0', '0');
INSERT INTO `0_item_tax_types` VALUES ('5', 'El??zetesen felsz??m??tott BFOR20', '0', '0');


### Structure of table `0_item_units` ###

DROP TABLE IF EXISTS `0_item_units`;

CREATE TABLE `0_item_units` (
  `abbr` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `decimals` tinyint(2) NOT NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`abbr`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  ;


### Data of table `0_item_units` ###

INSERT INTO `0_item_units` VALUES ('ea.', 'Each', '0', '0');
INSERT INTO `0_item_units` VALUES ('db/pc', 'darab', '0', '0');


### Structure of table `0_loc_stock` ###

DROP TABLE IF EXISTS `0_loc_stock`;

CREATE TABLE `0_loc_stock` (
  `loc_code` char(5) NOT NULL default '',
  `stock_id` char(20) NOT NULL default '',
  `reorder_level` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`loc_code`,`stock_id`),
  KEY `stock_id` (`stock_id`)
) ENGINE=InnoDB  ;


### Data of table `0_loc_stock` ###

INSERT INTO `0_loc_stock` VALUES ('DEF', '1', '0');


### Structure of table `0_locations` ###

DROP TABLE IF EXISTS `0_locations`;

CREATE TABLE `0_locations` (
  `loc_code` varchar(5) NOT NULL default '',
  `location_name` varchar(60) NOT NULL default '',
  `delivery_address` tinytext NOT NULL,
  `phone` varchar(30) NOT NULL default '',
  `phone2` varchar(30) NOT NULL default '',
  `fax` varchar(30) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `contact` varchar(30) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`loc_code`)
) ENGINE=MyISAM  ;


### Data of table `0_locations` ###

INSERT INTO `0_locations` VALUES ('DEF', 'Default', 'N/A', '', '', '', '', '', '0');


### Structure of table `0_movement_types` ###

DROP TABLE IF EXISTS `0_movement_types`;

CREATE TABLE `0_movement_types` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_movement_types` ###

INSERT INTO `0_movement_types` VALUES ('1', 'Adjustment', '0');


### Structure of table `0_payment_terms` ###

DROP TABLE IF EXISTS `0_payment_terms`;

CREATE TABLE `0_payment_terms` (
  `terms_indicator` int(11) NOT NULL auto_increment,
  `terms` char(80) NOT NULL default '',
  `days_before_due` smallint(6) NOT NULL default '0',
  `day_in_following_month` smallint(6) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`terms_indicator`),
  UNIQUE KEY `terms` (`terms`)
) ENGINE=MyISAM AUTO_INCREMENT=5  ;


### Data of table `0_payment_terms` ###

INSERT INTO `0_payment_terms` VALUES ('1', 'Due 15th Of the Following Month', '0', '17', '0');
INSERT INTO `0_payment_terms` VALUES ('2', 'Due By End Of The Following Month', '0', '30', '0');
INSERT INTO `0_payment_terms` VALUES ('3', 'Payment due within 10 days', '10', '0', '0');
INSERT INTO `0_payment_terms` VALUES ('4', 'Cash Only', '1', '0', '0');


### Structure of table `0_prices` ###

DROP TABLE IF EXISTS `0_prices`;

CREATE TABLE `0_prices` (
  `id` int(11) NOT NULL auto_increment,
  `stock_id` varchar(20) NOT NULL default '',
  `sales_type_id` int(11) NOT NULL default '0',
  `curr_abrev` char(3) NOT NULL default '',
  `price` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `price` (`stock_id`,`sales_type_id`,`curr_abrev`)
) ENGINE=MyISAM AUTO_INCREMENT=3  ;


### Data of table `0_prices` ###

INSERT INTO `0_prices` VALUES ('1', '1', '1', 'HUF', '0');
INSERT INTO `0_prices` VALUES ('2', '1', '1', 'EUR', '0');


### Structure of table `0_print_profiles` ###

DROP TABLE IF EXISTS `0_print_profiles`;

CREATE TABLE `0_print_profiles` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `profile` varchar(30) NOT NULL,
  `report` varchar(5) default NULL,
  `printer` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `profile` (`profile`,`report`)
) ENGINE=MyISAM AUTO_INCREMENT=10  ;


### Data of table `0_print_profiles` ###

INSERT INTO `0_print_profiles` VALUES ('1', 'Out of office', NULL, '0');
INSERT INTO `0_print_profiles` VALUES ('2', 'Sales Department', NULL, '0');
INSERT INTO `0_print_profiles` VALUES ('3', 'Central', NULL, '2');
INSERT INTO `0_print_profiles` VALUES ('4', 'Sales Department', '104', '2');
INSERT INTO `0_print_profiles` VALUES ('5', 'Sales Department', '105', '2');
INSERT INTO `0_print_profiles` VALUES ('6', 'Sales Department', '107', '2');
INSERT INTO `0_print_profiles` VALUES ('7', 'Sales Department', '109', '2');
INSERT INTO `0_print_profiles` VALUES ('8', 'Sales Department', '110', '2');
INSERT INTO `0_print_profiles` VALUES ('9', 'Sales Department', '201', '2');


### Structure of table `0_printers` ###

DROP TABLE IF EXISTS `0_printers`;

CREATE TABLE `0_printers` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `description` varchar(60) NOT NULL,
  `queue` varchar(20) NOT NULL,
  `host` varchar(40) NOT NULL,
  `port` smallint(11) unsigned NOT NULL,
  `timeout` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4  ;


### Data of table `0_printers` ###

INSERT INTO `0_printers` VALUES ('1', 'QL500', 'Label printer', 'QL500', 'server', '127', '20');
INSERT INTO `0_printers` VALUES ('2', 'Samsung', 'Main network printer', 'scx4521F', 'server', '515', '5');
INSERT INTO `0_printers` VALUES ('3', 'Local', 'Local print server at user IP', 'lp', '', '515', '10');


### Structure of table `0_purch_data` ###

DROP TABLE IF EXISTS `0_purch_data`;

CREATE TABLE `0_purch_data` (
  `supplier_id` int(11) NOT NULL default '0',
  `stock_id` char(20) NOT NULL default '',
  `price` double NOT NULL default '0',
  `suppliers_uom` char(50) NOT NULL default '',
  `conversion_factor` double NOT NULL default '1',
  `supplier_description` char(50) NOT NULL default '',
  PRIMARY KEY  (`supplier_id`,`stock_id`)
) ENGINE=MyISAM  ;


### Data of table `0_purch_data` ###



### Structure of table `0_purch_order_details` ###

DROP TABLE IF EXISTS `0_purch_order_details`;

CREATE TABLE `0_purch_order_details` (
  `po_detail_item` int(11) NOT NULL auto_increment,
  `order_no` int(11) NOT NULL default '0',
  `item_code` varchar(20) NOT NULL default '',
  `description` tinytext,
  `delivery_date` date NOT NULL default '0000-00-00',
  `qty_invoiced` double NOT NULL default '0',
  `unit_price` double NOT NULL default '0',
  `act_price` double NOT NULL default '0',
  `std_cost_unit` double NOT NULL default '0',
  `quantity_ordered` double NOT NULL default '0',
  `quantity_received` double NOT NULL default '0',
  PRIMARY KEY  (`po_detail_item`),
  KEY `order` (`order_no`,`po_detail_item`)
) ENGINE=InnoDB  ;


### Data of table `0_purch_order_details` ###



### Structure of table `0_purch_orders` ###

DROP TABLE IF EXISTS `0_purch_orders`;

CREATE TABLE `0_purch_orders` (
  `order_no` int(11) NOT NULL auto_increment,
  `supplier_id` int(11) NOT NULL default '0',
  `comments` tinytext,
  `ord_date` date NOT NULL default '0000-00-00',
  `reference` tinytext NOT NULL,
  `requisition_no` tinytext,
  `into_stock_location` varchar(5) NOT NULL default '',
  `delivery_address` tinytext NOT NULL,
  `total` double NOT NULL default '0',
  `tax_included` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`order_no`),
  KEY `ord_date` (`ord_date`)
) ENGINE=InnoDB  ;


### Data of table `0_purch_orders` ###



### Structure of table `0_quick_entries` ###

DROP TABLE IF EXISTS `0_quick_entries`;

CREATE TABLE `0_quick_entries` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL default '0',
  `description` varchar(60) NOT NULL,
  `base_amount` double NOT NULL default '0',
  `base_desc` varchar(60) default NULL,
  `bal_type` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=4  ;


### Data of table `0_quick_entries` ###



### Structure of table `0_quick_entry_lines` ###

DROP TABLE IF EXISTS `0_quick_entry_lines`;

CREATE TABLE `0_quick_entry_lines` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `qid` smallint(6) unsigned NOT NULL,
  `amount` double default '0',
  `action` varchar(2) NOT NULL,
  `dest_id` varchar(15) NOT NULL default '',
  `dimension_id` smallint(6) unsigned default NULL,
  `dimension2_id` smallint(6) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `qid` (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=4  ;


### Data of table `0_quick_entry_lines` ###



### Structure of table `0_recurrent_invoices` ###

DROP TABLE IF EXISTS `0_recurrent_invoices`;

CREATE TABLE `0_recurrent_invoices` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `description` varchar(60) NOT NULL default '',
  `order_no` int(11) unsigned NOT NULL,
  `debtor_no` int(11) unsigned default NULL,
  `group_no` smallint(6) unsigned default NULL,
  `days` int(11) NOT NULL default '0',
  `monthly` int(11) NOT NULL default '0',
  `begin` date NOT NULL default '0000-00-00',
  `end` date NOT NULL default '0000-00-00',
  `last_sent` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  ;


### Data of table `0_recurrent_invoices` ###



### Structure of table `0_refs` ###

DROP TABLE IF EXISTS `0_refs`;

CREATE TABLE `0_refs` (
  `id` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  `reference` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`,`type`),
  KEY `Type_and_Reference` (`type`,`reference`)
) ENGINE=InnoDB  ;


### Data of table `0_refs` ###



### Structure of table `0_sales_order_details` ###

DROP TABLE IF EXISTS `0_sales_order_details`;

CREATE TABLE `0_sales_order_details` (
  `id` int(11) NOT NULL auto_increment,
  `order_no` int(11) NOT NULL default '0',
  `trans_type` smallint(6) NOT NULL default '30',
  `stk_code` varchar(20) NOT NULL default '',
  `description` tinytext,
  `qty_sent` double NOT NULL default '0',
  `unit_price` double NOT NULL default '0',
  `quantity` double NOT NULL default '0',
  `discount_percent` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `sorder` (`trans_type`,`order_no`)
) ENGINE=InnoDB  ;


### Data of table `0_sales_order_details` ###



### Structure of table `0_sales_orders` ###

DROP TABLE IF EXISTS `0_sales_orders`;

CREATE TABLE `0_sales_orders` (
  `order_no` int(11) NOT NULL,
  `trans_type` smallint(6) NOT NULL default '30',
  `version` tinyint(1) unsigned NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `debtor_no` int(11) NOT NULL default '0',
  `branch_code` int(11) NOT NULL default '0',
  `reference` varchar(100) NOT NULL default '',
  `customer_ref` tinytext NOT NULL,
  `comments` tinytext,
  `ord_date` date NOT NULL default '0000-00-00',
  `order_type` int(11) NOT NULL default '0',
  `ship_via` int(11) NOT NULL default '0',
  `delivery_address` tinytext NOT NULL,
  `contact_phone` varchar(30) default NULL,
  `contact_email` varchar(100) default NULL,
  `deliver_to` tinytext NOT NULL,
  `freight_cost` double NOT NULL default '0',
  `from_stk_loc` varchar(5) NOT NULL default '',
  `delivery_date` date NOT NULL default '0000-00-00',
  `payment_terms` int(11) default NULL,
  `total` double NOT NULL default '0',
  PRIMARY KEY  (`trans_type`,`order_no`)
) ENGINE=InnoDB  ;


### Data of table `0_sales_orders` ###



### Structure of table `0_sales_pos` ###

DROP TABLE IF EXISTS `0_sales_pos`;

CREATE TABLE `0_sales_pos` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `pos_name` varchar(30) NOT NULL,
  `cash_sale` tinyint(1) NOT NULL,
  `credit_sale` tinyint(1) NOT NULL,
  `pos_location` varchar(5) NOT NULL,
  `pos_account` smallint(6) unsigned NOT NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pos_name` (`pos_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_sales_pos` ###

INSERT INTO `0_sales_pos` VALUES ('1', 'Default', '1', '1', 'DEF', '1', '0');


### Structure of table `0_sales_types` ###

DROP TABLE IF EXISTS `0_sales_types`;

CREATE TABLE `0_sales_types` (
  `id` int(11) NOT NULL auto_increment,
  `sales_type` char(50) NOT NULL default '',
  `tax_included` int(1) NOT NULL default '0',
  `factor` double NOT NULL default '1',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sales_type` (`sales_type`)
) ENGINE=MyISAM AUTO_INCREMENT=3  ;


### Data of table `0_sales_types` ###

INSERT INTO `0_sales_types` VALUES ('1', 'Retail', '0', '1', '0');
INSERT INTO `0_sales_types` VALUES ('2', 'Wholesale', '0', '1', '0');


### Structure of table `0_salesman` ###

DROP TABLE IF EXISTS `0_salesman`;

CREATE TABLE `0_salesman` (
  `salesman_code` int(11) NOT NULL auto_increment,
  `salesman_name` char(60) NOT NULL default '',
  `salesman_phone` char(30) NOT NULL default '',
  `salesman_fax` char(30) NOT NULL default '',
  `salesman_email` varchar(100) NOT NULL default '',
  `provision` double NOT NULL default '0',
  `break_pt` double NOT NULL default '0',
  `provision2` double NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`salesman_code`),
  UNIQUE KEY `salesman_name` (`salesman_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_salesman` ###

INSERT INTO `0_salesman` VALUES ('1', 'Sales Person', '', '', '', '5', '1000', '4', '0');


### Structure of table `0_security_roles` ###

DROP TABLE IF EXISTS `0_security_roles`;

CREATE TABLE `0_security_roles` (
  `id` int(11) NOT NULL auto_increment,
  `role` varchar(30) NOT NULL,
  `description` varchar(50) default NULL,
  `sections` text,
  `areas` text,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=11;


### Data of table `0_security_roles` ###

INSERT INTO `0_security_roles` VALUES(1, 'Inquiries', 'Inquiries', '768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;773;774;2822;3073;3075;3076;3077;3329;3330;3331;3332;3333;3334;3335;5377;5633;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8450;8451;10497;10753;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15622;15623;15624;15625;15626;15873;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(2, 'System Administrator', 'System Administrator', '256;512;768;2816;3072;3328;5376;5632;5888;7936;8192;8448;10496;10752;11008;13056;13312;15616;15872;16128', '257;258;259;260;513;514;515;516;517;518;519;520;521;522;523;524;525;526;769;770;771;772;773;774;2817;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5636;5637;5641;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8195;8196;8197;8449;8450;8451;10497;10753;10754;10755;10756;10757;11009;11010;11011;11012;13057;13313;13314;13315;15617;15618;15619;15620;15621;15622;15623;15624;15628;15625;15626;15627;15873;15874;15875;15876;15877;15878;15879;15880;15883;15881;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(3, 'Salesman', 'Salesman', '768;3072;5632;8192;15872', '773;774;3073;3075;3081;5633;8194;15873', 0);
INSERT INTO `0_security_roles` VALUES(4, 'Stock Manager', 'Stock Manager', '2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15872;16128', '2818;2822;3073;3076;3077;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5889;5890;5891;8193;8194;8450;8451;10753;11009;11010;11012;13313;13315;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(5, 'Production Manager', 'Production Manager', '512;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5640;5640;5889;5890;5891;8193;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(6, 'Purchase Officer', 'Purchase Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;2818;2819;2820;2821;2822;2823;3073;3074;3076;3077;3078;3079;3080;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5377;5633;5635;5640;5640;5889;5890;5891;8193;8194;8196;8197;8449;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(7, 'AR Officer', 'AR Officer', '512;768;2816;3072;3328;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '521;523;524;771;773;774;2818;2819;2820;2821;2822;2823;3073;3073;3074;3075;3076;3077;3078;3079;3080;3081;3081;3329;3330;3330;3330;3331;3331;3332;3333;3334;3335;5633;5633;5634;5637;5638;5639;5640;5640;5889;5890;5891;8193;8194;8194;8196;8197;8450;8451;10753;10755;11009;11010;11012;13313;13315;15617;15619;15620;15621;15624;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(8, 'AP Officer', 'AP Officer', '512;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;769;770;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5635;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15876;15877;15880;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(9, 'Accountant', 'New Accountant', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13313;13315;15617;15618;15619;15620;15621;15624;15873;15876;15877;15878;15880;15882;16129;16130;16131;16132', 0);
INSERT INTO `0_security_roles` VALUES(10, 'Sub Admin', 'Sub Admin', '512;768;2816;3072;3328;5376;5632;5888;8192;8448;10752;11008;13312;15616;15872;16128', '257;258;259;260;521;523;524;771;772;773;774;2818;2819;2820;2821;2822;2823;3073;3074;3082;3075;3076;3077;3078;3079;3080;3081;3329;3330;3331;3332;3333;3334;3335;5377;5633;5634;5635;5637;5638;5639;5640;5889;5890;5891;7937;7938;7939;7940;8193;8194;8196;8197;8449;8450;8451;10497;10753;10755;11009;11010;11012;13057;13313;13315;15617;15619;15620;15621;15624;15873;15874;15876;15877;15878;15879;15880;15882;16129;16130;16131;16132', 0);


### Structure of table `0_shippers` ###

DROP TABLE IF EXISTS `0_shippers`;

CREATE TABLE `0_shippers` (
  `shipper_id` int(11) NOT NULL auto_increment,
  `shipper_name` varchar(60) NOT NULL default '',
  `phone` varchar(30) NOT NULL default '',
  `phone2` varchar(30) NOT NULL default '',
  `contact` tinytext NOT NULL,
  `address` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`shipper_id`),
  UNIQUE KEY `name` (`shipper_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_shippers` ###

INSERT INTO `0_shippers` VALUES ('1', 'Default', '', '', '', '', '0');


### Structure of table `0_sql_trail` ###

DROP TABLE IF EXISTS `0_sql_trail`;

CREATE TABLE `0_sql_trail` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `sql` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  ;


### Data of table `0_sql_trail` ###



### Structure of table `0_stock_category` ###

DROP TABLE IF EXISTS `0_stock_category`;

CREATE TABLE `0_stock_category` (
  `category_id` int(11) NOT NULL auto_increment,
  `description` varchar(60) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  `dflt_tax_type` int(11) NOT NULL default '1',
  `dflt_units` varchar(20) NOT NULL default 'each',
  `dflt_mb_flag` char(1) NOT NULL default 'B',
  `dflt_sales_act` varchar(15) NOT NULL default '',
  `dflt_cogs_act` varchar(15) NOT NULL default '',
  `dflt_inventory_act` varchar(15) NOT NULL default '',
  `dflt_adjustment_act` varchar(15) NOT NULL default '',
  `dflt_assembly_act` varchar(15) NOT NULL default '',
  `dflt_dim1` int(11) default NULL,
  `dflt_dim2` int(11) default NULL,
  `dflt_no_sale` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`category_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=MyISAM AUTO_INCREMENT=5  ;


### Data of table `0_stock_category` ###

INSERT INTO `0_stock_category` VALUES ('1', 'Components', '0', '1', 'each', 'B', '9111', '8140', '2690', '2690', '2690', '0', '0', '0');
INSERT INTO `0_stock_category` VALUES ('2', 'Charges', '0', '1', 'each', 'B', '9111', '8140', '2690', '2690', '2690', '0', '0', '0');
INSERT INTO `0_stock_category` VALUES ('3', 'Systems', '0', '1', 'each', 'B', '9111', '8140', '2690', '2690', '2690', '0', '0', '0');
INSERT INTO `0_stock_category` VALUES ('4', 'Services', '0', '1', 'each', 'B', '9111', '8140', '2690', '2690', '2690', '0', '0', '0');


### Structure of table `0_stock_master` ###

DROP TABLE IF EXISTS `0_stock_master`;

CREATE TABLE `0_stock_master` (
  `stock_id` varchar(20) NOT NULL default '',
  `category_id` int(11) NOT NULL default '0',
  `tax_type_id` int(11) NOT NULL default '0',
  `description` varchar(200) NOT NULL default '',
  `long_description` tinytext NOT NULL,
  `units` varchar(20) NOT NULL default 'each',
  `mb_flag` char(1) NOT NULL default 'B',
  `sales_account` varchar(15) NOT NULL default '',
  `cogs_account` varchar(15) NOT NULL default '',
  `inventory_account` varchar(15) NOT NULL default '',
  `adjustment_account` varchar(15) NOT NULL default '',
  `assembly_account` varchar(15) NOT NULL default '',
  `dimension_id` int(11) default NULL,
  `dimension2_id` int(11) default NULL,
  `actual_cost` double NOT NULL default '0',
  `last_cost` double NOT NULL default '0',
  `material_cost` double NOT NULL default '0',
  `labour_cost` double NOT NULL default '0',
  `overhead_cost` double NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  `no_sale` tinyint(1) NOT NULL default '0',
  `editable` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`stock_id`)
) ENGINE=InnoDB  ;


### Data of table `0_stock_master` ###

INSERT INTO `0_stock_master` VALUES ('1', '1', '3', 'K??k pap??r', '', 'ea.', 'M', '9111', '8140', '2690', '2690', '2690', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');


### Structure of table `0_stock_moves` ###

DROP TABLE IF EXISTS `0_stock_moves`;

CREATE TABLE `0_stock_moves` (
  `trans_id` int(11) NOT NULL auto_increment,
  `trans_no` int(11) NOT NULL default '0',
  `stock_id` char(20) NOT NULL default '',
  `type` smallint(6) NOT NULL default '0',
  `loc_code` char(5) NOT NULL default '',
  `tran_date` date NOT NULL default '0000-00-00',
  `person_id` int(11) default NULL,
  `price` double NOT NULL default '0',
  `reference` char(40) NOT NULL default '',
  `qty` double NOT NULL default '1',
  `discount_percent` double NOT NULL default '0',
  `standard_cost` double NOT NULL default '0',
  `visible` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`trans_id`),
  KEY `type` (`type`,`trans_no`),
  KEY `Move` (`stock_id`,`loc_code`,`tran_date`)
) ENGINE=InnoDB  ;


### Data of table `0_stock_moves` ###



### Structure of table `0_supp_allocations` ###

DROP TABLE IF EXISTS `0_supp_allocations`;

CREATE TABLE `0_supp_allocations` (
  `id` int(11) NOT NULL auto_increment,
  `amt` double unsigned default NULL,
  `date_alloc` date NOT NULL default '0000-00-00',
  `trans_no_from` int(11) default NULL,
  `trans_type_from` int(11) default NULL,
  `trans_no_to` int(11) default NULL,
  `trans_type_to` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `From` (`trans_type_from`,`trans_no_from`),
  KEY `To` (`trans_type_to`,`trans_no_to`)
) ENGINE=InnoDB  ;


### Data of table `0_supp_allocations` ###



### Structure of table `0_supp_invoice_items` ###

DROP TABLE IF EXISTS `0_supp_invoice_items`;

CREATE TABLE `0_supp_invoice_items` (
  `id` int(11) NOT NULL auto_increment,
  `supp_trans_no` int(11) default NULL,
  `supp_trans_type` int(11) default NULL,
  `gl_code` varchar(15) NOT NULL default '',
  `grn_item_id` int(11) default NULL,
  `po_detail_item_id` int(11) default NULL,
  `stock_id` varchar(20) NOT NULL default '',
  `description` tinytext,
  `quantity` double NOT NULL default '0',
  `unit_price` double NOT NULL default '0',
  `unit_tax` double NOT NULL default '0',
  `memo_` tinytext,
  PRIMARY KEY  (`id`),
  KEY `Transaction` (`supp_trans_type`,`supp_trans_no`,`stock_id`)
) ENGINE=InnoDB  ;


### Data of table `0_supp_invoice_items` ###



### Structure of table `0_supp_trans` ###

DROP TABLE IF EXISTS `0_supp_trans`;

CREATE TABLE `0_supp_trans` (
  `trans_no` int(11) unsigned NOT NULL default '0',
  `type` smallint(6) unsigned NOT NULL default '0',
  `supplier_id` int(11) unsigned default NULL,
  `reference` tinytext NOT NULL,
  `supp_reference` varchar(60) NOT NULL default '',
  `tran_date` date NOT NULL default '0000-00-00',
  `due_date` date NOT NULL default '0000-00-00',
  `ov_amount` double NOT NULL default '0',
  `ov_discount` double NOT NULL default '0',
  `ov_gst` double NOT NULL default '0',
  `rate` double NOT NULL default '1',
  `alloc` double NOT NULL default '0',
  `tax_included` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`type`,`trans_no`),
  KEY `supplier_id` (`supplier_id`),
  KEY `SupplierID_2` (`supplier_id`,`supp_reference`),
  KEY `type` (`type`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB  ;


### Data of table `0_supp_trans` ###



### Structure of table `0_suppliers` ###

DROP TABLE IF EXISTS `0_suppliers`;

CREATE TABLE `0_suppliers` (
  `supplier_id` int(11) NOT NULL auto_increment,
  `supp_name` varchar(60) NOT NULL default '',
  `address` tinytext NOT NULL,
  `supp_address` tinytext NOT NULL,
  `gst_no` varchar(25) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `supp_account_no` varchar(40) NOT NULL default '',
  `website` varchar(100) NOT NULL default '',
  `bank_account` varchar(60) NOT NULL default '',
  `curr_code` char(3) default NULL,
  `payment_terms` int(11) default NULL,
  `tax_included` tinyint(1) NOT NULL default '0',
  `dimension_id` int(11) default '0',
  `dimension2_id` int(11) default '0',
  `tax_group_id` int(11) default NULL,
  `credit_limit` double NOT NULL default '0',
  `purchase_account` varchar(15) NOT NULL default '',
  `payable_account` varchar(15) NOT NULL default '',
  `payment_discount_account` varchar(15) NOT NULL default '',
  `notes` tinytext NOT NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  `supp_ref` varchar(30) NOT NULL,
  PRIMARY KEY  (`supplier_id`),
  KEY `supp_ref` (`supp_ref`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_suppliers` ###

INSERT INTO `0_suppliers` VALUES ('1', 'Adoniss', '', '', '', '', '', '', '', 'HUF', '4', '0', '0', '0', '2', '0', '8140', '4541', '8140', '', '0', 'Adoniss');


### Structure of table `0_sys_prefs` ###

DROP TABLE IF EXISTS `0_sys_prefs`;

CREATE TABLE `0_sys_prefs` (
  `name` varchar(35) NOT NULL default '',
  `category` varchar(30) default NULL,
  `type` varchar(20) NOT NULL default '',
  `length` smallint(6) default NULL,
  `value` tinytext,
  PRIMARY KEY  (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM  ;


### Data of table `0_sys_prefs` ###

INSERT INTO `0_sys_prefs` VALUES ('coy_name', 'setup.company', 'varchar', '60', 'Company name');
INSERT INTO `0_sys_prefs` VALUES ('gst_no', 'setup.company', 'varchar', '25', NULL);
INSERT INTO `0_sys_prefs` VALUES ('coy_no', 'setup.company', 'varchar', '25', NULL);
INSERT INTO `0_sys_prefs` VALUES ('tax_prd', 'setup.company', 'int', '11', '1');
INSERT INTO `0_sys_prefs` VALUES ('tax_last', 'setup.company', 'int', '11', '1');
INSERT INTO `0_sys_prefs` VALUES ('postal_address', 'setup.company', 'tinytext', '0', 'N/A');
INSERT INTO `0_sys_prefs` VALUES ('phone', 'setup.company', 'varchar', '30', NULL);
INSERT INTO `0_sys_prefs` VALUES ('fax', 'setup.company', 'varchar', '30', NULL);
INSERT INTO `0_sys_prefs` VALUES ('email', 'setup.company', 'varchar', '100', NULL);
INSERT INTO `0_sys_prefs` VALUES ('coy_logo', 'setup.company', 'varchar', '100', NULL);
INSERT INTO `0_sys_prefs` VALUES ('domicile', 'setup.company', 'varchar', '55', NULL);
INSERT INTO `0_sys_prefs` VALUES ('curr_default', 'setup.company', 'char', '3', 'HUF');
INSERT INTO `0_sys_prefs` VALUES ('use_dimension', 'setup.company', 'tinyint', '1', '1');
INSERT INTO `0_sys_prefs` VALUES ('f_year', 'setup.company', 'int', '11', '1');
INSERT INTO `0_sys_prefs` VALUES ('no_item_list', 'setup.company', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('no_customer_list', 'setup.company', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('no_supplier_list', 'setup.company', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('base_sales', 'setup.company', 'int', '11', '0');
INSERT INTO `0_sys_prefs` VALUES ('time_zone', 'setup.company', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('add_pct', 'setup.company', 'int', '5', '-1');
INSERT INTO `0_sys_prefs` VALUES ('round_to', 'setup.company', 'int', '5', '1');
INSERT INTO `0_sys_prefs` VALUES ('login_tout', 'setup.company', 'smallint', '6', '600');
INSERT INTO `0_sys_prefs` VALUES ('past_due_days', 'glsetup.general', 'int', '11', '30');
INSERT INTO `0_sys_prefs` VALUES ('profit_loss_year_act', 'glsetup.general', 'varchar', '15', '9990');
INSERT INTO `0_sys_prefs` VALUES ('retained_earnings_act', 'glsetup.general', 'varchar', '15', '2050');
INSERT INTO `0_sys_prefs` VALUES ('bank_charge_act', 'glsetup.general', 'varchar', '15', '1430');
INSERT INTO `0_sys_prefs` VALUES ('exchange_diff_act', 'glsetup.general', 'varchar', '15', '9111');
INSERT INTO `0_sys_prefs` VALUES ('default_credit_limit', 'glsetup.customer', 'int', '11', '1000');
INSERT INTO `0_sys_prefs` VALUES ('accumulate_shipping', 'glsetup.customer', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('legal_text', 'glsetup.customer', 'tinytext', '0', NULL);
INSERT INTO `0_sys_prefs` VALUES ('freight_act', 'glsetup.customer', 'varchar', '15', '8140');
INSERT INTO `0_sys_prefs` VALUES ('debtors_act', 'glsetup.sales', 'varchar', '15', '3111');
INSERT INTO `0_sys_prefs` VALUES ('default_sales_act', 'glsetup.sales', 'varchar', '15', '9111');
INSERT INTO `0_sys_prefs` VALUES ('default_sales_discount_act', 'glsetup.sales', 'varchar', '15', '9111');
INSERT INTO `0_sys_prefs` VALUES ('default_prompt_payment_act', 'glsetup.sales', 'varchar', '15', '9111');
INSERT INTO `0_sys_prefs` VALUES ('default_delivery_required', 'glsetup.sales', 'smallint', '6', '1');
INSERT INTO `0_sys_prefs` VALUES ('default_dim_required', 'glsetup.dims', 'int', '11', '20');
INSERT INTO `0_sys_prefs` VALUES ('pyt_discount_act', 'glsetup.purchase', 'varchar', '15', '8140');
INSERT INTO `0_sys_prefs` VALUES ('creditors_act', 'glsetup.purchase', 'varchar', '15', '4541');
INSERT INTO `0_sys_prefs` VALUES ('po_over_receive', 'glsetup.purchase', 'int', '11', '10');
INSERT INTO `0_sys_prefs` VALUES ('po_over_charge', 'glsetup.purchase', 'int', '11', '10');
INSERT INTO `0_sys_prefs` VALUES ('allow_negative_stock', 'glsetup.inventory', 'tinyint', '1', '0');
INSERT INTO `0_sys_prefs` VALUES ('default_inventory_act', 'glsetup.items', 'varchar', '15', '2690');
INSERT INTO `0_sys_prefs` VALUES ('default_cogs_act', 'glsetup.items', 'varchar', '15', '8140');
INSERT INTO `0_sys_prefs` VALUES ('default_adj_act', 'glsetup.items', 'varchar', '15', '2690');
INSERT INTO `0_sys_prefs` VALUES ('default_inv_sales_act', 'glsetup.items', 'varchar', '15', '9111');
INSERT INTO `0_sys_prefs` VALUES ('default_assembly_act', 'glsetup.items', 'varchar', '15', '2690');
INSERT INTO `0_sys_prefs` VALUES ('default_workorder_required', 'glsetup.manuf', 'int', '11', '20');
INSERT INTO `0_sys_prefs` VALUES ('version_id', 'system', 'varchar', '11', '2.3rc');
INSERT INTO `0_sys_prefs` VALUES ('auto_curr_reval', 'setup.company', 'smallint', '6', '1');


### Structure of table `0_sys_types` ###

DROP TABLE IF EXISTS `0_sys_types`;

CREATE TABLE `0_sys_types` (
  `type_id` smallint(6) NOT NULL default '0',
  `type_no` int(11) NOT NULL default '1',
  `next_reference` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB  ;


### Data of table `0_sys_types` ###

INSERT INTO `0_sys_types` VALUES ('0', '17', '1');
INSERT INTO `0_sys_types` VALUES ('1', '7', '1');
INSERT INTO `0_sys_types` VALUES ('2', '4', '1');
INSERT INTO `0_sys_types` VALUES ('4', '3', '1');
INSERT INTO `0_sys_types` VALUES ('10', '16', '1');
INSERT INTO `0_sys_types` VALUES ('11', '2', '1');
INSERT INTO `0_sys_types` VALUES ('12', '6', '1');
INSERT INTO `0_sys_types` VALUES ('13', '1', '1');
INSERT INTO `0_sys_types` VALUES ('16', '2', '1');
INSERT INTO `0_sys_types` VALUES ('17', '2', '1');
INSERT INTO `0_sys_types` VALUES ('18', '1', '1');
INSERT INTO `0_sys_types` VALUES ('20', '6', '1');
INSERT INTO `0_sys_types` VALUES ('21', '1', '1');
INSERT INTO `0_sys_types` VALUES ('22', '3', '1');
INSERT INTO `0_sys_types` VALUES ('25', '1', '1');
INSERT INTO `0_sys_types` VALUES ('26', '1', '1');
INSERT INTO `0_sys_types` VALUES ('28', '1', '1');
INSERT INTO `0_sys_types` VALUES ('29', '1', '1');
INSERT INTO `0_sys_types` VALUES ('30', '0', '1');
INSERT INTO `0_sys_types` VALUES ('32', '0', '1');
INSERT INTO `0_sys_types` VALUES ('35', '1', '1');
INSERT INTO `0_sys_types` VALUES ('40', '1', '1');


### Structure of table `0_tag_associations` ###

DROP TABLE IF EXISTS `0_tag_associations`;

CREATE TABLE `0_tag_associations` (
  `record_id` varchar(15) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `record_id` (`record_id`,`tag_id`)
) ENGINE=MyISAM  ;


### Data of table `0_tag_associations` ###



### Structure of table `0_tags` ###

DROP TABLE IF EXISTS `0_tags`;

CREATE TABLE `0_tags` (
  `id` int(11) NOT NULL auto_increment,
  `type` smallint(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(60) default NULL,
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `type` (`type`,`name`)
) ENGINE=MyISAM  ;


### Data of table `0_tags` ###



### Structure of table `0_tax_group_items` ###

DROP TABLE IF EXISTS `0_tax_group_items`;

CREATE TABLE `0_tax_group_items` (
  `tax_group_id` int(11) NOT NULL default '0',
  `tax_type_id` int(11) NOT NULL default '0',
  `rate` double NOT NULL default '0',
  PRIMARY KEY  (`tax_group_id`,`tax_type_id`)
) ENGINE=InnoDB  ;


### Data of table `0_tax_group_items` ###

INSERT INTO `0_tax_group_items` VALUES ('2', '1', '20');
INSERT INTO `0_tax_group_items` VALUES ('3', '1', '5');


### Structure of table `0_tax_groups` ###

DROP TABLE IF EXISTS `0_tax_groups`;

CREATE TABLE `0_tax_groups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `tax_shipping` tinyint(1) NOT NULL default '0',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4  ;


### Data of table `0_tax_groups` ###

INSERT INTO `0_tax_groups` VALUES ('2', 'El??zetesen felsz??m??tott 20%', '0', '0');
INSERT INTO `0_tax_groups` VALUES ('3', 'Fizetend?? 20%', '0', '0');


### Structure of table `0_tax_types` ###

DROP TABLE IF EXISTS `0_tax_types`;

CREATE TABLE `0_tax_types` (
  `id` int(11) NOT NULL auto_increment,
  `rate` double NOT NULL default '0',
  `sales_gl_code` varchar(15) NOT NULL default '',
  `purchasing_gl_code` varchar(15) NOT NULL default '',
  `name` varchar(60) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`,`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=4  ;


### Data of table `0_tax_types` ###

INSERT INTO `0_tax_types` VALUES ('1', '20', '4661', '4671', 'VAT', '0');
INSERT INTO `0_tax_types` VALUES ('2', '5', '4662', '4667', 'VAT', '0');
INSERT INTO `0_tax_types` VALUES ('3', '0', '4663', '4673', 'VAT', '0');


### Structure of table `0_trans_tax_details` ###

DROP TABLE IF EXISTS `0_trans_tax_details`;

CREATE TABLE `0_trans_tax_details` (
  `id` int(11) NOT NULL auto_increment,
  `trans_type` smallint(6) default NULL,
  `trans_no` int(11) default NULL,
  `tran_date` date NOT NULL,
  `tax_type_id` int(11) NOT NULL default '0',
  `rate` double NOT NULL default '0',
  `ex_rate` double NOT NULL default '1',
  `included_in_price` tinyint(1) NOT NULL default '0',
  `net_amount` double NOT NULL default '0',
  `amount` double NOT NULL default '0',
  `memo` tinytext,
  PRIMARY KEY  (`id`),
  KEY `Type_and_Number` (`trans_type`,`trans_no`),
  KEY `tran_date` (`tran_date`)
) ENGINE=InnoDB  ;


### Data of table `0_trans_tax_details` ###



### Structure of table `0_useronline` ###

DROP TABLE IF EXISTS `0_useronline`;

CREATE TABLE `0_useronline` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` int(15) NOT NULL default '0',
  `ip` varchar(40) NOT NULL default '',
  `file` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  ;


### Data of table `0_useronline` ###



### Structure of table `0_users` ###

DROP TABLE IF EXISTS `0_users`;

CREATE TABLE `0_users` (
  `id` smallint(6) NOT NULL auto_increment,
  `user_id` varchar(60) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `real_name` varchar(100) NOT NULL default '',
  `role_id` int(11) NOT NULL default '1',
  `phone` varchar(30) NOT NULL default '',
  `email` varchar(100) default NULL,
  `language` varchar(20) default NULL,
  `date_format` tinyint(1) NOT NULL default '0',
  `date_sep` tinyint(1) NOT NULL default '0',
  `tho_sep` tinyint(1) NOT NULL default '0',
  `dec_sep` tinyint(1) NOT NULL default '0',
  `theme` varchar(20) NOT NULL default 'default',
  `page_size` varchar(20) NOT NULL default 'A4',
  `prices_dec` smallint(6) NOT NULL default '2',
  `qty_dec` smallint(6) NOT NULL default '2',
  `rates_dec` smallint(6) NOT NULL default '4',
  `percent_dec` smallint(6) NOT NULL default '1',
  `show_gl` tinyint(1) NOT NULL default '1',
  `show_codes` tinyint(1) NOT NULL default '0',
  `show_hints` tinyint(1) NOT NULL default '0',
  `last_visit_date` datetime default NULL,
  `query_size` tinyint(1) default '10',
  `graphic_links` tinyint(1) default '1',
  `pos` smallint(6) default '1',
  `print_profile` varchar(30) NOT NULL default '1',
  `rep_popup` tinyint(1) default '1',
  `sticky_doc_date` tinyint(1) default '0',
  `startup_tab` varchar(20) NOT NULL default 'orders',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2  ;


### Data of table `0_users` ###

INSERT INTO `0_users` VALUES ('1', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'Administrator', '2', '', 'info@startit.hu', 'hu_HU', '2', '2', '0', '0', 'default', 'A4', '2', '2', '6', '1', '1', '1', '1', '2009-06-27 14:27:12', '10', '1', '1', '', '1', '0', 'orders', '0');


### Structure of table `0_voided` ###

DROP TABLE IF EXISTS `0_voided`;

CREATE TABLE `0_voided` (
  `type` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL default '0',
  `date_` date NOT NULL default '0000-00-00',
  `memo_` tinytext NOT NULL,
  UNIQUE KEY `id` (`type`,`id`)
) ENGINE=InnoDB  ;


### Data of table `0_voided` ###



### Structure of table `0_wo_issue_items` ###

DROP TABLE IF EXISTS `0_wo_issue_items`;

CREATE TABLE `0_wo_issue_items` (
  `id` int(11) NOT NULL auto_increment,
  `stock_id` varchar(40) default NULL,
  `issue_id` int(11) default NULL,
  `qty_issued` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  ;


### Data of table `0_wo_issue_items` ###



### Structure of table `0_wo_issues` ###

DROP TABLE IF EXISTS `0_wo_issues`;

CREATE TABLE `0_wo_issues` (
  `issue_no` int(11) NOT NULL auto_increment,
  `workorder_id` int(11) NOT NULL default '0',
  `reference` varchar(100) default NULL,
  `issue_date` date default NULL,
  `loc_code` varchar(5) default NULL,
  `workcentre_id` int(11) default NULL,
  PRIMARY KEY  (`issue_no`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB  ;


### Data of table `0_wo_issues` ###



### Structure of table `0_wo_manufacture` ###

DROP TABLE IF EXISTS `0_wo_manufacture`;

CREATE TABLE `0_wo_manufacture` (
  `id` int(11) NOT NULL auto_increment,
  `reference` varchar(100) default NULL,
  `workorder_id` int(11) NOT NULL default '0',
  `quantity` double NOT NULL default '0',
  `date_` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB  ;


### Data of table `0_wo_manufacture` ###



### Structure of table `0_wo_requirements` ###

DROP TABLE IF EXISTS `0_wo_requirements`;

CREATE TABLE `0_wo_requirements` (
  `id` int(11) NOT NULL auto_increment,
  `workorder_id` int(11) NOT NULL default '0',
  `stock_id` char(20) NOT NULL default '',
  `workcentre` int(11) NOT NULL default '0',
  `units_req` double NOT NULL default '1',
  `std_cost` double NOT NULL default '0',
  `loc_code` char(5) NOT NULL default '',
  `units_issued` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `workorder_id` (`workorder_id`)
) ENGINE=InnoDB  ;


### Data of table `0_wo_requirements` ###



### Structure of table `0_workcentres` ###

DROP TABLE IF EXISTS `0_workcentres`;

CREATE TABLE `0_workcentres` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `description` char(50) NOT NULL default '',
  `inactive` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  ;


### Data of table `0_workcentres` ###



### Structure of table `0_workorders` ###

DROP TABLE IF EXISTS `0_workorders`;

CREATE TABLE `0_workorders` (
  `id` int(11) NOT NULL auto_increment,
  `wo_ref` varchar(60) NOT NULL default '',
  `loc_code` varchar(5) NOT NULL default '',
  `units_reqd` double NOT NULL default '1',
  `stock_id` varchar(20) NOT NULL default '',
  `date_` date NOT NULL default '0000-00-00',
  `type` tinyint(4) NOT NULL default '0',
  `required_by` date NOT NULL default '0000-00-00',
  `released_date` date NOT NULL default '0000-00-00',
  `units_issued` double NOT NULL default '0',
  `closed` tinyint(1) NOT NULL default '0',
  `released` tinyint(1) NOT NULL default '0',
  `additional_costs` double NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `wo_ref` (`wo_ref`)
) ENGINE=InnoDB  ;


### Data of table `0_workorders` ###

