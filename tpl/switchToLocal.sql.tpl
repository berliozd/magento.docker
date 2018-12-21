
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/' where path like '%secure/base_url%';
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/media/' where path like '%secure/base_skin_url%';
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/skin/' where path like '%secure/base_media_url%';
update core_config_data set value = 'http://V_SERVER_NAME:V_APACHE_PORT/js/' where path like '%secure/base_js_url%';

/*
Anonymization of email adresses
 */

/* Orders */
UPDATE `sales_flat_order`
SET `customer_email` = CONCAT('test__', `customer_email`)
WHERE `customer_email` NOT LIKE 'test__%';

UPDATE `sales_flat_order_address`
SET `email` = CONCAT('test__', `email`)
WHERE `email` NOT LIKE 'test__%';

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
Disable caches
 */
UPDATE `core_cache_option` SET value = 0;

/*
Switch Paypal TPE to TEST MODE
 */
UPDATE `core_config_data` SET `value` = '1' WHERE `path` = 'payment/paypal_express/debug';

/*
Clear AW_Followupemail
 */
DELETE FROM `aw_followup_queue`;

/*
Clean log tables
 */
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `log_customer`;
TRUNCATE TABLE `log_quote`;
TRUNCATE TABLE `log_summary`;
TRUNCATE TABLE `log_url`;
TRUNCATE TABLE `log_url_info`;
TRUNCATE TABLE `log_visitor`;
TRUNCATE TABLE `log_visitor_info`;
TRUNCATE TABLE `log_visitor_online`;
SET FOREIGN_KEY_CHECKS=1;

/*
Clean misc tables
 */
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE `aw_core_logger`;
TRUNCATE TABLE `dataflow_batch_export`;
TRUNCATE TABLE `dataflow_batch_import`;
TRUNCATE TABLE `dataflow_profile_history`;
TRUNCATE TABLE `report_viewed_product_index`;
TRUNCATE TABLE `report_viewed_product_aggregated_daily`;
TRUNCATE TABLE `report_viewed_product_aggregated_monthly`;
TRUNCATE TABLE `report_viewed_product_aggregated_yearly`;
TRUNCATE TABLE `report_compared_product_index`;
TRUNCATE TABLE `report_event`;
TRUNCATE TABLE `sales_bestsellers_aggregated_daily`;
TRUNCATE TABLE `sales_bestsellers_aggregated_monthly`;
TRUNCATE TABLE `sales_bestsellers_aggregated_yearly`;
TRUNCATE TABLE `index_event`;
TRUNCATE TABLE `index_process_event`;
SET FOREIGN_KEY_CHECKS=1;

/** Update admin passwords to 'password123' */
UPDATE `admin_user`
SET `password` = 'dc750f78f57596c4f217529effb211a7:IguhmWG9HxXVZ0r5gcJXKoH1RWTIlCnG';
UPDATE `admin_user`
SET username = 'admin' WHERE username = 'coolrz';
