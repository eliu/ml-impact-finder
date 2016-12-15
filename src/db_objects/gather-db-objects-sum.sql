-- Gather counts of custom objects in system.
SELECT obj.object_type/*, obj.status*/, COUNT(*)
FROM   dba_objects obj
WHERE  obj.object_type IN ('FUNCTION', 'PROCEDURE', 'PACKAGE BODY', 'TRIGGER', 'VIEW', 'MATERIALIZED VIEW') 
AND    ( obj.OBJECT_NAME LIKE 'XX%' OR 
         obj.OBJECT_NAME LIKE 'EMR%' OR
         obj.OBJECT_NAME LIKE 'CUX%' )
AND    obj.last_ddl_time >= to_date('2013-11-01', 'YYYY-MM-DD')
AND    obj.status = 'VALID'
GROUP BY obj.object_type/*, obj.status*/
ORDER BY obj.object_type/*, obj.status*/
