SELECT app.application_name,
       alr.alert_name,
       LONG_TO_CHAR(alr.ROWID, 'APPS', 'ALR_ALERTS', 'SQL_STATEMENT_TEXT') sql_stmt
FROM   alr_alerts         alr,
       fnd_application_vl app
WHERE  alr.application_id = app.application_id
--AND    alr.enabled_flag = 'Y'
AND    ( alr.alert_name LIKE 'XX%'  OR
         alr.alert_name LIKE 'CUX%' OR
         alr.alert_name LIKE 'EMR%' )
AND    ( LONG_TO_CHAR(alr.ROWID, 'APPS', 'ALR_ALERTS', 'SQL_STATEMENT_TEXT')
         LIKE '%\_TL%' ESCAPE '\' OR
         LONG_TO_CHAR(alr.ROWID, 'APPS', 'ALR_ALERTS', 'SQL_STATEMENT_TEXT')
         LIKE '%FND_LOOKUP_VALUES%' )
