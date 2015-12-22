#!/bin/bash
mysql -h HOST -u USER -pPASSWORD  DATABASE <'be_groups.sql'
mysql -h HOST -u USER -pPASSWORD  DATABASE <'be_sessions.sql'
mysql -h HOST -u USER -pPASSWORD  DATABASE <'be_users.sql'
mysql -h HOST -u USER -pPASSWORD  DATABASE <'tx_staticinfotables_hotlist.sql'
mysql -h HOST -u USER -pPASSWORD  DATABASE <'tx_templavoila_datastructure.sql'
mysql -h HOST -u USER -pPASSWORD  DATABASE <'tx_templavoila_tmplobj.sql'
