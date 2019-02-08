
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/' where path like '%secure/base_url%';
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/skin/' where path like '%secure/base_skin_url%';
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/media/' where path like '%secure/base_media_url%';

update core_config_data set value = 'develop' where path = 'easygento_instancereminder/instance_reminder/instance';


/*
Anonymization of email adresses
 */

/* Customers */
UPDATE `customer_entity`
SET `email` = CONCAT('test__', `email`)
WHERE `email` NOT LIKE 'test__%';

/* Newsletter subscribers */
UPDATE `newsletter_subscriber`
SET `subscriber_email` = CONCAT('test__', `subscriber_email`)
WHERE `subscriber_email` NOT LIKE 'test__%';


DELETE FROM `core_config_data` WHERE `path` = 'admin/url/custom';
DELETE FROM `core_config_data` WHERE `path` = 'admin/url/custom_path';
DELETE FROM `core_config_data` WHERE `path` = 'admin/url/use_custom';
DELETE FROM `core_config_data` WHERE `path` = 'admin/url/use_custom_path';
INSERT INTO `core_config_data` (`scope`, `scope_id`, `path`, `value`) VALUES ('default', 0, 'admin/url/custom', '');
INSERT INTO `core_config_data` (`scope`, `scope_id`, `path`, `value`) VALUES ('default', 0, 'admin/url/use_custom', '0');

/*
Remove any cookie related configuration
 */
DELETE FROM `core_config_data` WHERE `path` = 'web/cookie/cookie_domain';

/*
Disable Google Analytics/GTM/Trackings
*/
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'google/analytics/active';
UPDATE `core_config_data` SET `value` = NULL WHERE `path` = 'google/analytics/account';

/*
Misc
 */
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'dev/css/merge_css_files';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'dev/js/merge_files';
UPDATE `core_config_data` SET `value` = '' WHERE `path` = 'dev/restrict/allow_ips';

/*
Switch Adyen TPE to TEST MODE
 */
UPDATE `core_config_data` SET `value` = 'Y' WHERE `path` = 'payment/adyen_abstract/demoMode';
UPDATE `core_config_data` SET `value` = 'kdc-test' WHERE `path` = 'payment/adyen_abstract/notification_username';

/*
Switch Paypal TPE to TEST MODE
 */
UPDATE `core_config_data` SET `value` = '1' WHERE `path` = 'payment/paypal_express/debug';


/*
Switch Algolia index to local one
 */
UPDATE `core_config_data` SET `value` = 'local_' WHERE `path` = 'algoliasearch/credentials/index_prefix';

/*
Disable Lengow
 */
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lenexport/global/active_store';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lenexport/global/autoexport_newproduct';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lenexport/performances/usesavefile';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lenexport/performances/active_cron';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lensync/orders/active_store';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lensync/orders/processing_fee';
UPDATE `core_config_data` SET `value` = '0' WHERE `path` = 'lensync/performances/active_cron';
UPDATE `core_config_data` SET `value` = '1' WHERE `path` = 'lensync/performances/debug';

/*
Clean misc tables
 */
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `report_viewed_product_index`;
TRUNCATE TABLE `report_viewed_product_aggregated_daily`;
TRUNCATE TABLE `report_viewed_product_aggregated_monthly`;
TRUNCATE TABLE `report_viewed_product_aggregated_yearly`;
TRUNCATE TABLE `report_compared_product_index`;
TRUNCATE TABLE `report_event`;
TRUNCATE TABLE `sales_bestsellers_aggregated_daily`;
TRUNCATE TABLE `sales_bestsellers_aggregated_monthly`;
TRUNCATE TABLE `sales_bestsellers_aggregated_yearly`;
SET FOREIGN_KEY_CHECKS=1;

/** Update admin passwords to 'password123' */
UPDATE `admin_user`
SET `password` = 'e47d2bb0da4e53c2cf2fe0453b46b67df84a8a56f675c413e727277e0b09234a:3XlpvlQmrU5E1H5KmnNaCeq1Xs8tCpGc:1';
UPDATE `admin_user`
SET username = 'admin' WHERE username = 'coolrz';
