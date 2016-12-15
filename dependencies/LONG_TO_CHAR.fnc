CREATE OR REPLACE FUNCTION LONG_TO_CHAR(IN_ROWID      ROWID,
                                        IN_OWNER      VARCHAR,
                                        IN_TABLE_NAME VARCHAR,
                                        IN_COLUMN     VARCHAR2)
  RETURN VARCHAR AS
  TEXT_C1 VARCHAR2(32767);
  SQL_CUR VARCHAR2(2000);
  --
BEGIN
  SQL_CUR := 'select ' || IN_COLUMN || ' from
' || IN_OWNER || '.' || IN_TABLE_NAME || ' where rowid =
' || CHR(39) || IN_ROWID || CHR(39);
  --dbms_output.put_line (sql_cur);
  EXECUTE IMMEDIATE SQL_CUR
    INTO TEXT_C1;

  TEXT_C1 := SUBSTR(TEXT_C1, 1, 4000);
  RETURN TEXT_C1;
EXCEPTION
  WHEN OTHERS THEN
    RETURN '_TL';
END;
/
