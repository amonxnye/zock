
-- comments

CREATE TABLE `#PFIX#_comments` (
  `id` int(11) NOT NULL auto_increment,
  `time` double NOT NULL default '0',
  `title` tinytext collate utf8_unicode_ci,
  `text` text collate utf8_unicode_ci,
  `user` int(11) NOT NULL default '0',
  `event` int(11) NOT NULL default '0',
  `parent_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;


-- events


CREATE TABLE `#PFIX#_events` (
  `id` int(2) NOT NULL auto_increment,
  `name` text collate utf8_unicode_ci NOT NULL,
  `deadline` double NOT NULL default '0',
  `currency` varchar(11) collate utf8_unicode_ci NOT NULL default 'chf',
  `stake_mode` enum('none','fix','permatch') collate utf8_unicode_ci NOT NULL default 'none',
  `match_nb` varchar(11) collate utf8_unicode_ci default '0',
  `stake` float NOT NULL default '0',
  `stake_back` enum('no','yes') collate utf8_unicode_ci NOT NULL default 'yes',
  `round` float NOT NULL default '0',
  `bet_on` enum('results','toto') collate utf8_unicode_ci NOT NULL default 'results',
  `score_input_type` enum('results','toto') collate utf8_unicode_ci NOT NULL default 'results',
  `bet_until` varchar(7) collate utf8_unicode_ci NOT NULL default '0',
  `p_correct` int(11) default NULL,
  `p_diff` int(11) default NULL,
  `p_almost` int(11) default NULL,
  `p_wrong` int(11) default NULL,
  `jp_fraction_or_fix` enum('fraction','fix') collate utf8_unicode_ci NOT NULL default 'fix',
  `jp_fraction` varchar(11) collate utf8_unicode_ci default '0',
  `jp_fix` int(11) default '0',
  `jp_distr_algorithm` enum('lin','exp','fix') collate utf8_unicode_ci NOT NULL default 'lin',
  `jp_distr_exp_value` varchar(11) collate utf8_unicode_ci default '0',
  `jp_distr_fix_shares` varchar(11) collate utf8_unicode_ci default '0',
  `users_approved` text collate utf8_unicode_ci,
  `users_waiting` text collate utf8_unicode_ci,
  `users_denied` text collate utf8_unicode_ci,
  `users_paid` text collate utf8_unicode_ci,
  `users_reimbursed` text collate utf8_unicode_ci,
  `public` int(1) NOT NULL default '1',
  `active` int(1) NOT NULL default '-1',
  `ko_matches` enum('no','yes','only') collate utf8_unicode_ci NOT NULL default 'yes',
  `enable_tie` enum('no','yes') collate utf8_unicode_ci NOT NULL default 'no',
  `ap_score` enum('addall','addone') collate utf8_unicode_ci NOT NULL default 'addall',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table of events' AUTO_INCREMENT=1 ;


-- lang

CREATE TABLE IF NOT EXISTS `#PFIX#_lang` (
  `label` tinytext collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- questions and asnwers

CREATE TABLE IF NOT EXISTS `#PFIX#_qa_questions` (
  `id` int(11) NOT NULL auto_increment,
  `time` double NOT NULL,
  `event_id` int(11) NOT NULL,
  `matchday_id` int(11) default NULL,
  `question` text NOT NULL,
  `possibilities` text NOT NULL,
  `points` text NOT NULL,
  `answer` text default NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `#PFIX#_qa_bets` (
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer` text default NULL,
  PRIMARY KEY (q_id,u_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- messages


CREATE TABLE IF NOT EXISTS `#PFIX#_messages` (
  `id` int(11) NOT NULL auto_increment,
  `author` int(11) NOT NULL,
  `receivers` tinytext collate utf8_unicode_ci,
  `read` tinytext collate utf8_unicode_ci,
  `time` double NOT NULL,
  `title` tinytext collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;


-- settings


CREATE TABLE IF NOT EXISTS `#PFIX#_settings` (
  `setting` tinytext collate utf8_unicode_ci NOT NULL,
  `value` tinytext collate utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `#PFIX#_settings` (`setting`, `value`) VALUES
('email', ''),
('admins', '1:'),
('formlines', '12'),
('style', 'zock'),
('style_forusers', 'zock:'),
('account_type', 'Account'),
('account_details', 'xx-xxx-xxx.xx'),
('account_holder', 'My Name\r\nMy Street\r\nMy ZIP-Code and Town\r\nFuther Info'),
('notify_newaccount', 'true'),
('functionalSMTP', 'false'),
('site_url', ''),
('notify_participate', 'true'),
('notify_withdraw', 'true'),
('notification_system', 'internal');

-- users

CREATE TABLE IF NOT EXISTS `#PFIX#_users` (
  `id` int(11) NOT NULL auto_increment,
  `login` tinytext collate utf8_unicode_ci NOT NULL,
  `pw` tinytext collate utf8_unicode_ci NOT NULL,
  `email` tinytext collate utf8_unicode_ci NOT NULL,
  `name` text collate utf8_unicode_ci,
  `famname` text collate utf8_unicode_ci,
  `lang` text collate utf8_unicode_ci NOT NULL,
  `style` varchar(11) collate utf8_unicode_ci NOT NULL default 'zock',
  `text` text collate utf8_unicode_ci,
  `picture` text collate utf8_unicode_ci,
  `account_type` text collate utf8_unicode_ci,
  `account_details` text collate utf8_unicode_ci,
  `account_holder` text collate utf8_unicode_ci,
  `home_comments` int(11) NOT NULL default '4',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;



-- lang (content, last because so long)


INSERT INTO `#PFIX#_lang` (`label`) VALUES
('admin_content'),
('admin_events_activate'),
('admin_events_activatedialog'),
('admin_events_activatefirst'),
('admin_events_active'),
('admin_events_addemptymatches'),
('admin_events_addnew'),
('admin_events_adduser'),
('admin_events_approve'),
('admin_events_approved_message'),
('admin_events_approved_subject'),
('admin_events_changecompetitor'),
('admin_events_competitorchangeto'),
('admin_events_competitortochange'),
('admin_events_currency'),
('admin_events_deadline'),
('admin_events_deadlineover'),
('admin_events_deny'),
('admin_events_edit'),
('admin_events_enoughadds'),
('admin_events_home'),
('admin_events_howmanyemptymatches'),
('admin_events_inactive'),
('admin_events_installevent'),
('admin_events_matchday'),
('admin_events_matches_content'),
('admin_events_matches_title'),
('admin_events_name'),
('admin_events_nomatches'),
('admin_events_public'),
('admin_events_results_title'),
('admin_events_round'),
('admin_events_score'),
('admin_events_settings_title'),
('admin_events_special'),
('admin_events_settings_stake_permatch'),
('admin_events_time'),
('admin_events_title'),
('admin_events_usersapproved'),
('admin_events_usersdenied'),
('admin_events_userswaiting'),
('admin_events_visitor'),
('admin_events_wait'),
('admin_lang_addnew'),
('admin_lang_editbelow'),
('admin_lang_listall'),
('admin_lang_listalluncompleted'),
('admin_lang_listlanguncompleted'),
('admin_lang_nextempty'),
('admin_lang_previousempty'),
('admin_lang_title'),
('admin_settings_bank_account_text'),
('admin_settings_bank_account_text2'),
('admin_settings_bank_account_text1'),
('admin_settings_description'),
('admin_settings_descriptiontext'),
('admin_settings_formlines'),
('admin_settings_formlinestext'),
('admin_settings_lang'),
('admin_settings_name'),
('admin_settings_nametext'),
('admin_settings_style'),
('admin_settings_styletext'),
('admin_settings_title'),
('admin_title'),
('comments_answer'),
('comments_comment'),
('comments_commenttitle'),
('comments_participatefirst'),
('comments_reply'),
('comments_title'),
('error_attention'),
('error_commentsave'),
('error_content'),
('error_doesnotparticipate'),
('error_filledform'),
('error_login'),
('error_menu'),
('error_myprofile_password'),
('error_names'),
('error_notinevent'),
('error_register'),
('error_register_exists'),
('error_register_save'),
('error_site'),
('error_title'),
('eventinfo_cup_phase'),
('eventinfo_deadline_day_before'),
('eventinfo_deadline_toolate'),
('eventinfo_finalaccount'),
('eventinfo_finalaccount_gainplusjp'),
('eventinfo_gain_nobodycorrect'),
('eventinfo_points_correct'),
('eventinfo_points_almost'),
('eventinfo_gain_correcttip'),
('eventinfo_gain_correcttips'),
('eventinfo_group_phase'),
('eventinfo_jackpot'),
('eventinfo_jackpot_distributeon'),
('eventinfo_jackpot_linformula'),
('eventinfo_jackpot_expformula'),
('eventinfo_jackpot_samerank'),
('eventinfo_overview'),
('eventinfo_penalty_decision'),
('eventinfo_points'),
('eventinfo_precise_tip'),
('eventinfo_rules'),
('eventinfo_sealofapproval'),
('eventinfo_stake'),
('eventinfo_stakepermatch'),
('eventinfo_staketotal'),
('footer_contact'),
('footer_server_time'),
('general_and'),
('general_bank_account'),
('general_bettingOffice'),
('general_by'),
('general_cancel'),
('general_defeat'),
('general_edit'),
('general_eg'),
('general_famname'),
('general_furtherevents'),
('general_goback'),
('general_goforward'),
('general_hello'),
('general_id'),
('general_langchange'),
('general_language'),
('general_maximize'),
('general_minimize'),
('general_name'),
('general_no'),
('general_nomatches'),
('general_page'),
('general_publicevents'),
('general_read'),
('general_redirect'),
('general_save'),
('general_savechanges'),
('general_savednotok'),
('general_savedok'),
('general_show_info'),
('general_thislanguage'),
('general_tie'),
('general_time_at'),
('general_updating'),
('general_upload'),
('general_victory'),
('general_who'),
('general_yes'),
('general_yourevents'),
('home_content'),
('home_events'),
('home_fun'),
('home_noevents'),
('home_title'),
('home_welcome'),
('login_content'),
('login_title'),
('login_yourlogin'),
('login_yourpw'),
('loginhome_content'),
('loginhome_newcomments'),
('loginhome_noevent'),
('loginhome_title'),
('loginhome_yourevent'),
('loginhome_yourevents'),
('logout_content'),
('logout_title'),
('myprofile_appearance_nopicture'),
('myprofile_appearance_picture'),
('myprofile_appearance_text'),
('myprofile_appearance_title'),
('myprofile_content'),
('myprofile_password_content'),
('myprofile_password_new'),
('myprofile_password_old'),
('myprofile_password_title'),
('myprofile_settings_approved'),
('myprofile_settings_changeemail'),
('myprofile_settings_content'),
('myprofile_settings_denied'),
('myprofile_settings_email_notify'),
('myprofile_settings_eventinfo'),
('myprofile_settings_open'),
('myprofile_settings_participate'),
('myprofile_settings_retire'),
('myprofile_settings_staketopay'),
('myprofile_settings_title'),
('myprofile_settings_waiting'),
('myprofile_settings_wiringcomment'),
('myprofile_title'),
('mytips_participatefirst'),
('mytips_sametip'),
('mytips_tendency'),
('mytips_tip'),
('mytips_tips'),
('mytips_title'),
('overview_content'),
('overview_jackpot'),
('overview_noevents'),
('overview_onlyme'),
('overview_summary'),
('ranking_correcttips'),
('overview_summaryall'),
('overview_title'),
('participants_content'),
('participants_noevents'),
('participants_nousers'),
('participants_title'),
('ranking_gain'),
('ranking_jackpotshare'),
('ranking_points'),
('ranking_provisorygain'),
('ranking_rank'),
('ranking_title'),
('register_content'),
('register_email'),
('register_emailsubject'),
('register_ok'),
('register_title'),
('register_username'),
('general_normalview'),
('general_largeview'),
('general_monday'),
('general_tuesday'),
('general_wednesday'),
('general_friday'),
('general_thursday'),
('general_saturday'),
('general_sunday'),
('general_write'),
('ranking_nexttips'),
('general_bettinggameover'),
('participants_correcttips'),
('participants_closetips'),
('participants_wrongtips'),
('login_rememberme'),
('eventinfo_gain_tojackpot'),
('ranking_almosttips'),
('ranking_wrongtips'),
('ranking_waitfortips'),
('admin_events_pointdistr'),
('admin_events_pointdistr_correct'),
('admin_events_pointdistr_diff'),
('admin_events_pointdistr_almost'),
('admin_events_pointdistr_wrong'),
('admin_events_settings_stake_fix'),
('admin_events_settings_stakemode_none'),
('admin_events_settings_stakemode_fix'),
('admin_events_settings_stakemode_permatch'),
('myprofile_settings_bank_account_intro'),
('myprofile_settings_participatereally'),
('myprofile_settings_profilesettings'),
('myprofile_settings_persdetails'),
('myprofile_settings_withdrawreally'),
('admin_messages_title'),
('general_send'),
('admin_messages_internal'),
('admin_messages_receivers'),
('general_none'),
('general_add'),
('admin_messages_singleusers'),
('admin_messages_newmessage'),
('general_readparticipe'),
('general_content'),
('admin_messages_system'),
('admin_messages_notitle'),
('admin_messages_nocontent'),
('admin_messages_noreceivers'),
('myprofile_settings_preferredlanguage'),
('myprofile_settings_commentnumber'),
('admin_settings_bank_account_text3'),
('admin_events_stake'),
('admin_events_settings_matchnb'),
('admin_events_settings_jackpotmode_fraction'),
('admin_events_jackpotexp'),
('admin_events_jackpot_fraction'),
('admin_events_jackpot_fix'),
('admin_events_distr'),
('admin_events_distralgorithm'),
('admin_events_settings_distr_lin'),
('admin_events_settings_distr_exp'),
('admin_events_firstjackpotfixfield'),
('admin_events_fixshares'),
('admin_events_expshares'),
('admin_events_beton'),
('admin_events_betonexp'),
('admin_events_toto'),
('admin_events_pointdistr_toto'),
('admin_events_komatchesexp'),
('general_only'),
('admin_events_tietough'),
('admin_events_afterpenalty'),
('admin_events_afterpenalty_addall'),
('admin_events_afterpenalty_addone'),
('eventinfo_gain_stakeback'),
('general_team'),
('eventinfo_nostake'),
('eventinfo_fixstake'),
('ranking_totalgain'),
('eventinfo_beton_toto'),
('eventinfo_beton_toto_1'),
('eventinfo_beton_toto_2'),
('eventinfo_beton_toto_x'),
('eventinfo_matches_both_types'),
('eventinfo_inallmatches'),
('eventinfo_in_matches'),
('eventinfo_tournamentmatches'),
('eventinfo_komatches'),
('eventinfo_allpossible'),
('eventinfo_tieno'),
('eventinfo_tietough'),
('eventinfo_afterpenalties'),
('eventinfo_afterpenalties_one'),
('eventinfo_afterpenalties_all'),
('general_minute'),
('general_minutes'),
('general_minute_s'),
('general_hour'),
('general_hours'),
('general_hour_s'),
('general_day'),
('general_days'),
('general_day_s'),
('eventinfo_bet_until'),
('eventinfo_thefirstmatch'),
('eventinfo_match'),
('eventinfo_points_diff'),
('eventinfo_points_wrong'),
('login_forgotpassword'),
('login_senddata'),
('login_userdatasubject'),
('login_userdatamail'),
('login_userdatasent'),
('error_nouserwiththisemail'),
('error_nofunctionalsmtp'),
('general_writetoadmin'),
('error_register_alreadyaccount'),
('error_register_logintoolong'),
('login_askfordata'),
('admin_settings_siteurl'),
('admin_settings_siteurltext'),
('admin_settings_notifications'),
('admin_settings_notificationstext'),
('admin_settings_notify_participate'),
('admin_settings_notify_newaccount'),
('admin_settings_notify_withdraw'),
('register_emailhere'),
('general_notification'),
('register_newaccount'),
('register_newaccounttext'),
('myprofile_settings_notifywithdraw'),
('myprofile_settings_notifywithdrawtxt'),
('myprofile_settings_notifyparticipate'),
('myprofile_settings_notifyparticipatetxt'),
('admin_settings_smtpactivated'),
('admin_settings_modifysmtp'),
('admin_settings_smtpexp'),
('admin_settings_smtpserver'),
('admin_settings_smtplogin'),
('admin_settings_fromaddress'),
('admin_settings_fromaddressexp'),
('admin_settings_smtpport'),
('admin_settings_smtpportexp'),
('admin_settings_smtpdisactivated'),
('admin_settings_mailnotsent'),
('admin_settings_mailsent'),
('admin_settings_testemail_subject'),
('admin_settings_testemail_txt'),
('general_contains'),
('general_filter'),
('general_filterverb'),
('error_filter_emptyresults'),
('general_is'),
('ranking_difftips'),
('general_monday_short'),
('general_tuesday_short'),
('general_wednesday_short'),
('general_thursday_short'),
('general_friday_short'),
('general_saturday_short'),
('general_sunday_short'),
('admin_events_arrangematchdays'),
('ranking_showingxoutofx'),
('ranking_showrankinguntil'),
('general_match'),
('general_date'),
('admin_events_stakeback'),
('admin_events_stakebacknotpossible'),
('admin_events_betuntil'),
('admin_events_betuntilexp'),
('general_before'),
('admin_events_bettinggameinitiation'),
('admin_events_nextstep'),
('admin_events_nextstepdialog'),
('admin_events_displayinfo'),
('eventinfo_finalaccount_jp'),
('eventinfo_jackpot_floored'),
('eventinfo_jackpot_fixformula'),
('admin_events_err_invalid_name'),
('admin_events_err_invalid_date'),
('admin_events_err_invalid_matchnb'),
('admin_events_err_invalid_stake'),
('admin_events_err_invalid_currency'),
('admin_events_err_invalid_round'),
('admin_events_err_invalid_fraction'),
('admin_events_err_invalid_jackpotfix'),
('admin_events_err_invalid_jackpotfixshares'),
('admin_events_err_invalid_expshare'),
('admin_events_err_invalid_betuntil'),
('admin_events_err_invalid_pcorrect'),
('admin_events_err_invalid_pdiff'),
('admin_events_err_invalid_palmost'),
('admin_events_err_invalid_pwrong'),
('admin_events_createevent'),
('admin_events_createtemplate'),
('admin_events_modeselection'),
('admin_events_scheduleactivation'),
('admin_events_fromphase3'),
('admin_events_phase3text'),
('admin_events_komatch'),
('admin_events_showeventlist'),
('admin_events_inputtypeexp'),
('error_incorrectmatchnb'),
('admin_events_existantmatchesremoved'),
('eventinfo_finalaccount_points');

