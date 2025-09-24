-- --------------------------------------------------------
-- Host:                         vultr-prod-48528154-39df-447b-ad78-c520657d4ccf-vultr-prod-96e3.vultrdb.com
-- Server version:               8.0.35 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table demoumbut.tblacc_accounts
CREATE TABLE IF NOT EXISTS `tblacc_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `parent_account` int DEFAULT NULL,
  `account_type_id` int NOT NULL,
  `account_detail_type_id` int NOT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  `balance_as_of` date DEFAULT NULL,
  `description` text,
  `default_account` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_account_history
CREATE TABLE IF NOT EXISTS `tblacc_account_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` int NOT NULL,
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(45) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `customer` int DEFAULT NULL,
  `reconcile` int NOT NULL DEFAULT '0',
  `split` int NOT NULL DEFAULT '0',
  `item` int DEFAULT NULL,
  `paid` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `payslip_type` varchar(45) DEFAULT NULL,
  `vendor` int DEFAULT NULL,
  `itemable_id` int DEFAULT NULL,
  `cleared` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_account_type_details
CREATE TABLE IF NOT EXISTS `tblacc_account_type_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_type_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text,
  `statement_of_cash_flows` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_banking_rules
CREATE TABLE IF NOT EXISTS `tblacc_banking_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transaction` varchar(45) DEFAULT NULL,
  `following` varchar(45) DEFAULT NULL,
  `then` varchar(45) DEFAULT NULL,
  `payment_account` int DEFAULT NULL,
  `deposit_to` int DEFAULT NULL,
  `auto_add` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_banking_rule_details
CREATE TABLE IF NOT EXISTS `tblacc_banking_rule_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rule_id` int NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `subtype` varchar(45) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `subtype_amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_budgets
CREATE TABLE IF NOT EXISTS `tblacc_budgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `data_source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_budget_details
CREATE TABLE IF NOT EXISTS `tblacc_budget_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `budget_id` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `account` int DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_expense_category_mappings
CREATE TABLE IF NOT EXISTS `tblacc_expense_category_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `payment_account` int NOT NULL DEFAULT '0',
  `deposit_to` int NOT NULL DEFAULT '0',
  `preferred_payment_method` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_item_automatics
CREATE TABLE IF NOT EXISTS `tblacc_item_automatics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `inventory_asset_account` int NOT NULL DEFAULT '0',
  `income_account` int NOT NULL DEFAULT '0',
  `expense_account` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_journal_entries
CREATE TABLE IF NOT EXISTS `tblacc_journal_entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `description` text,
  `journal_date` date DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_matched_transactions
CREATE TABLE IF NOT EXISTS `tblacc_matched_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_history_id` int DEFAULT NULL,
  `history_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `company` int DEFAULT NULL,
  `reconcile` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_payment_mode_mappings
CREATE TABLE IF NOT EXISTS `tblacc_payment_mode_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_mode_id` int NOT NULL,
  `payment_account` int NOT NULL DEFAULT '0',
  `deposit_to` int NOT NULL DEFAULT '0',
  `expense_payment_account` int NOT NULL DEFAULT '0',
  `expense_deposit_to` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_plaid_transaction_logs
CREATE TABLE IF NOT EXISTS `tblacc_plaid_transaction_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank_id` int DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  `transaction_count` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `addedFrom` int DEFAULT NULL,
  `company` int DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_reconciles
CREATE TABLE IF NOT EXISTS `tblacc_reconciles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` int NOT NULL,
  `beginning_balance` decimal(15,2) NOT NULL,
  `ending_balance` decimal(15,2) NOT NULL,
  `ending_date` date NOT NULL,
  `expense_date` date DEFAULT NULL,
  `service_charge` decimal(15,2) DEFAULT NULL,
  `expense_account` int DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `interest_earned` decimal(15,2) DEFAULT NULL,
  `income_account` int DEFAULT NULL,
  `finish` int NOT NULL DEFAULT '0',
  `opening_balance` int NOT NULL DEFAULT '0',
  `debits_for_period` decimal(15,2) DEFAULT NULL,
  `credits_for_period` decimal(15,2) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_tax_mappings
CREATE TABLE IF NOT EXISTS `tblacc_tax_mappings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax_id` int NOT NULL,
  `payment_account` int NOT NULL DEFAULT '0',
  `deposit_to` int NOT NULL DEFAULT '0',
  `expense_payment_account` int NOT NULL DEFAULT '0',
  `expense_deposit_to` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_transaction_bankings
CREATE TABLE IF NOT EXISTS `tblacc_transaction_bankings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `withdrawals` decimal(15,2) NOT NULL DEFAULT '0.00',
  `deposits` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payee` varchar(255) DEFAULT NULL,
  `description` text,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `transaction_id` varchar(150) DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>posted, 2=>pending',
  `matched` int NOT NULL DEFAULT '0',
  `reconcile` int NOT NULL DEFAULT '0',
  `adjusted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblacc_transfers
CREATE TABLE IF NOT EXISTS `tblacc_transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transfer_funds_from` int NOT NULL,
  `transfer_funds_to` int NOT NULL,
  `transfer_amount` decimal(15,2) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `description` text,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblactivity_log
CREATE TABLE IF NOT EXISTS `tblactivity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=3289 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblannouncements
CREATE TABLE IF NOT EXISTS `tblannouncements` (
  `announcementid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text,
  `showtousers` int NOT NULL,
  `showtostaff` int NOT NULL,
  `showname` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblbonus_discipline
CREATE TABLE IF NOT EXISTS `tblbonus_discipline` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `id_criteria` varchar(200) DEFAULT NULL,
  `type` int NOT NULL,
  `apply_for` varchar(50) DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `lever_bonus` int DEFAULT NULL,
  `approver` int DEFAULT NULL,
  `url_file` longtext,
  `create_time` datetime DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblbonus_discipline_detail
CREATE TABLE IF NOT EXISTS `tblbonus_discipline_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_bonus_discipline` int NOT NULL,
  `from_time` datetime DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `department_id` longtext,
  `lever_bonus` int DEFAULT NULL,
  `formality` varchar(50) DEFAULT NULL,
  `formality_value` varchar(100) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcart
CREATE TABLE IF NOT EXISTS `tblcart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_contact` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `voucher` varchar(100) NOT NULL,
  `status` int DEFAULT '0',
  `complete` int DEFAULT '0',
  `datecreator` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_number` varchar(100) DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `channel` varchar(150) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `billing_street` varchar(150) DEFAULT NULL,
  `billing_city` varchar(50) DEFAULT NULL,
  `billing_state` varchar(50) DEFAULT NULL,
  `billing_country` varchar(50) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `shipping_street` varchar(150) DEFAULT NULL,
  `shipping_city` varchar(50) DEFAULT NULL,
  `shipping_state` varchar(50) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT NULL,
  `shipping_zip` varchar(50) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `notes` text,
  `reason` varchar(250) DEFAULT NULL,
  `admin_action` int DEFAULT '0',
  `discount` varchar(250) DEFAULT NULL,
  `discount_type` int DEFAULT '0',
  `total` varchar(250) DEFAULT NULL,
  `sub_total` varchar(250) DEFAULT NULL,
  `discount_total` varchar(250) NOT NULL DEFAULT '',
  `invoice` varchar(250) NOT NULL DEFAULT '',
  `number_invoice` varchar(250) NOT NULL DEFAULT '',
  `stock_export_number` varchar(250) NOT NULL DEFAULT '',
  `create_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_export` varchar(5) NOT NULL DEFAULT 'off',
  `customers_pay` decimal(15,2) NOT NULL DEFAULT '0.00',
  `amount_returned` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `seller` int DEFAULT NULL,
  `staff_note` text,
  `payment_note` text,
  `allowed_payment_modes` varchar(200) DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `shipping` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payment_method_title` varchar(250) DEFAULT NULL,
  `discount_type_str` text,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `terms` text,
  `shipping_tax` decimal(15,2) DEFAULT NULL,
  `enable` int NOT NULL DEFAULT '1',
  `duedate` date DEFAULT NULL,
  `shipping_tax_json` varchar(150) DEFAULT NULL,
  `discount_voucher` varchar(150) DEFAULT NULL,
  `original_order_id` int DEFAULT NULL,
  `return_reason` longtext,
  `approve_status` int NOT NULL DEFAULT '0',
  `process_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_import_number` int NOT NULL DEFAULT '0',
  `fee_for_return_order` decimal(15,2) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `estimate_id` int DEFAULT NULL,
  `add_discount` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcart_detailt
CREATE TABLE IF NOT EXISTS `tblcart_detailt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` float NOT NULL,
  `classify` varchar(30) DEFAULT NULL,
  `cart_id` int NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  `long_description` text,
  `sku` text NOT NULL,
  `percent_discount` decimal(15,0) NOT NULL,
  `prices_discount` decimal(15,2) NOT NULL,
  `tax` text,
  `tax_id` text,
  `tax_rate` text,
  `tax_name` text,
  `unit_id` int DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblchecklist
CREATE TABLE IF NOT EXISTS `tblchecklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblchecklist_allocation
CREATE TABLE IF NOT EXISTS `tblchecklist_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcheck_in_out
CREATE TABLE IF NOT EXISTS `tblcheck_in_out` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type_check` int DEFAULT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'W',
  `route_point_id` int DEFAULT NULL,
  `workplace_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblclients
CREATE TABLE IF NOT EXISTS `tblclients` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `company` varchar(191) DEFAULT NULL,
  `saas_company_id` int DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int NOT NULL DEFAULT '0',
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `leadid` int DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT '0',
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT '0',
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int NOT NULL DEFAULT '0',
  `show_primary_contact` int NOT NULL DEFAULT '0',
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int NOT NULL DEFAULT '1',
  `addedfrom` int NOT NULL DEFAULT '0',
  `woo_customer_id` int DEFAULT '0',
  `woo_channel_id` int DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblconsents
CREATE TABLE IF NOT EXISTS `tblconsents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `description` text,
  `opt_in_purpose_description` text,
  `purpose_id` int NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblconsent_purposes
CREATE TABLE IF NOT EXISTS `tblconsent_purposes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontacts
CREATE TABLE IF NOT EXISTS `tblcontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `is_primary` int NOT NULL DEFAULT '1',
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_emails` tinyint(1) NOT NULL DEFAULT '1',
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT '1',
  `contract_emails` tinyint(1) NOT NULL DEFAULT '1',
  `task_emails` tinyint(1) NOT NULL DEFAULT '1',
  `project_emails` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontact_permissions
CREATE TABLE IF NOT EXISTS `tblcontact_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission_id` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontracts
CREATE TABLE IF NOT EXISTS `tblcontracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `description` text,
  `subject` varchar(191) DEFAULT NULL,
  `client` int NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int NOT NULL DEFAULT '0',
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT '0',
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT '0',
  `signature` varchar(40) DEFAULT NULL,
  `marked_as_signed` tinyint(1) NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  `contacts_sent_to` text,
  `last_sign_reminder_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontracts_types
CREATE TABLE IF NOT EXISTS `tblcontracts_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontract_comments
CREATE TABLE IF NOT EXISTS `tblcontract_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `contract_id` int NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcontract_renewals
CREATE TABLE IF NOT EXISTS `tblcontract_renewals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contractid` int NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) NOT NULL,
  `renewed_by_staff_id` int NOT NULL DEFAULT '0',
  `is_on_old_expiry_notified` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcountries
CREATE TABLE IF NOT EXISTS `tblcountries` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcreditnotes
CREATE TABLE IF NOT EXISTS `tblcreditnotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` text,
  `terms` text,
  `clientnote` text,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `project_id` int NOT NULL DEFAULT '0',
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcreditnote_refunds
CREATE TABLE IF NOT EXISTS `tblcreditnote_refunds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `credit_note_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) NOT NULL,
  `note` text,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcredits
CREATE TABLE IF NOT EXISTS `tblcredits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `credit_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcurrencies
CREATE TABLE IF NOT EXISTS `tblcurrencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcurrency_rates
CREATE TABLE IF NOT EXISTS `tblcurrency_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_currency_id` int DEFAULT NULL,
  `from_currency_name` varchar(100) DEFAULT NULL,
  `from_currency_rate` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `to_currency_id` int DEFAULT NULL,
  `to_currency_name` varchar(100) DEFAULT NULL,
  `to_currency_rate` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcurrency_rate_logs
CREATE TABLE IF NOT EXISTS `tblcurrency_rate_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_currency_id` int DEFAULT NULL,
  `from_currency_name` varchar(100) DEFAULT NULL,
  `from_currency_rate` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `to_currency_id` int DEFAULT NULL,
  `to_currency_name` varchar(100) DEFAULT NULL,
  `to_currency_rate` decimal(15,6) NOT NULL DEFAULT '0.000000',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcustomers_groups
CREATE TABLE IF NOT EXISTS `tblcustomers_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcustomer_admins
CREATE TABLE IF NOT EXISTS `tblcustomer_admins` (
  `staff_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `date_assigned` text NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcustomer_groups
CREATE TABLE IF NOT EXISTS `tblcustomer_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupid` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcustomfields
CREATE TABLE IF NOT EXISTS `tblcustomfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `options` mediumtext,
  `display_inline` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` int DEFAULT '0',
  `active` int NOT NULL DEFAULT '1',
  `show_on_pdf` int NOT NULL DEFAULT '0',
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT '0',
  `only_admin` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_client_portal` int NOT NULL DEFAULT '0',
  `disalow_client_to_edit` int NOT NULL DEFAULT '0',
  `bs_column` int NOT NULL DEFAULT '12',
  `default_value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblcustomfieldsvalues
CREATE TABLE IF NOT EXISTS `tblcustomfieldsvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `relid` int NOT NULL,
  `fieldid` int NOT NULL,
  `fieldto` varchar(15) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblday_off
CREATE TABLE IF NOT EXISTS `tblday_off` (
  `id` int NOT NULL AUTO_INCREMENT,
  `off_reason` varchar(255) NOT NULL,
  `off_type` varchar(100) NOT NULL,
  `break_date` date NOT NULL,
  `timekeeping` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `add_from` int NOT NULL,
  `repeat_by_year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbldepartments
CREATE TABLE IF NOT EXISTS `tbldepartments` (
  `departmentid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imap_username` varchar(191) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT '0',
  `host` varchar(150) DEFAULT NULL,
  `password` mediumtext,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(191) NOT NULL DEFAULT 'INBOX',
  `delete_after_import` int NOT NULL DEFAULT '0',
  `calendar_id` mediumtext,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT '0',
  `manager_id` int DEFAULT '0',
  `parent_id` int DEFAULT '0',
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbldismissed_announcements
CREATE TABLE IF NOT EXISTS `tbldismissed_announcements` (
  `dismissedannouncementid` int NOT NULL AUTO_INCREMENT,
  `announcementid` int NOT NULL,
  `staff` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblemaillists
CREATE TABLE IF NOT EXISTS `tblemaillists` (
  `listid` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `creator` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblemailtemplates
CREATE TABLE IF NOT EXISTS `tblemailtemplates` (
  `emailtemplateid` int NOT NULL AUTO_INCREMENT,
  `type` mediumtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `language` varchar(40) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `subject` mediumtext NOT NULL,
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fromname` mediumtext NOT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `plaintext` int NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0',
  `order` int NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=2651 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblestimates
CREATE TABLE IF NOT EXISTS `tblestimates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `number` int NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text,
  `reference_no` varchar(100) DEFAULT NULL,
  `sale_agent` int NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `pipeline_order` int DEFAULT '1',
  `is_expiry_notified` int NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblestimate_requests
CREATE TABLE IF NOT EXISTS `tblestimate_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `submission` longtext NOT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `date_estimated` datetime DEFAULT NULL,
  `from_form_id` int DEFAULT NULL,
  `assigned` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `default_language` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblestimate_request_forms
CREATE TABLE IF NOT EXISTS `tblestimate_request_forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext,
  `recaptcha` int DEFAULT NULL,
  `status` int NOT NULL,
  `submit_btn_name` varchar(100) DEFAULT NULL,
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `success_submit_msg` text,
  `submit_action` int DEFAULT '0',
  `submit_redirect_url` mediumtext,
  `language` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `notify_type` varchar(100) DEFAULT NULL,
  `notify_ids` mediumtext,
  `responsible` int DEFAULT NULL,
  `notify_request_submitted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblestimate_request_status
CREATE TABLE IF NOT EXISTS `tblestimate_request_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `flag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblevents
CREATE TABLE IF NOT EXISTS `tblevents` (
  `eventid` int NOT NULL AUTO_INCREMENT,
  `title` mediumtext NOT NULL,
  `description` text,
  `userid` int NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int NOT NULL DEFAULT '0',
  `color` varchar(10) DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT '0',
  `reminder_before` int NOT NULL DEFAULT '0',
  `reminder_before_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblexpenses
CREATE TABLE IF NOT EXISTS `tblexpenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL,
  `currency` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int DEFAULT NULL,
  `tax2` int NOT NULL DEFAULT '0',
  `reference_no` varchar(100) DEFAULT NULL,
  `note` text,
  `expense_name` varchar(191) DEFAULT NULL,
  `clientid` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `billable` int DEFAULT '0',
  `invoiceid` int DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int DEFAULT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `custom_recurring` int NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int NOT NULL,
  `vendor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblexpenses_categories
CREATE TABLE IF NOT EXISTS `tblexpenses_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblfiles
CREATE TABLE IF NOT EXISTS `tblfiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(40) DEFAULT NULL,
  `visible_to_customer` int NOT NULL DEFAULT '0',
  `attachment_key` varchar(32) DEFAULT NULL,
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text COMMENT 'For external usage',
  `staffid` int NOT NULL,
  `contact_id` int DEFAULT '0',
  `task_comment_id` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblform_questions
CREATE TABLE IF NOT EXISTS `tblform_questions` (
  `questionid` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblform_question_box
CREATE TABLE IF NOT EXISTS `tblform_question_box` (
  `boxid` int NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblform_question_box_description
CREATE TABLE IF NOT EXISTS `tblform_question_box_description` (
  `questionboxdescriptionid` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblform_results
CREATE TABLE IF NOT EXISTS `tblform_results` (
  `resultid` int NOT NULL AUTO_INCREMENT,
  `boxid` int NOT NULL,
  `boxdescriptionid` int DEFAULT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int NOT NULL,
  `answer` text,
  `resultsetid` int NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgdpr_requests
CREATE TABLE IF NOT EXISTS `tblgdpr_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clientid` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `request_type` varchar(191) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_delivery
CREATE TABLE IF NOT EXISTS `tblgoods_delivery` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` int DEFAULT NULL COMMENT 'type goods delivery',
  `rel_document` int DEFAULT NULL COMMENT 'document id of goods delivery',
  `customer_code` text,
  `customer_name` varchar(100) DEFAULT NULL,
  `to_` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` text COMMENT 'the reason delivery',
  `staff_id` int DEFAULT NULL COMMENT 'salesman',
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `goods_delivery_code` varchar(100) DEFAULT NULL COMMENT 'số chứng từ xuất kho',
  `warehouse_id` int DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `approval` int DEFAULT '0' COMMENT 'status approval ',
  `addedfrom` int DEFAULT NULL,
  `total_discount` varchar(100) DEFAULT NULL,
  `after_discount` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `project` text,
  `type` text,
  `department` int DEFAULT NULL,
  `requester` int DEFAULT NULL,
  `invoice_no` text,
  `pr_order_id` int DEFAULT NULL,
  `type_of_delivery` varchar(100) DEFAULT 'total',
  `additional_discount` decimal(15,2) DEFAULT '0.00',
  `sub_total` decimal(15,2) DEFAULT '0.00',
  `delivery_status` varchar(100) DEFAULT 'ready_for_packing',
  `shipping_fee` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_delivery_detail
CREATE TABLE IF NOT EXISTS `tblgoods_delivery_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `goods_delivery_id` int NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text,
  `warehouse_id` text,
  `unit_id` text,
  `quantities` text,
  `unit_price` varchar(100) DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `note` text,
  `discount` varchar(100) DEFAULT NULL,
  `discount_money` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(100) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `total_after_discount` varchar(100) DEFAULT NULL,
  `expiry_date` text,
  `lot_number` text,
  `guarantee_period` text,
  `tax_rate` text,
  `tax_name` text,
  `sub_total` decimal(15,2) DEFAULT '0.00',
  `packing_qty` decimal(15,2) DEFAULT '0.00',
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_delivery_invoices_pr_orders
CREATE TABLE IF NOT EXISTS `tblgoods_delivery_invoices_pr_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int DEFAULT NULL COMMENT 'goods_delivery_id',
  `rel_type` int DEFAULT NULL COMMENT 'invoice_id or purchase order id',
  `type` varchar(100) DEFAULT NULL COMMENT 'invoice,  purchase_orders',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_receipt
CREATE TABLE IF NOT EXISTS `tblgoods_receipt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(100) DEFAULT NULL,
  `supplier_name` text,
  `deliver_name` text,
  `buyer_id` int DEFAULT NULL,
  `description` text,
  `pr_order_id` int DEFAULT NULL COMMENT 'code puchase request agree',
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `goods_receipt_code` varchar(100) DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `total_tax_money` varchar(100) DEFAULT NULL,
  `total_goods_money` varchar(100) DEFAULT NULL,
  `value_of_inventory` varchar(100) DEFAULT NULL,
  `total_money` varchar(100) DEFAULT NULL COMMENT 'total_money = total_tax_money +total_goods_money ',
  `addedfrom` int DEFAULT NULL,
  `approval` int DEFAULT '0',
  `project` text,
  `type` text,
  `department` int DEFAULT NULL,
  `requester` int DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_no` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_receipt_detail
CREATE TABLE IF NOT EXISTS `tblgoods_receipt_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `goods_receipt_id` int NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text,
  `warehouse_id` text,
  `unit_id` text,
  `quantities` text,
  `unit_price` varchar(100) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `tax_money` varchar(100) DEFAULT NULL,
  `goods_money` varchar(100) DEFAULT NULL,
  `date_manufacture` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `note` text,
  `discount` varchar(100) DEFAULT NULL,
  `discount_money` varchar(100) DEFAULT NULL,
  `lot_number` varchar(100) DEFAULT NULL,
  `tax_rate` text,
  `sub_total` decimal(15,2) DEFAULT '0.00',
  `tax_name` text,
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgoods_transaction_detail
CREATE TABLE IF NOT EXISTS `tblgoods_transaction_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `goods_receipt_id` int DEFAULT NULL COMMENT 'id_goods_receipt_id or goods_delivery_id',
  `goods_id` int NOT NULL COMMENT ' is id commodity',
  `old_quantity` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `date_add` datetime DEFAULT NULL,
  `commodity_id` int NOT NULL,
  `warehouse_id` text NOT NULL,
  `note` text,
  `status` int DEFAULT NULL COMMENT '1:Goods receipt note 2:Goods delivery note',
  `purchase_price` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `expiry_date` text,
  `lot_number` text,
  `from_stock_name` int DEFAULT NULL,
  `to_stock_name` int DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgroup_checklist
CREATE TABLE IF NOT EXISTS `tblgroup_checklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblgroup_checklist_allocation
CREATE TABLE IF NOT EXISTS `tblgroup_checklist_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_bonus_kpi
CREATE TABLE IF NOT EXISTS `tblhrp_bonus_kpi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_bonus_kpi` varchar(45) DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  `bonus_kpi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_commissions
CREATE TABLE IF NOT EXISTS `tblhrp_commissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `commission_amount` decimal(15,2) DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_company_contributions_list
CREATE TABLE IF NOT EXISTS `tblhrp_company_contributions_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `rate` decimal(15,2) DEFAULT NULL,
  `basis` varchar(200) DEFAULT NULL,
  `earn_inclusion` varchar(200) DEFAULT NULL,
  `earn_exclusion` varchar(200) DEFAULT NULL,
  `earnings_max` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_earnings_list
CREATE TABLE IF NOT EXISTS `tblhrp_earnings_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `taxable` decimal(15,2) DEFAULT NULL,
  `basis_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_earnings_list_hr_records
CREATE TABLE IF NOT EXISTS `tblhrp_earnings_list_hr_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `taxable` decimal(15,2) DEFAULT NULL,
  `basis_type` varchar(200) DEFAULT NULL,
  `rel_type` varchar(200) DEFAULT NULL,
  `rel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_employees_timesheets
CREATE TABLE IF NOT EXISTS `tblhrp_employees_timesheets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `day_1` decimal(15,2) DEFAULT '0.00',
  `day_2` decimal(15,2) DEFAULT '0.00',
  `day_3` decimal(15,2) DEFAULT '0.00',
  `day_4` decimal(15,2) DEFAULT '0.00',
  `day_5` decimal(15,2) DEFAULT '0.00',
  `day_6` decimal(15,2) DEFAULT '0.00',
  `day_7` decimal(15,2) DEFAULT '0.00',
  `day_8` decimal(15,2) DEFAULT '0.00',
  `day_9` decimal(15,2) DEFAULT '0.00',
  `day_10` decimal(15,2) DEFAULT '0.00',
  `day_11` decimal(15,2) DEFAULT '0.00',
  `day_12` decimal(15,2) DEFAULT '0.00',
  `day_13` decimal(15,2) DEFAULT '0.00',
  `day_14` decimal(15,2) DEFAULT '0.00',
  `day_15` decimal(15,2) DEFAULT '0.00',
  `day_16` decimal(15,2) DEFAULT '0.00',
  `day_17` decimal(15,2) DEFAULT '0.00',
  `day_18` decimal(15,2) DEFAULT '0.00',
  `day_19` decimal(15,2) DEFAULT '0.00',
  `day_20` decimal(15,2) DEFAULT '0.00',
  `day_21` decimal(15,2) DEFAULT '0.00',
  `day_22` decimal(15,2) DEFAULT '0.00',
  `day_23` decimal(15,2) DEFAULT '0.00',
  `day_24` decimal(15,2) DEFAULT '0.00',
  `day_25` decimal(15,2) DEFAULT '0.00',
  `day_26` decimal(15,2) DEFAULT '0.00',
  `day_27` decimal(15,2) DEFAULT '0.00',
  `day_28` decimal(15,2) DEFAULT '0.00',
  `day_29` decimal(15,2) DEFAULT '0.00',
  `day_30` decimal(15,2) DEFAULT '0.00',
  `day_31` decimal(15,2) DEFAULT '0.00',
  `standard_workday` decimal(15,2) DEFAULT NULL,
  `actual_workday` decimal(15,2) DEFAULT NULL,
  `paid_leave` decimal(15,2) DEFAULT NULL,
  `unpaid_leave` decimal(15,2) DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  `actual_workday_probation` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_employees_value
CREATE TABLE IF NOT EXISTS `tblhrp_employees_value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `job_title` varchar(200) DEFAULT NULL,
  `income_tax_number` varchar(200) DEFAULT NULL,
  `residential_address` text,
  `income_rebate_code` varchar(200) DEFAULT NULL,
  `income_tax_rate` varchar(200) DEFAULT NULL,
  `probationary_contracts` longtext,
  `primary_contracts` longtext,
  `rel_type` varchar(100) DEFAULT NULL,
  `probationary_effective` date DEFAULT NULL,
  `probationary_expiration` date DEFAULT NULL,
  `primary_effective` date DEFAULT NULL,
  `primary_expiration` date DEFAULT NULL,
  `bank_name` varchar(500) DEFAULT NULL,
  `account_number` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_income_taxs
CREATE TABLE IF NOT EXISTS `tblhrp_income_taxs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `gross_amount` decimal(15,2) DEFAULT NULL,
  `total_deduction_amount` decimal(15,2) DEFAULT NULL,
  `income_tax` decimal(15,2) DEFAULT NULL,
  `payslip_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_income_tax_rates
CREATE TABLE IF NOT EXISTS `tblhrp_income_tax_rates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tax_bracket_value_from` decimal(15,2) DEFAULT NULL,
  `tax_bracket_value_to` decimal(15,2) DEFAULT NULL,
  `tax_rate` decimal(15,2) DEFAULT NULL,
  `equivalent_value` decimal(15,2) DEFAULT NULL,
  `effective_rate` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_income_tax_rebates
CREATE TABLE IF NOT EXISTS `tblhrp_income_tax_rebates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `value` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_insurance_list
CREATE TABLE IF NOT EXISTS `tblhrp_insurance_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `rate` decimal(15,2) DEFAULT NULL,
  `basis` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_payroll_columns
CREATE TABLE IF NOT EXISTS `tblhrp_payroll_columns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `column_key` text,
  `taking_method` text COMMENT 'get from system, caculator, constant... ',
  `function_name` text COMMENT 'get value for method system',
  `value_related_to` text COMMENT 'salary, allowance value...',
  `display_with_staff` varchar(10) DEFAULT 'true',
  `description` text,
  `date_created` datetime NOT NULL,
  `staff_id_created` int NOT NULL,
  `order_display` int DEFAULT NULL,
  `is_edit` varchar(100) DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_payslips
CREATE TABLE IF NOT EXISTS `tblhrp_payslips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payslip_name` varchar(100) NOT NULL,
  `payslip_template_id` int DEFAULT NULL,
  `payslip_month` date NOT NULL,
  `staff_id_created` int NOT NULL,
  `date_created` datetime NOT NULL,
  `payslip_data` longtext,
  `file_name` text,
  `payslip_status` varchar(100) DEFAULT 'payslip_opening',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_payslip_details
CREATE TABLE IF NOT EXISTS `tblhrp_payslip_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payslip_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `pay_slip_number` text,
  `payment_run_date` date NOT NULL,
  `employee_number` text,
  `employee_name` text,
  `dept_name` text,
  `standard_workday` decimal(20,2) DEFAULT '0.00',
  `actual_workday` decimal(15,2) DEFAULT '0.00',
  `paid_leave` decimal(15,2) DEFAULT '0.00',
  `unpaid_leave` decimal(15,2) DEFAULT '0.00',
  `gross_pay` decimal(15,2) DEFAULT '0.00',
  `income_tax_paye` decimal(15,2) DEFAULT '0.00',
  `total_deductions` decimal(15,2) DEFAULT '0.00',
  `net_pay` decimal(15,2) DEFAULT '0.00',
  `it_rebate_code` text,
  `it_rebate_value` decimal(15,2) DEFAULT '0.00',
  `income_tax_code` text,
  `commission_amount` decimal(15,2) DEFAULT '0.00',
  `bonus_kpi` decimal(15,2) DEFAULT '0.00',
  `total_cost` decimal(15,2) DEFAULT '0.00',
  `total_insurance` decimal(15,2) DEFAULT '0.00',
  `json_data` longtext,
  `salary_of_the_probationary_contract` decimal(15,2) DEFAULT '0.00',
  `salary_of_the_formal_contract` decimal(15,2) DEFAULT '0.00',
  `taxable_salary` decimal(15,2) DEFAULT '0.00',
  `actual_workday_probation` decimal(15,2) DEFAULT '0.00',
  `total_hours_by_tasks` decimal(15,2) DEFAULT '0.00',
  `salary_from_tasks` decimal(15,2) DEFAULT '0.00',
  `account_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_payslip_templates
CREATE TABLE IF NOT EXISTS `tblhrp_payslip_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `templates_name` varchar(100) NOT NULL,
  `payslip_columns` longtext,
  `payslip_id_copy` int unsigned NOT NULL,
  `department_id` longtext,
  `role_employees` longtext,
  `staff_employees` longtext,
  `payslip_template_data` longtext,
  `date_created` datetime NOT NULL,
  `staff_id_created` int NOT NULL,
  `cell_data` longtext,
  `except_staff` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_salary_deductions
CREATE TABLE IF NOT EXISTS `tblhrp_salary_deductions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `deduction_list` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_salary_deductions_list
CREATE TABLE IF NOT EXISTS `tblhrp_salary_deductions_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `rate` decimal(15,2) DEFAULT NULL,
  `basis` varchar(200) DEFAULT NULL,
  `earn_inclusion` varchar(200) DEFAULT NULL,
  `earn_exclusion` varchar(200) DEFAULT NULL,
  `earnings_max` decimal(15,2) DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `annual_tax_limit` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhrp_staff_insurances
CREATE TABLE IF NOT EXISTS `tblhrp_staff_insurances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `month` date NOT NULL,
  `insurance_list` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_allocation_asset
CREATE TABLE IF NOT EXISTS `tblhr_allocation_asset` (
  `allocation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int unsigned NOT NULL,
  `asset_name` varchar(100) DEFAULT NULL,
  `assets_amount` int unsigned NOT NULL,
  `status_allocation` int unsigned DEFAULT '0' COMMENT '1: Allocated 0: Unallocated',
  PRIMARY KEY (`allocation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_allowance_type
CREATE TABLE IF NOT EXISTS `tblhr_allowance_type` (
  `type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) NOT NULL,
  `allowance_val` decimal(15,2) NOT NULL,
  `taxable` tinyint(1) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_checklist_allocation
CREATE TABLE IF NOT EXISTS `tblhr_checklist_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int DEFAULT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_contract_template
CREATE TABLE IF NOT EXISTS `tblhr_contract_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  `job_position` longtext,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_dependent_person
CREATE TABLE IF NOT EXISTS `tblhr_dependent_person` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int unsigned DEFAULT NULL,
  `dependent_name` varchar(100) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `dependent_bir` date DEFAULT NULL,
  `start_month` date DEFAULT NULL,
  `end_month` date DEFAULT NULL,
  `dependent_iden` varchar(20) NOT NULL,
  `reason` longtext,
  `status` int unsigned DEFAULT '0',
  `status_comment` longtext,
  PRIMARY KEY (`id`,`dependent_iden`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_education
CREATE TABLE IF NOT EXISTS `tblhr_education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `programe_id` int DEFAULT NULL,
  `training_programs_name` text NOT NULL,
  `training_places` text,
  `training_time_from` datetime DEFAULT NULL,
  `training_time_to` datetime DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `training_result` varchar(150) DEFAULT NULL,
  `degree` varchar(150) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_group_checklist_allocation
CREATE TABLE IF NOT EXISTS `tblhr_group_checklist_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  `meta` varchar(100) DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_job_p
CREATE TABLE IF NOT EXISTS `tblhr_job_p` (
  `job_id` int unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_job_position
CREATE TABLE IF NOT EXISTS `tblhr_job_position` (
  `position_id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(200) NOT NULL,
  `job_position_description` text,
  `job_p_id` int unsigned NOT NULL,
  `position_code` varchar(50) DEFAULT NULL,
  `department_id` text,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_jp_interview_training
CREATE TABLE IF NOT EXISTS `tblhr_jp_interview_training` (
  `training_process_id` int unsigned NOT NULL AUTO_INCREMENT,
  `job_position_id` longtext,
  `training_name` varchar(100) DEFAULT NULL,
  `training_type` int DEFAULT NULL,
  `description` text,
  `date_add` datetime DEFAULT NULL,
  `position_training_id` text,
  `mint_point` int DEFAULT NULL,
  `additional_training` varchar(100) DEFAULT '',
  `staff_id` text,
  `time_to_start` date DEFAULT NULL,
  `time_to_end` date DEFAULT NULL,
  PRIMARY KEY (`training_process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_jp_salary_scale
CREATE TABLE IF NOT EXISTS `tblhr_jp_salary_scale` (
  `salary_scale_id` int unsigned NOT NULL AUTO_INCREMENT,
  `job_position_id` int unsigned NOT NULL,
  `rel_type` varchar(100) DEFAULT NULL COMMENT 'salary:allowance:insurance',
  `rel_id` int DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`salary_scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_knowedge_base_article_feedback
CREATE TABLE IF NOT EXISTS `tblhr_knowedge_base_article_feedback` (
  `articleanswerid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `answer` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_knowledge_base
CREATE TABLE IF NOT EXISTS `tblhr_knowledge_base` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `articlegroup` int NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int NOT NULL DEFAULT '0',
  `staff_article` int NOT NULL DEFAULT '0',
  `question_answers` int DEFAULT '0',
  `file_name` varchar(255) DEFAULT '',
  `curator` varchar(11) DEFAULT '',
  `benchmark` int DEFAULT '0',
  `score` int DEFAULT '0',
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_knowledge_base_groups
CREATE TABLE IF NOT EXISTS `tblhr_knowledge_base_groups` (
  `groupid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text,
  `description` mediumtext,
  `active` tinyint NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_list_staff_quitting_work
CREATE TABLE IF NOT EXISTS `tblhr_list_staff_quitting_work` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int DEFAULT NULL,
  `staff_name` text,
  `department_name` text,
  `role_name` text,
  `email` text,
  `dateoff` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approval` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_payroll_option
CREATE TABLE IF NOT EXISTS `tblhr_payroll_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_position_training
CREATE TABLE IF NOT EXISTS `tblhr_position_training` (
  `training_id` int NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `training_type` int unsigned NOT NULL,
  `slug` mediumtext NOT NULL,
  `description` text,
  `viewdescription` text,
  `datecreated` datetime NOT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT '0',
  `onlyforloggedin` int DEFAULT '0',
  `fromname` varchar(100) DEFAULT NULL,
  `iprestrict` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(32) NOT NULL,
  `mint_point` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`training_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_position_training_question_form
CREATE TABLE IF NOT EXISTS `tblhr_position_training_question_form` (
  `questionid` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_procedure_retire
CREATE TABLE IF NOT EXISTS `tblhr_procedure_retire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_name` text,
  `option_name` text,
  `status` int DEFAULT '1',
  `people_handle_id` int NOT NULL,
  `procedure_retire_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_procedure_retire_manage
CREATE TABLE IF NOT EXISTS `tblhr_procedure_retire_manage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_procedure_retire` text NOT NULL,
  `department` varchar(250) NOT NULL,
  `datecreator` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_procedure_retire_of_staff
CREATE TABLE IF NOT EXISTS `tblhr_procedure_retire_of_staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int DEFAULT NULL,
  `option_name` text,
  `status` int DEFAULT '0',
  `staffid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_procedure_retire_of_staff_by_id
CREATE TABLE IF NOT EXISTS `tblhr_procedure_retire_of_staff_by_id` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_name` text,
  `people_handle_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_profile_option
CREATE TABLE IF NOT EXISTS `tblhr_profile_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_p_t_form_question_box
CREATE TABLE IF NOT EXISTS `tblhr_p_t_form_question_box` (
  `boxid` int NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_p_t_form_question_box_description
CREATE TABLE IF NOT EXISTS `tblhr_p_t_form_question_box_description` (
  `questionboxdescriptionid` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int NOT NULL,
  `correct` int DEFAULT '1' COMMENT '0: correct 1: incorrect',
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_p_t_form_results
CREATE TABLE IF NOT EXISTS `tblhr_p_t_form_results` (
  `resultid` int NOT NULL AUTO_INCREMENT,
  `boxid` int NOT NULL,
  `boxdescriptionid` int DEFAULT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int NOT NULL,
  `answer` text,
  `resultsetid` int NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_p_t_surveyresultsets
CREATE TABLE IF NOT EXISTS `tblhr_p_t_surveyresultsets` (
  `resultsetid` int NOT NULL AUTO_INCREMENT,
  `trainingid` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  `staff_id` int unsigned NOT NULL,
  PRIMARY KEY (`resultsetid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_rec_transfer_records
CREATE TABLE IF NOT EXISTS `tblhr_rec_transfer_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `staff_identifi` varchar(20) DEFAULT NULL,
  `creator` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_salary_form
CREATE TABLE IF NOT EXISTS `tblhr_salary_form` (
  `form_id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_name` varchar(200) NOT NULL,
  `salary_val` decimal(15,2) NOT NULL,
  `tax` tinyint(1) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_staff_contract
CREATE TABLE IF NOT EXISTS `tblhr_staff_contract` (
  `id_contract` int unsigned NOT NULL AUTO_INCREMENT,
  `contract_code` varchar(200) NOT NULL,
  `name_contract` int NOT NULL,
  `staff` int NOT NULL,
  `start_valid` date DEFAULT NULL,
  `end_valid` date DEFAULT NULL,
  `contract_status` varchar(100) DEFAULT NULL,
  `sign_day` date DEFAULT NULL,
  `staff_delegate` int DEFAULT NULL,
  `hourly_or_month` longtext,
  `content` longtext,
  `hash` varchar(32) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `signer` int DEFAULT NULL,
  `staff_signature` varchar(40) DEFAULT NULL,
  `staff_sign_day` date DEFAULT NULL,
  PRIMARY KEY (`id_contract`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_staff_contract_detail
CREATE TABLE IF NOT EXISTS `tblhr_staff_contract_detail` (
  `contract_detail_id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_contract_id` int unsigned NOT NULL,
  `type` text,
  `rel_type` text,
  `rel_value` decimal(15,2) DEFAULT '0.00',
  `since_date` date DEFAULT NULL,
  `contract_note` text,
  PRIMARY KEY (`contract_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_staff_contract_type
CREATE TABLE IF NOT EXISTS `tblhr_staff_contract_type` (
  `id_contracttype` int unsigned NOT NULL AUTO_INCREMENT,
  `name_contracttype` varchar(200) NOT NULL,
  `description` longtext,
  `duration` int DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `insurance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_contracttype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_training_allocation
CREATE TABLE IF NOT EXISTS `tblhr_training_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_process_id` varchar(100) NOT NULL,
  `staffid` int DEFAULT NULL,
  `training_type` int DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `training_name` varchar(150) DEFAULT NULL,
  `jp_interview_training_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_type_of_trainings
CREATE TABLE IF NOT EXISTS `tblhr_type_of_trainings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_views_tracking
CREATE TABLE IF NOT EXISTS `tblhr_views_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblhr_workplace
CREATE TABLE IF NOT EXISTS `tblhr_workplace` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `workplace_address` varchar(400) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinternal_delivery_note
CREATE TABLE IF NOT EXISTS `tblinternal_delivery_note` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `internal_delivery_name` text,
  `description` text,
  `staff_id` int DEFAULT NULL,
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `internal_delivery_code` varchar(100) DEFAULT NULL,
  `approval` int DEFAULT '0' COMMENT 'status approval ',
  `addedfrom` int DEFAULT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinternal_delivery_note_detail
CREATE TABLE IF NOT EXISTS `tblinternal_delivery_note_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `internal_delivery_id` int NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `from_stock_name` text,
  `to_stock_name` text,
  `unit_id` text,
  `available_quantity` text,
  `quantities` text,
  `unit_price` varchar(100) DEFAULT NULL,
  `into_money` varchar(100) DEFAULT NULL,
  `note` text,
  `commodity_name` text,
  `serial_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinventory_commodity_min
CREATE TABLE IF NOT EXISTS `tblinventory_commodity_min` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` varchar(100) DEFAULT NULL,
  `inventory_number_min` varchar(100) DEFAULT NULL,
  `inventory_number_max` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`,`commodity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinventory_manage
CREATE TABLE IF NOT EXISTS `tblinventory_manage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `warehouse_id` int NOT NULL,
  `commodity_id` int NOT NULL,
  `inventory_number` varchar(100) DEFAULT NULL,
  `date_manufacture` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `lot_number` varchar(100) DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`,`commodity_id`,`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinvoicepaymentrecords
CREATE TABLE IF NOT EXISTS `tblinvoicepaymentrecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoiceid` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) DEFAULT NULL,
  `paymentmethod` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `transactionid` mediumtext,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblinvoices
CREATE TABLE IF NOT EXISTS `tblinvoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `clientid` int NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `status` int DEFAULT '1',
  `clientnote` text,
  `adminnote` text,
  `last_overdue_reminder` date DEFAULT NULL,
  `last_due_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int NOT NULL DEFAULT '0',
  `allowed_payment_modes` mediumtext,
  `token` mediumtext,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) NOT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `is_recurring_from` int DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` text,
  `sale_agent` int NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `project_id` int DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `short_link` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblitemable
CREATE TABLE IF NOT EXISTS `tblitemable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `description` mediumtext NOT NULL,
  `long_description` mediumtext,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  `wh_delivered_quantity` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblitems
CREATE TABLE IF NOT EXISTS `tblitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `long_description` text,
  `rate` decimal(15,2) NOT NULL,
  `tax` int DEFAULT NULL,
  `tax2` int DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int NOT NULL DEFAULT '0',
  `commodity_code` varchar(100) NOT NULL,
  `commodity_barcode` text,
  `commodity_type` int DEFAULT NULL,
  `warehouse_id` int DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  `style_id` int DEFAULT NULL,
  `model_id` int DEFAULT NULL,
  `size_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `sku_code` varchar(200) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT NULL,
  `sub_group` varchar(200) DEFAULT NULL,
  `commodity_name` varchar(200) NOT NULL,
  `color` text,
  `guarantee` text,
  `profif_ratio` text,
  `active` int DEFAULT '1',
  `long_descriptions` longtext,
  `without_checking_warehouse` int DEFAULT '0',
  `series_id` text,
  `parent_id` int DEFAULT NULL,
  `attributes` longtext,
  `parent_attributes` longtext,
  `can_be_sold` varchar(100) DEFAULT 'can_be_sold',
  `can_be_purchased` varchar(100) DEFAULT 'can_be_purchased',
  `can_be_manufacturing` varchar(100) DEFAULT 'can_be_manufacturing',
  `can_be_inventory` varchar(100) DEFAULT 'can_be_inventory',
  `product_type` varchar(100) DEFAULT NULL,
  `description_internal_transfers` text,
  `description_receipts` text,
  `description_delivery_orders` text,
  `customer_lead_time` decimal(15,2) DEFAULT '0.00',
  `replenish_on_order` varchar(100) DEFAULT NULL,
  `supplier_taxes_id` text,
  `description_sale` text,
  `invoice_policy` varchar(100) DEFAULT 'ordered_quantities',
  `purchase_unit_measure` int DEFAULT NULL,
  `manufacture` varchar(100) DEFAULT NULL,
  `manufacturing_lead_time` decimal(15,2) DEFAULT '0.00',
  `weight` decimal(15,2) DEFAULT '0.00',
  `volume` decimal(15,2) DEFAULT '0.00',
  `hs_code` varchar(200) DEFAULT NULL,
  `from_vendor_item` int DEFAULT NULL,
  `rate_currency_3` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblitems_groups
CREATE TABLE IF NOT EXISTS `tblitems_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `commodity_group_code` varchar(100) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `display` int DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblitems_of_vendor
CREATE TABLE IF NOT EXISTS `tblitems_of_vendor` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `description` text NOT NULL,
  `long_description` text,
  `rate` decimal(15,2) DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `tax2` int DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int NOT NULL,
  `commodity_code` varchar(100) NOT NULL,
  `commodity_barcode` text,
  `unit_id` int DEFAULT NULL,
  `sku_code` varchar(200) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `sub_group` varchar(200) DEFAULT NULL,
  `active` int DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `attributes` longtext,
  `parent_attributes` longtext,
  `commodity_type` int DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `commodity_name` varchar(200) NOT NULL,
  `series_id` text,
  `long_descriptions` longtext,
  `share_status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblitem_tax
CREATE TABLE IF NOT EXISTS `tblitem_tax` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemid` int NOT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblknowedge_base_article_feedback
CREATE TABLE IF NOT EXISTS `tblknowedge_base_article_feedback` (
  `articleanswerid` int NOT NULL AUTO_INCREMENT,
  `articleid` int NOT NULL,
  `answer` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblknowledge_base
CREATE TABLE IF NOT EXISTS `tblknowledge_base` (
  `articleid` int NOT NULL AUTO_INCREMENT,
  `articlegroup` int NOT NULL,
  `subject` mediumtext NOT NULL,
  `description` text NOT NULL,
  `slug` mediumtext NOT NULL,
  `active` tinyint NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int NOT NULL DEFAULT '0',
  `staff_article` int NOT NULL DEFAULT '0',
  `question_answers` int DEFAULT '0',
  `file_name` varchar(255) DEFAULT '',
  `curator` varchar(11) DEFAULT '',
  `benchmark` int DEFAULT '0',
  `score` int DEFAULT '0',
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblknowledge_base_groups
CREATE TABLE IF NOT EXISTS `tblknowledge_base_groups` (
  `groupid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` text,
  `description` mediumtext,
  `active` tinyint NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblleads
CREATE TABLE IF NOT EXISTS `tblleads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `description` text,
  `country` int NOT NULL DEFAULT '0',
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `assigned` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `from_form_id` int NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `source` int NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `leadorder` int DEFAULT '1',
  `phonenumber` varchar(50) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT '0',
  `junk` int NOT NULL DEFAULT '0',
  `last_lead_status` int NOT NULL DEFAULT '0',
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT '0',
  `email_integration_uid` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `default_language` varchar(40) DEFAULT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `lead_value` decimal(15,2) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblleads_email_integration
CREATE TABLE IF NOT EXISTS `tblleads_email_integration` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `imap_server` varchar(100) NOT NULL,
  `password` mediumtext NOT NULL,
  `check_every` int NOT NULL DEFAULT '5',
  `responsible` int NOT NULL,
  `lead_source` int NOT NULL,
  `lead_status` int NOT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `last_run` varchar(50) DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT '1',
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `mark_public` int NOT NULL DEFAULT '0',
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT '1',
  `delete_after_import` int NOT NULL DEFAULT '0',
  `create_task_if_customer` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblleads_sources
CREATE TABLE IF NOT EXISTS `tblleads_sources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblleads_status
CREATE TABLE IF NOT EXISTS `tblleads_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int DEFAULT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `isdefault` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbllead_activity_log
CREATE TABLE IF NOT EXISTS `tbllead_activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leadid` int NOT NULL,
  `description` mediumtext NOT NULL,
  `additional_data` text,
  `date` datetime NOT NULL,
  `staffid` int NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbllead_integration_emails
CREATE TABLE IF NOT EXISTS `tbllead_integration_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` mediumtext,
  `body` mediumtext,
  `dateadded` datetime NOT NULL,
  `leadid` int NOT NULL,
  `emailid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblleave_of_the_year
CREATE TABLE IF NOT EXISTS `tblleave_of_the_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `value` double DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `add_from` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbllistemails
CREATE TABLE IF NOT EXISTS `tbllistemails` (
  `emailid` int NOT NULL AUTO_INCREMENT,
  `listid` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmaillistscustomfields
CREATE TABLE IF NOT EXISTS `tblmaillistscustomfields` (
  `customfieldid` int NOT NULL AUTO_INCREMENT,
  `listid` int NOT NULL,
  `fieldname` varchar(150) NOT NULL,
  `fieldslug` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmaillistscustomfieldvalues
CREATE TABLE IF NOT EXISTS `tblmaillistscustomfieldvalues` (
  `customfieldvalueid` int NOT NULL AUTO_INCREMENT,
  `listid` int NOT NULL,
  `customfieldid` int NOT NULL,
  `emailid` int NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`customfieldvalueid`),
  KEY `listid` (`listid`),
  KEY `customfieldid` (`customfieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmail_queue
CREATE TABLE IF NOT EXISTS `tblmail_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `cc` text,
  `bcc` text,
  `message` mediumtext NOT NULL,
  `alt_message` mediumtext,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text,
  `attachments` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmanage_leave
CREATE TABLE IF NOT EXISTS `tblmanage_leave` (
  `leave_id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_staff` int NOT NULL,
  `leave_date` int DEFAULT NULL,
  `leave_year` int DEFAULT NULL,
  `accumulated_leave` int DEFAULT NULL,
  `seniority_leave` int DEFAULT NULL,
  `borrow_leave` int DEFAULT NULL,
  `actual_leave` int DEFAULT NULL,
  `expected_leave` int DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmigrations
CREATE TABLE IF NOT EXISTS `tblmigrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmilestones
CREATE TABLE IF NOT EXISTS `tblmilestones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_visible_to_customer` tinyint(1) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `project_id` int NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `milestone_order` int NOT NULL DEFAULT '0',
  `datecreated` date NOT NULL,
  `hide_from_customer` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblmodules
CREATE TABLE IF NOT EXISTS `tblmodules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) NOT NULL,
  `installed_version` varchar(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnewsfeed_comment_likes
CREATE TABLE IF NOT EXISTS `tblnewsfeed_comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postid` int NOT NULL,
  `commentid` int NOT NULL,
  `userid` int NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnewsfeed_posts
CREATE TABLE IF NOT EXISTS `tblnewsfeed_posts` (
  `postid` int NOT NULL AUTO_INCREMENT,
  `creator` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `pinned` int NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnewsfeed_post_comments
CREATE TABLE IF NOT EXISTS `tblnewsfeed_post_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `userid` int NOT NULL,
  `postid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnewsfeed_post_likes
CREATE TABLE IF NOT EXISTS `tblnewsfeed_post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postid` int NOT NULL,
  `userid` int NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnotes
CREATE TABLE IF NOT EXISTS `tblnotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `description` text,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblnotifications
CREATE TABLE IF NOT EXISTS `tblnotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isread` int NOT NULL DEFAULT '0',
  `isread_inline` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `description` text NOT NULL,
  `fromuserid` int NOT NULL,
  `fromclientid` int NOT NULL DEFAULT '0',
  `from_fullname` varchar(100) NOT NULL,
  `touserid` int NOT NULL,
  `fromcompany` int DEFAULT NULL,
  `link` mediumtext,
  `additional_data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbloptions
CREATE TABLE IF NOT EXISTS `tbloptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1132 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpayment_attempts
CREATE TABLE IF NOT EXISTS `tblpayment_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `invoice_id` int NOT NULL,
  `amount` double NOT NULL,
  `fee` double NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpayment_modes
CREATE TABLE IF NOT EXISTS `tblpayment_modes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `show_on_pdf` int NOT NULL DEFAULT '0',
  `invoices_only` int NOT NULL DEFAULT '0',
  `expenses_only` int NOT NULL DEFAULT '0',
  `selected_by_default` int NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpinned_projects
CREATE TABLE IF NOT EXISTS `tblpinned_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblposition_training_question_form
CREATE TABLE IF NOT EXISTS `tblposition_training_question_form` (
  `questionid` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` mediumtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `question_order` int NOT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblprojectdiscussioncomments
CREATE TABLE IF NOT EXISTS `tblprojectdiscussioncomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discussion_id` int NOT NULL,
  `discussion_type` varchar(10) NOT NULL,
  `parent` int DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` text NOT NULL,
  `staff_id` int NOT NULL,
  `contact_id` int DEFAULT '0',
  `fullname` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_mime_type` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblprojectdiscussions
CREATE TABLE IF NOT EXISTS `tblprojectdiscussions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblprojects
CREATE TABLE IF NOT EXISTS `tblprojects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `status` int NOT NULL DEFAULT '0',
  `clientid` int NOT NULL,
  `billing_type` int NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int DEFAULT '0',
  `progress_from_tasks` int NOT NULL DEFAULT '1',
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `contact_notification` int DEFAULT '1',
  `notify_contacts` text,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproject_activity
CREATE TABLE IF NOT EXISTS `tblproject_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL DEFAULT '0',
  `contact_id` int NOT NULL DEFAULT '0',
  `fullname` varchar(100) DEFAULT NULL,
  `visible_to_customer` int NOT NULL DEFAULT '0',
  `description_key` varchar(191) NOT NULL COMMENT 'Language file key',
  `additional_data` text,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproject_files
CREATE TABLE IF NOT EXISTS `tblproject_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `original_file_name` mediumtext,
  `subject` varchar(191) DEFAULT NULL,
  `description` text,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT '0',
  `staffid` int NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `external` varchar(40) DEFAULT NULL,
  `external_link` text,
  `thumbnail_link` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproject_members
CREATE TABLE IF NOT EXISTS `tblproject_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproject_notes
CREATE TABLE IF NOT EXISTS `tblproject_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `content` text NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproject_settings
CREATE TABLE IF NOT EXISTS `tblproject_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproposals
CREATE TABLE IF NOT EXISTS `tblproposals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `content` longtext,
  `addedfrom` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `currency` int NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(40) DEFAULT NULL,
  `assigned` int DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `proposal_to` varchar(191) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `country` int NOT NULL DEFAULT '0',
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '1',
  `status` int NOT NULL,
  `estimate_id` int DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int DEFAULT '1',
  `is_expiry_notified` int NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `processing` text,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblproposal_comments
CREATE TABLE IF NOT EXISTS `tblproposal_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `proposalid` int NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpurchase_option
CREATE TABLE IF NOT EXISTS `tblpurchase_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_activity_log
CREATE TABLE IF NOT EXISTS `tblpur_activity_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_approval_details
CREATE TABLE IF NOT EXISTS `tblpur_approval_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` varchar(45) DEFAULT NULL,
  `approve` varchar(45) DEFAULT NULL,
  `note` text,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `sender` int DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_approval_setting
CREATE TABLE IF NOT EXISTS `tblpur_approval_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `related` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_comments
CREATE TABLE IF NOT EXISTS `tblpur_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  `rel_type` varchar(50) NOT NULL,
  `rel_id` int DEFAULT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_contacts
CREATE TABLE IF NOT EXISTS `tblpur_contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `is_primary` int NOT NULL DEFAULT '1',
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT '1',
  `estimate_emails` tinyint(1) NOT NULL DEFAULT '1',
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT '1',
  `contract_emails` tinyint(1) NOT NULL DEFAULT '1',
  `task_emails` tinyint(1) NOT NULL DEFAULT '1',
  `project_emails` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_emails` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_contracts
CREATE TABLE IF NOT EXISTS `tblpur_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(200) NOT NULL,
  `contract_name` varchar(200) NOT NULL,
  `content` longtext,
  `vendor` int NOT NULL,
  `pur_order` int NOT NULL,
  `contract_value` decimal(15,2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `buyer` int DEFAULT NULL,
  `time_payment` date DEFAULT NULL,
  `add_from` int NOT NULL,
  `signed` int NOT NULL DEFAULT '0',
  `note` longtext,
  `signer` int DEFAULT NULL,
  `signed_date` date DEFAULT NULL,
  `signed_status` varchar(50) DEFAULT NULL,
  `service_category` text,
  `project` int DEFAULT NULL,
  `payment_terms` text,
  `payment_amount` decimal(15,2) DEFAULT NULL,
  `payment_cycle` varchar(50) DEFAULT NULL,
  `department` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_debits
CREATE TABLE IF NOT EXISTS `tblpur_debits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int DEFAULT NULL,
  `debit_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `date_applied` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_debits_refunds
CREATE TABLE IF NOT EXISTS `tblpur_debits_refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `debit_note_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `refunded_on` date DEFAULT NULL,
  `payment_mode` varchar(40) DEFAULT NULL,
  `note` text,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_debit_notes
CREATE TABLE IF NOT EXISTS `tblpur_debit_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendorid` int DEFAULT NULL,
  `deleted_vendor_name` varchar(100) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `date` date DEFAULT NULL,
  `adminnote` text,
  `terms` text,
  `vendornote` text,
  `currency` int DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `total_tax` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `discount_total` decimal(15,2) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) DEFAULT NULL,
  `show_shipping_on_debit_note` tinyint(1) DEFAULT NULL,
  `show_quantity_as` int DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_estimates
CREATE TABLE IF NOT EXISTS `tblpur_estimates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `datesend` datetime DEFAULT NULL,
  `vendor` int NOT NULL,
  `deleted_vendor_name` varchar(100) DEFAULT NULL,
  `pur_request` int DEFAULT NULL,
  `number` int NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `vendornote` text,
  `adminnote` text,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` text,
  `reference_no` varchar(100) DEFAULT NULL,
  `buyer` int NOT NULL DEFAULT '0',
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT '1',
  `show_quantity_as` int NOT NULL DEFAULT '1',
  `pipeline_order` int NOT NULL DEFAULT '0',
  `is_expiry_notified` int NOT NULL DEFAULT '0',
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `make_a_contract` text,
  `currency_rate` decimal(15,6) DEFAULT NULL,
  `from_currency` varchar(20) DEFAULT NULL,
  `to_currency` varchar(20) DEFAULT NULL,
  `shipping_fee` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_estimate_detail
CREATE TABLE IF NOT EXISTS `tblpur_estimate_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pur_estimate` int NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `unit_id` int DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `tax` text,
  `total` decimal(15,2) DEFAULT NULL,
  `total_money` decimal(15,2) DEFAULT NULL,
  `discount_money` decimal(15,2) DEFAULT NULL,
  `discount_%` decimal(15,2) DEFAULT NULL,
  `tax_value` decimal(15,2) DEFAULT NULL,
  `tax_rate` text,
  `tax_name` text,
  `item_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_invoices
CREATE TABLE IF NOT EXISTS `tblpur_invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` int NOT NULL,
  `invoice_number` text,
  `invoice_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  `tax_rate` int DEFAULT NULL,
  `tax` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `contract` int DEFAULT NULL,
  `vendor` int DEFAULT NULL,
  `transactionid` mediumtext,
  `transaction_date` date DEFAULT NULL,
  `payment_request_status` varchar(30) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `vendor_note` text,
  `adminnote` text,
  `terms` text,
  `add_from` int DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `pur_order` int DEFAULT NULL,
  `recurring` int DEFAULT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `cycles` int DEFAULT '0',
  `total_cycles` int DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `is_recurring_from` int DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `add_from_type` varchar(20) DEFAULT NULL,
  `currency` int DEFAULT '0',
  `discount_total` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `currency_rate` decimal(15,6) DEFAULT NULL,
  `from_currency` varchar(20) DEFAULT NULL,
  `to_currency` varchar(20) DEFAULT NULL,
  `shipping_fee` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_invoice_details
CREATE TABLE IF NOT EXISTS `tblpur_invoice_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pur_invoice` int NOT NULL,
  `item_code` varchar(100) DEFAULT NULL,
  `description` text,
  `unit_id` int DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` decimal(15,2) DEFAULT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `tax` text,
  `total` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `discount_money` decimal(15,2) DEFAULT NULL,
  `total_money` decimal(15,2) DEFAULT NULL,
  `tax_value` decimal(15,2) DEFAULT NULL,
  `tax_rate` text,
  `tax_name` text,
  `item_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_invoice_payment
CREATE TABLE IF NOT EXISTS `tblpur_invoice_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pur_invoice` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` longtext,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext,
  `approval_status` int DEFAULT NULL,
  `requester` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_orders
CREATE TABLE IF NOT EXISTS `tblpur_orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pur_order_name` varchar(100) NOT NULL,
  `vendor` int NOT NULL,
  `estimate` int NOT NULL,
  `pur_order_number` varchar(30) NOT NULL,
  `order_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `approve_status` int NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `days_owed` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `addedfrom` int NOT NULL,
  `vendornote` text,
  `terms` text,
  `discount_percent` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `discount_type` varchar(30) DEFAULT NULL,
  `buyer` int NOT NULL DEFAULT '0',
  `status_goods` int NOT NULL DEFAULT '0',
  `number` int DEFAULT NULL,
  `expense_convert` int DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `clients` text,
  `delivery_status` int DEFAULT '0',
  `type` text,
  `project` int DEFAULT NULL,
  `pur_request` int DEFAULT NULL,
  `department` int DEFAULT NULL,
  `tax_order_rate` decimal(15,2) DEFAULT NULL,
  `tax_order_amount` decimal(15,2) DEFAULT NULL,
  `sale_invoice` int DEFAULT NULL,
  `currency` int DEFAULT '0',
  `order_status` varchar(30) DEFAULT NULL,
  `shipping_note` text,
  `currency_rate` decimal(15,6) DEFAULT NULL,
  `from_currency` varchar(20) DEFAULT NULL,
  `to_currency` varchar(20) DEFAULT NULL,
  `shipping_fee` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_order_detail
CREATE TABLE IF NOT EXISTS `tblpur_order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pur_order` int NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `description` text,
  `unit_id` int DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `tax` text,
  `total` decimal(15,2) DEFAULT NULL,
  `discount_%` decimal(15,2) DEFAULT NULL,
  `discount_money` decimal(15,2) DEFAULT NULL,
  `total_money` decimal(15,2) DEFAULT NULL,
  `tax_value` decimal(15,2) DEFAULT NULL,
  `tax_rate` text,
  `tax_name` text,
  `item_name` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_order_payment
CREATE TABLE IF NOT EXISTS `tblpur_order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pur_order` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` longtext,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` text NOT NULL,
  `transactionid` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_request
CREATE TABLE IF NOT EXISTS `tblpur_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pur_rq_code` varchar(45) NOT NULL,
  `pur_rq_name` varchar(100) NOT NULL,
  `rq_description` text,
  `requester` int NOT NULL,
  `department` int NOT NULL,
  `request_date` datetime NOT NULL,
  `status` int DEFAULT NULL,
  `status_goods` int NOT NULL DEFAULT '0',
  `hash` varchar(32) DEFAULT NULL,
  `type` text,
  `project` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `from_items` int DEFAULT '1',
  `subtotal` decimal(15,2) DEFAULT NULL,
  `total_tax` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `sale_invoice` int DEFAULT NULL,
  `compare_note` text,
  `send_to_vendors` text,
  `currency` int DEFAULT '0',
  `currency_rate` decimal(15,6) DEFAULT NULL,
  `from_currency` varchar(20) DEFAULT NULL,
  `to_currency` varchar(20) DEFAULT NULL,
  `sale_estimate` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_request_detail
CREATE TABLE IF NOT EXISTS `tblpur_request_detail` (
  `prd_id` int NOT NULL AUTO_INCREMENT,
  `pur_request` int NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `unit_id` int DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `into_money` decimal(15,2) DEFAULT NULL,
  `inventory_quantity` int DEFAULT '0',
  `item_text` text,
  `tax` text,
  `tax_rate` text,
  `tax_value` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `tax_name` text,
  PRIMARY KEY (`prd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_unit
CREATE TABLE IF NOT EXISTS `tblpur_unit` (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_vendor
CREATE TABLE IF NOT EXISTS `tblpur_vendor` (
  `userid` int unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(200) DEFAULT NULL,
  `vat` varchar(200) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int NOT NULL DEFAULT '0',
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` text,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `leadid` int DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int DEFAULT '0',
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int DEFAULT '0',
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int NOT NULL DEFAULT '0',
  `show_primary_contact` int NOT NULL DEFAULT '0',
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int NOT NULL DEFAULT '1',
  `addedfrom` int NOT NULL DEFAULT '0',
  `category` text,
  `bank_detail` text,
  `payment_terms` text,
  `vendor_code` varchar(100) DEFAULT NULL,
  `return_within_day` int DEFAULT NULL,
  `return_order_fee` decimal(15,2) DEFAULT NULL,
  `return_policies` text,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_vendor_admin
CREATE TABLE IF NOT EXISTS `tblpur_vendor_admin` (
  `staff_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `date_assigned` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_vendor_cate
CREATE TABLE IF NOT EXISTS `tblpur_vendor_cate` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblpur_vendor_items
CREATE TABLE IF NOT EXISTS `tblpur_vendor_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vendor` int NOT NULL,
  `group_items` int DEFAULT NULL,
  `items` int NOT NULL,
  `add_from` int DEFAULT NULL,
  `datecreate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblp_t_form_question_box_description
CREATE TABLE IF NOT EXISTS `tblp_t_form_question_box_description` (
  `questionboxdescriptionid` int NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `boxid` mediumtext NOT NULL,
  `questionid` int NOT NULL,
  `correct` int DEFAULT '1' COMMENT '0: correct 1: incorrect',
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrecords_meta
CREATE TABLE IF NOT EXISTS `tblrecords_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrec_criteria
CREATE TABLE IF NOT EXISTS `tblrec_criteria` (
  `criteria_id` int unsigned NOT NULL AUTO_INCREMENT,
  `criteria_type` varchar(45) NOT NULL,
  `criteria_title` varchar(200) NOT NULL,
  `group_criteria` int DEFAULT NULL,
  `description` text,
  `add_from` int NOT NULL,
  `add_date` date DEFAULT NULL,
  `score_des1` text,
  `score_des2` text,
  `score_des3` text,
  `score_des4` text,
  `score_des5` text,
  PRIMARY KEY (`criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrec_job_position
CREATE TABLE IF NOT EXISTS `tblrec_job_position` (
  `position_id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(200) NOT NULL,
  `position_description` text,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrec_set_transfer_record
CREATE TABLE IF NOT EXISTS `tblrec_set_transfer_record` (
  `set_id` int unsigned NOT NULL AUTO_INCREMENT,
  `send_to` varchar(45) NOT NULL,
  `email_to` text,
  `add_from` int NOT NULL,
  `add_date` date NOT NULL,
  `subject` text NOT NULL,
  `content` text,
  `order` int NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrec_transfer_records
CREATE TABLE IF NOT EXISTS `tblrec_transfer_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(11) DEFAULT NULL,
  `staff_identifi` varchar(20) DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `datecreator` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblrelated_items
CREATE TABLE IF NOT EXISTS `tblrelated_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(30) NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblreminders
CREATE TABLE IF NOT EXISTS `tblreminders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  `date` datetime NOT NULL,
  `isnotified` int NOT NULL DEFAULT '0',
  `rel_id` int NOT NULL,
  `staff` int NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `notify_by_email` int NOT NULL DEFAULT '1',
  `creator` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblroles
CREATE TABLE IF NOT EXISTS `tblroles` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `permissions` longtext,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsales_activity
CREATE TABLE IF NOT EXISTS `tblsales_activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) DEFAULT NULL,
  `rel_id` int NOT NULL,
  `description` text NOT NULL,
  `additional_data` text,
  `staffid` varchar(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsales_channel
CREATE TABLE IF NOT EXISTS `tblsales_channel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel` varchar(150) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsales_channel_detailt
CREATE TABLE IF NOT EXISTS `tblsales_channel_detailt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_product_id` int NOT NULL,
  `product_id` int NOT NULL,
  `sales_channel_id` int NOT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  `department` text,
  `pre_order_product_st_id` int DEFAULT NULL,
  `customer_group` text,
  `customer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblscheduled_emails
CREATE TABLE IF NOT EXISTS `tblscheduled_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `contacts` varchar(197) NOT NULL,
  `cc` text,
  `attach_pdf` tinyint(1) NOT NULL DEFAULT '1',
  `template` varchar(197) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblservices
CREATE TABLE IF NOT EXISTS `tblservices` (
  `serviceid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsessions
CREATE TABLE IF NOT EXISTS `tblsessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsetting_asset_allocation
CREATE TABLE IF NOT EXISTS `tblsetting_asset_allocation` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsetting_training
CREATE TABLE IF NOT EXISTS `tblsetting_training` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_type` int NOT NULL,
  `position_training` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsetting_transfer_records
CREATE TABLE IF NOT EXISTS `tblsetting_transfer_records` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblshared_customer_files
CREATE TABLE IF NOT EXISTS `tblshared_customer_files` (
  `file_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblshift_type
CREATE TABLE IF NOT EXISTS `tblshift_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shift_type_name` varchar(150) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `time_start` date DEFAULT NULL,
  `time_end` date DEFAULT NULL,
  `time_start_work` varchar(50) DEFAULT NULL,
  `time_end_work` varchar(50) DEFAULT NULL,
  `start_lunch_break_time` varchar(50) DEFAULT NULL,
  `end_lunch_break_time` varchar(50) DEFAULT NULL,
  `description` longtext,
  `datecreated` datetime DEFAULT NULL,
  `add_from` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblspam_filters
CREATE TABLE IF NOT EXISTS `tblspam_filters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `rel_type` varchar(10) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblstaff
CREATE TABLE IF NOT EXISTS `tblstaff` (
  `staffid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `facebook` mediumtext,
  `linkedin` mediumtext,
  `phonenumber` varchar(30) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int NOT NULL DEFAULT '0',
  `role` int DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `default_language` varchar(40) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `media_path_slug` varchar(191) DEFAULT NULL,
  `is_not_staff` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `two_factor_auth_enabled` tinyint(1) DEFAULT '0',
  `two_factor_auth_code` varchar(100) DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` text,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(200) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `marital_status` varchar(25) DEFAULT NULL,
  `nation` varchar(25) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `identification` varchar(100) DEFAULT NULL,
  `days_for_identity` date DEFAULT NULL,
  `home_town` varchar(200) DEFAULT NULL,
  `resident` varchar(200) DEFAULT NULL,
  `current_address` varchar(200) DEFAULT NULL,
  `literacy` varchar(50) DEFAULT NULL,
  `orther_infor` text,
  `job_position` int DEFAULT NULL,
  `workplace` int DEFAULT NULL,
  `place_of_issue` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `name_account` varchar(50) DEFAULT NULL,
  `issue_bank` varchar(200) DEFAULT NULL,
  `records_received` longtext,
  `Personal_tax_code` varchar(50) DEFAULT NULL,
  `google_auth_secret` text,
  `team_manage` int DEFAULT '0',
  `staff_identifi` varchar(200) DEFAULT NULL,
  `status_work` varchar(100) DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblstaff_departments
CREATE TABLE IF NOT EXISTS `tblstaff_departments` (
  `staffdepartmentid` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `departmentid` int NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblstaff_permissions
CREATE TABLE IF NOT EXISTS `tblstaff_permissions` (
  `staff_id` int NOT NULL,
  `feature` varchar(40) NOT NULL,
  `capability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblstock_take
CREATE TABLE IF NOT EXISTS `tblstock_take` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` text COMMENT 'the reason stock take',
  `warehouse_id` int DEFAULT NULL,
  `date_stock_take` date DEFAULT NULL,
  `stock_take_code` varchar(100) DEFAULT NULL COMMENT 'số kiểm kê kho',
  `date_add` date DEFAULT NULL,
  `hour_add` date DEFAULT NULL,
  `staff_id` varchar(100) DEFAULT NULL,
  `approval` int DEFAULT '0' COMMENT 'status approval ',
  `addedfrom` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblstock_take_detail
CREATE TABLE IF NOT EXISTS `tblstock_take_detail` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stock_take_id` int NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text,
  `unit_id` text,
  `unit_price` varchar(100) DEFAULT NULL,
  `quantity_stock_take` varchar(100) DEFAULT NULL,
  `quantity_accounting_book` varchar(100) DEFAULT NULL,
  `quantity_change` varchar(100) DEFAULT NULL,
  `handling` text,
  `reason` text,
  `approval` int DEFAULT '0' COMMENT 'status approval ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsubscriptions
CREATE TABLE IF NOT EXISTS `tblsubscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` text,
  `description_in_item` tinyint(1) NOT NULL DEFAULT '0',
  `clientid` int NOT NULL,
  `date` date DEFAULT NULL,
  `terms` text,
  `currency` int NOT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `stripe_tax_id` varchar(50) DEFAULT NULL,
  `tax_id_2` int NOT NULL DEFAULT '0',
  `stripe_tax_id_2` varchar(50) DEFAULT NULL,
  `stripe_plan_id` text,
  `stripe_subscription_id` text NOT NULL,
  `next_billing_cycle` bigint DEFAULT NULL,
  `ends_at` bigint DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `project_id` int NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  `in_test_environment` int DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsurveyresultsets
CREATE TABLE IF NOT EXISTS `tblsurveyresultsets` (
  `resultsetid` int NOT NULL AUTO_INCREMENT,
  `surveyid` int NOT NULL,
  `ip` varchar(40) NOT NULL,
  `useragent` varchar(150) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`resultsetid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsurveys
CREATE TABLE IF NOT EXISTS `tblsurveys` (
  `surveyid` int NOT NULL AUTO_INCREMENT,
  `subject` mediumtext NOT NULL,
  `slug` mediumtext NOT NULL,
  `description` text NOT NULL,
  `viewdescription` text,
  `datecreated` datetime NOT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `send` tinyint(1) NOT NULL DEFAULT '0',
  `onlyforloggedin` int DEFAULT '0',
  `fromname` varchar(100) DEFAULT NULL,
  `iprestrict` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(32) NOT NULL,
  PRIMARY KEY (`surveyid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsurveysemailsendcron
CREATE TABLE IF NOT EXISTS `tblsurveysemailsendcron` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surveyid` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `emailid` int DEFAULT NULL,
  `listid` varchar(11) DEFAULT NULL,
  `log_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblsurveysendlog
CREATE TABLE IF NOT EXISTS `tblsurveysendlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surveyid` int NOT NULL,
  `total` int NOT NULL,
  `date` datetime NOT NULL,
  `iscronfinished` int NOT NULL DEFAULT '0',
  `send_to_mail_lists` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltaggables
CREATE TABLE IF NOT EXISTS `tbltaggables` (
  `rel_id` int NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `tag_id` int NOT NULL,
  `tag_order` int NOT NULL DEFAULT '0',
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltags
CREATE TABLE IF NOT EXISTS `tbltags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltasks
CREATE TABLE IF NOT EXISTS `tbltasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `description` text,
  `priority` int DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int DEFAULT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `is_recurring_from` int DEFAULT NULL,
  `cycles` int NOT NULL DEFAULT '0',
  `total_cycles` int NOT NULL DEFAULT '0',
  `custom_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `billable` tinyint(1) NOT NULL DEFAULT '0',
  `billed` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL DEFAULT '0',
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `milestone` int DEFAULT '0',
  `kanban_order` int DEFAULT '1',
  `milestone_order` int NOT NULL DEFAULT '0',
  `visible_to_client` tinyint(1) NOT NULL DEFAULT '0',
  `deadline_notified` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltaskstimers
CREATE TABLE IF NOT EXISTS `tbltaskstimers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `staff_id` int NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT '0.00',
  `note` text,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltasks_checklist_templates
CREATE TABLE IF NOT EXISTS `tbltasks_checklist_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltask_assigned
CREATE TABLE IF NOT EXISTS `tbltask_assigned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `taskid` int NOT NULL,
  `assigned_from` int NOT NULL DEFAULT '0',
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltask_checklist_items
CREATE TABLE IF NOT EXISTS `tbltask_checklist_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskid` int NOT NULL,
  `description` text NOT NULL,
  `finished` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  `addedfrom` int NOT NULL,
  `finished_from` int DEFAULT '0',
  `list_order` int NOT NULL DEFAULT '0',
  `assigned` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltask_comments
CREATE TABLE IF NOT EXISTS `tbltask_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `taskid` int NOT NULL,
  `staffid` int NOT NULL,
  `contact_id` int NOT NULL DEFAULT '0',
  `file_id` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltask_followers
CREATE TABLE IF NOT EXISTS `tbltask_followers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `taskid` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltaxes
CREATE TABLE IF NOT EXISTS `tbltaxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltemplates
CREATE TABLE IF NOT EXISTS `tbltemplates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `addedfrom` int NOT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltickets
CREATE TABLE IF NOT EXISTS `tbltickets` (
  `ticketid` int NOT NULL AUTO_INCREMENT,
  `adminreplying` int NOT NULL DEFAULT '0',
  `userid` int NOT NULL,
  `contactid` int NOT NULL DEFAULT '0',
  `merged_ticket_id` int DEFAULT NULL,
  `email` text,
  `name` text,
  `department` int NOT NULL,
  `priority` int NOT NULL,
  `status` int NOT NULL,
  `service` int DEFAULT NULL,
  `ticketkey` varchar(32) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text,
  `admin` int DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `lastreply` datetime DEFAULT NULL,
  `clientread` int NOT NULL DEFAULT '0',
  `adminread` int NOT NULL DEFAULT '0',
  `assigned` int NOT NULL DEFAULT '0',
  `staff_id_replying` int DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltickets_pipe_log
CREATE TABLE IF NOT EXISTS `tbltickets_pipe_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` mediumtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltickets_predefined_replies
CREATE TABLE IF NOT EXISTS `tbltickets_predefined_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltickets_priorities
CREATE TABLE IF NOT EXISTS `tbltickets_priorities` (
  `priorityid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltickets_status
CREATE TABLE IF NOT EXISTS `tbltickets_status` (
  `ticketstatusid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isdefault` int NOT NULL DEFAULT '0',
  `statuscolor` varchar(7) DEFAULT NULL,
  `statusorder` int DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblticket_attachments
CREATE TABLE IF NOT EXISTS `tblticket_attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticketid` int NOT NULL,
  `replyid` int DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblticket_replies
CREATE TABLE IF NOT EXISTS `tblticket_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticketid` int NOT NULL,
  `userid` int DEFAULT NULL,
  `contactid` int NOT NULL DEFAULT '0',
  `name` text,
  `email` text,
  `date` datetime NOT NULL,
  `message` text,
  `attachment` int DEFAULT NULL,
  `admin` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_additional_timesheet
CREATE TABLE IF NOT EXISTS `tbltimesheets_additional_timesheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `additional_day` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `timekeeping_type` varchar(50) DEFAULT NULL,
  `timekeeping_value` varchar(45) NOT NULL,
  `approver` int NOT NULL,
  `creator` int NOT NULL,
  `old_timekeeping` varchar(50) DEFAULT NULL,
  `time_in` varchar(45) DEFAULT NULL,
  `time_out` varchar(45) DEFAULT NULL,
  `overtime_setting` int DEFAULT NULL,
  `reason` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_approval_details
CREATE TABLE IF NOT EXISTS `tbltimesheets_approval_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` varchar(45) DEFAULT NULL,
  `approve` varchar(45) DEFAULT NULL,
  `note` text,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `sender` int DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `notification_recipient` longtext,
  `approval_deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_approval_setting
CREATE TABLE IF NOT EXISTS `tbltimesheets_approval_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `related` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  `choose_when_approving` int NOT NULL DEFAULT '0',
  `notification_recipient` longtext,
  `number_day_approval` int DEFAULT NULL,
  `departments` text,
  `job_positions` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_day_off
CREATE TABLE IF NOT EXISTS `tbltimesheets_day_off` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `year` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `remain` varchar(45) DEFAULT NULL,
  `accumulated` varchar(45) DEFAULT NULL,
  `days_off` float DEFAULT '0',
  `type_of_leave` varchar(200) NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_go_bussiness_advance_payment
CREATE TABLE IF NOT EXISTS `tbltimesheets_go_bussiness_advance_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `requisition_leave` int NOT NULL,
  `used_to` varchar(200) DEFAULT NULL,
  `amoun_of_money` varchar(200) DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `advance_payment_reason` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_latch_timesheet
CREATE TABLE IF NOT EXISTS `tbltimesheets_latch_timesheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month_latch` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_leave
CREATE TABLE IF NOT EXISTS `tbltimesheets_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `date_work` date NOT NULL,
  `value` text,
  `type` varchar(45) DEFAULT NULL,
  `add_from` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_log_send_notify
CREATE TABLE IF NOT EXISTS `tbltimesheets_log_send_notify` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sent` int NOT NULL DEFAULT '0',
  `staffid` int NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_option
CREATE TABLE IF NOT EXISTS `tbltimesheets_option` (
  `option_id` int unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(200) NOT NULL,
  `option_val` longtext,
  `auto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_requisition_leave
CREATE TABLE IF NOT EXISTS `tbltimesheets_requisition_leave` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `reason` text,
  `received_date` date DEFAULT NULL,
  `amount_received` text,
  `approver_id` int NOT NULL,
  `followers_id` int DEFAULT NULL,
  `rel_type` int NOT NULL COMMENT '1:Leave 2:Late_early 3:Go_out 4:Go_on_bussiness',
  `status` int DEFAULT '0' COMMENT '0:Create 1:Approver 2:Reject',
  `place_of_business` longtext,
  `type_of_leave` int DEFAULT '0',
  `according_to_the_plan` int DEFAULT '0',
  `handover_recipients` longtext,
  `datecreated` datetime DEFAULT NULL,
  `number_of_days` float DEFAULT NULL,
  `number_of_leaving_day` varchar(45) DEFAULT NULL,
  `type_of_leave_text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_route
CREATE TABLE IF NOT EXISTS `tbltimesheets_route` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `route_point_id` int NOT NULL,
  `date_work` date NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_route_point
CREATE TABLE IF NOT EXISTS `tbltimesheets_route_point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `route_point_address` varchar(400) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `related_to` int NOT NULL,
  `related_id` int NOT NULL,
  `default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_shiftwork_sc
CREATE TABLE IF NOT EXISTS `tbltimesheets_shiftwork_sc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `date_work` date NOT NULL,
  `shift` int NOT NULL,
  `datecreated` datetime DEFAULT NULL,
  `add_from` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_shift_sc
CREATE TABLE IF NOT EXISTS `tbltimesheets_shift_sc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shift_symbol` varchar(45) NOT NULL,
  `time_start_work` varchar(45) NOT NULL,
  `time_end_work` varchar(45) NOT NULL,
  `start_lunch_break_time` varchar(45) NOT NULL,
  `end_lunch_break_time` varchar(45) NOT NULL,
  `late_latency_allowed` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_timekeeper_data
CREATE TABLE IF NOT EXISTS `tbltimesheets_timekeeper_data` (
  `staff_identifi` varchar(25) NOT NULL,
  `time` datetime NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`staff_identifi`,`time`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_timesheet
CREATE TABLE IF NOT EXISTS `tbltimesheets_timesheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `date_work` date NOT NULL,
  `value` text,
  `type` varchar(45) DEFAULT NULL,
  `add_from` int NOT NULL,
  `overtime_setting` int DEFAULT NULL,
  `relate_id` int DEFAULT NULL,
  `relate_type` varchar(25) DEFAULT NULL,
  `latch` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_type_of_leave
CREATE TABLE IF NOT EXISTS `tbltimesheets_type_of_leave` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_valid_ip
CREATE TABLE IF NOT EXISTS `tbltimesheets_valid_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) DEFAULT NULL,
  `enable` int NOT NULL DEFAULT '1',
  `date_creator` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_workplace
CREATE TABLE IF NOT EXISTS `tbltimesheets_workplace` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `workplace_address` varchar(400) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `default` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltimesheets_workplace_assign
CREATE TABLE IF NOT EXISTS `tbltimesheets_workplace_assign` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `workplace_id` int NOT NULL,
  `datecreator` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltodos
CREATE TABLE IF NOT EXISTS `tbltodos` (
  `todoid` int NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `staffid` int NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltracked_mails
CREATE TABLE IF NOT EXISTS `tbltracked_mails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `rel_id` int NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT '0',
  `date_opened` datetime DEFAULT NULL,
  `subject` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltraining_allocation
CREATE TABLE IF NOT EXISTS `tbltraining_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `training_process_id` varchar(100) NOT NULL,
  `staffid` int DEFAULT NULL,
  `training_type` int DEFAULT NULL,
  `date_add` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `training_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltransfer_records_reception
CREATE TABLE IF NOT EXISTS `tbltransfer_records_reception` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `meta` varchar(50) DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbltwocheckout_log
CREATE TABLE IF NOT EXISTS `tbltwocheckout_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) NOT NULL,
  `invoice_id` int NOT NULL,
  `amount` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `attempt_reference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `tbltwocheckout_log_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbluser_auto_login
CREATE TABLE IF NOT EXISTS `tbluser_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `staff` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tbluser_meta
CREATE TABLE IF NOT EXISTS `tbluser_meta` (
  `umeta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint unsigned NOT NULL DEFAULT '0',
  `client_id` bigint unsigned NOT NULL DEFAULT '0',
  `contact_id` bigint unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(191) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblvault
CREATE TABLE IF NOT EXISTS `tblvault` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `server_address` varchar(191) NOT NULL,
  `port` int DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `description` text,
  `creator` int NOT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `share_in_projects` tinyint(1) NOT NULL DEFAULT '0',
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblviews_tracking
CREATE TABLE IF NOT EXISTS `tblviews_tracking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblware_unit_type
CREATE TABLE IF NOT EXISTS `tblware_unit_type` (
  `unit_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `unit_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `unit_symbol` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `order` int DEFAULT NULL,
  `display` int DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `category_id` int DEFAULT NULL,
  `unit_measure_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'reference',
  `bigger_ratio` decimal(15,5) DEFAULT '0.00000',
  `smaller_ratio` decimal(15,5) DEFAULT '0.00000',
  `rounding` decimal(15,5) DEFAULT '0.00000',
  PRIMARY KEY (`unit_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblweb_to_lead
CREATE TABLE IF NOT EXISTS `tblweb_to_lead` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `lead_source` int NOT NULL,
  `lead_status` int NOT NULL,
  `notify_lead_imported` int NOT NULL DEFAULT '1',
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` mediumtext,
  `responsible` int NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL,
  `form_data` mediumtext,
  `recaptcha` int NOT NULL DEFAULT '0',
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `success_submit_msg` text,
  `submit_action` int DEFAULT '0',
  `lead_name_prefix` varchar(255) DEFAULT NULL,
  `submit_redirect_url` mediumtext,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int NOT NULL DEFAULT '1',
  `mark_public` int NOT NULL DEFAULT '0',
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int NOT NULL DEFAULT '0',
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwh_goods_delivery_activity_log
CREATE TABLE IF NOT EXISTS `tblwh_goods_delivery_activity_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  `description` mediumtext,
  `additional_data` text,
  `date` datetime DEFAULT NULL,
  `staffid` int DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwh_order_returns
CREATE TABLE IF NOT EXISTS `tblwh_order_returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rel_id` int DEFAULT NULL,
  `rel_type` varchar(50) NOT NULL COMMENT 'manual, sales_return_order, purchasing_return_order',
  `return_type` varchar(50) DEFAULT NULL COMMENT 'manual, partially, fully',
  `company_id` int DEFAULT NULL,
  `company_name` varchar(500) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `order_number` varchar(500) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `number_of_item` decimal(15,2) DEFAULT '0.00',
  `order_total` decimal(15,2) DEFAULT '0.00',
  `order_return_number` varchar(200) DEFAULT NULL,
  `order_return_name` varchar(500) DEFAULT NULL,
  `fee_return_order` decimal(15,2) DEFAULT '0.00',
  `refund_loyaty_point` int DEFAULT '0',
  `subtotal` decimal(15,2) DEFAULT '0.00',
  `total_amount` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `additional_discount` decimal(15,2) DEFAULT '0.00',
  `adjustment_amount` decimal(15,2) DEFAULT '0.00',
  `total_after_discount` decimal(15,2) DEFAULT '0.00',
  `return_policies_information` text,
  `admin_note` text,
  `approval` int DEFAULT '0',
  `datecreated` datetime DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `currency` int DEFAULT NULL,
  `receipt_delivery_id` int DEFAULT '0',
  `return_reason` longtext,
  `status` varchar(30) DEFAULT 'draft',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwh_order_returns_refunds
CREATE TABLE IF NOT EXISTS `tblwh_order_returns_refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `refunded_on` date DEFAULT NULL,
  `payment_mode` varchar(40) DEFAULT NULL,
  `note` text,
  `amount` decimal(15,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwh_order_return_details
CREATE TABLE IF NOT EXISTS `tblwh_order_return_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_return_id` int NOT NULL,
  `rel_type_detail_id` int DEFAULT NULL,
  `commodity_code` int DEFAULT NULL,
  `commodity_name` text,
  `quantity` decimal(15,2) DEFAULT '0.00',
  `unit_id` int DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT '0.00',
  `sub_total` decimal(15,2) DEFAULT '0.00',
  `tax_id` text,
  `tax_rate` text,
  `tax_name` text,
  `total_amount` decimal(15,2) DEFAULT '0.00',
  `discount` decimal(15,2) DEFAULT '0.00',
  `discount_total` decimal(15,2) DEFAULT '0.00',
  `total_after_discount` decimal(15,2) DEFAULT '0.00',
  `reason_return` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwh_sub_group
CREATE TABLE IF NOT EXISTS `tblwh_sub_group` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sub_group_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sub_group_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `order` int DEFAULT NULL,
  `display` int DEFAULT NULL COMMENT 'display 1: display (yes)  0: not displayed (no)',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwork_shift
CREATE TABLE IF NOT EXISTS `tblwork_shift` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shift_code` varchar(45) NOT NULL,
  `shift_name` varchar(200) NOT NULL,
  `shift_type` varchar(200) NOT NULL,
  `department` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `add_from` int NOT NULL,
  `staff` text,
  `date_create` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `shifts_detail` text NOT NULL,
  `type_shiftwork` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwork_shift_detail
CREATE TABLE IF NOT EXISTS `tblwork_shift_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `work_shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwork_shift_detail_day_name
CREATE TABLE IF NOT EXISTS `tblwork_shift_detail_day_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `day_name` varchar(45) DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `work_shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table demoumbut.tblwork_shift_detail_number_day
CREATE TABLE IF NOT EXISTS `tblwork_shift_detail_number_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `shift_id` int DEFAULT NULL,
  `work_shift_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
