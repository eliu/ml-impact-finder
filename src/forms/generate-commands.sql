SELECT APP.APPLICATION_NAME,
       FRM.FORM_NAME,
       FRM.USER_FORM_NAME,
       FRM.DESCRIPTION,
       'echo ">>> Checking ' || FRM.FORM_NAME || '.fmb' || '"; ' ||
       'frmcmp_batch Userid=apps/apps Forms_Doc=YES Module=$' || APP.BASEPATH || '/forms/' || FRM.FORM_NAME || '.fmb ' ||
       'Output_File=./' || FRM.FORM_NAME || '.txt' command 
FROM   FND_FORM_VL FRM,
       FND_APPLICATION_VL APP
WHERE  APP.APPLICATION_ID = FRM.APPLICATION_ID
AND    ( FRM.FORM_NAME LIKE 'XX%'  OR 
         FRM.FORM_NAME LIKE 'CUX%' OR 
         FRM.FORM_NAME LIKE 'EMR%' )
AND    EXISTS(
       SELECT NULL
       FROM   FND_FORM_FUNCTIONS_VL FUN
       WHERE  FUN.FORM_ID = FRM.FORM_ID)
