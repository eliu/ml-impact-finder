-- Find source code of cutsom folder
SELECT * FROM (
SELECT DISTINCT d.doc_name, b.ba_name, b.ba_description, o.obj_type, o.obj_name,
       s.seg_sequence,
       s.seg_chunk1 || s.seg_chunk2 || s.seg_chunk3 || s.seg_chunk4 sql_stmt
  FROM eul4_us.eul5_documents    d,
       eul4_us.eul5_elem_xrefs   x,
       eul4_us.eul5_expressions  e,
       eul4_us.eul5_objs         o, -- Folders 
       eul4_us.eul5_segments     s, -- Sql source
       eul4_us.eul5_ba_obj_links l, -- Links between ba and folder
       eul4_us.eul5_bas          b  -- BA
 WHERE b.ba_id= l.bol_ba_id
   AND l.bol_obj_id = o.obj_id
   AND s.seg_cuo_id = o.obj_id
   AND o.obj_id = e.it_obj_id
   AND e.exp_id = x.ex_to_id
   AND x.ex_to_type = 'ITE'
   AND x.ex_from_type = 'DOC'
   AND x.ex_from_id = d.doc_id
 --  AND o.obj_name = '&Custom_Folder_Name'
) t
WHERE t.sql_stmt LIKE '%\_TL%' ESCAPE '\' OR
      t.sql_stmt LIKE '%FND_LOOKUP_VALUES%'
ORDER BY
      ba_name,
      obj_name,
      seg_sequence,
      sql_stmt
