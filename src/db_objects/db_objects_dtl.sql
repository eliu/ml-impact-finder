-- Gather counts of custom objects in system.
SELECT obj.object_type, obj.object_name
FROM   dba_objects obj
WHERE  obj.object_type IN ('FUNCTION', 'PROCEDURE', 'PACKAGE BODY', 'TRIGGER', 'VIEW', 'MATERIALIZED VIEW') 
AND    ( obj.OBJECT_NAME LIKE 'XX%' OR 
         obj.OBJECT_NAME LIKE 'EMR%' OR
         obj.OBJECT_NAME LIKE 'CUX%' )
AND    obj.last_ddl_time >= to_date('2013-11-01', 'YYYY-MM-DD')
AND    obj.status = 'VALID'
AND    EXISTS(SELECT NULL
              FROM   DBA_DEPENDENCIES DEP
              WHERE  DEP.NAME = OBJ.OBJECT_NAME
              AND    DEP.TYPE = OBJ.OBJECT_TYPE
              AND    DEP.REFERENCED_TYPE = 'TABLE'
              AND    (DEP.REFERENCED_NAME LIKE '%\_TL' ESCAPE '\' OR
                      DEP.REFERENCED_NAME IN ('FND_LOOKUP_VALUES')))
ORDER BY obj.object_type, obj.object_name
;
