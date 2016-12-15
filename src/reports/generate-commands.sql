SELECT APP.APPLICATION_NAME,
       PROG.USER_CONCURRENT_PROGRAM_NAME,
       EXE.EXECUTABLE_NAME,
       EXE.EXECUTION_FILE_NAME,
       APP.BASEPATH,
       'echo ">>>' || EXE.EXECUTION_FILE_NAME || '.rdf | grep ''_TL''' || '"; ' ||
       'cat $' || APP.BASEPATH || '/reports/US/' || EXE.EXECUTION_FILE_NAME || '.rdf | grep ''_TL''' || '; ' || 
       'cat $' || APP.BASEPATH || '/reports/US/' || EXE.EXECUTION_FILE_NAME || '.rdf | grep ''FND_LOOKUP_VALUES'''
FROM   FND_EXECUTABLES_VL EXE,
       FND_CONCURRENT_PROGRAMS_VL PROG,
       FND_APPLICATION_VL         APP
WHERE  EXE.APPLICATION_ID = PROG.EXECUTABLE_APPLICATION_ID
AND    EXE.EXECUTABLE_ID = PROG.EXECUTABLE_ID
AND    PROG.EXECUTABLE_APPLICATION_ID = APP.APPLICATION_ID
AND    PROG.EXECUTION_METHOD_CODE = 'P'
AND    PROG.ENABLED_FLAG = 'Y'
AND    ( PROG.USER_CONCURRENT_PROGRAM_NAME LIKE 'XX%' OR
         PROG.USER_CONCURRENT_PROGRAM_NAME LIKE 'CUX%' OR
         PROG.USER_CONCURRENT_PROGRAM_NAME LIKE 'EMR%' OR
         PROG.CONCURRENT_PROGRAM_NAME LIKE 'XX%' OR
         PROG.CONCURRENT_PROGRAM_NAME LIKE 'CUX%' OR
         PROG.CONCURRENT_PROGRAM_NAME LIKE 'EMR%' )
ORDER BY 
      APP.APPLICATION_NAME,
      EXE.EXECUTION_FILE_NAME
