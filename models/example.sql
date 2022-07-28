
SELECT
  t.table_catalog t_catalog, t.table_schema t_schema, t.table_name t_name,
  t.table_type t_type,
  c.column_name c_name,
  c.data_type d_type
FROM "{{ database }}".information_schema.tables t
INNER JOIN "{{ database }}".information_schema.columns c
  on c.table_schema = t.table_schema
  and c.table_name = t.table_name
WHERE t.table_catalog =  '{{ database.upper() }}' 
  and t.table_type in ('BASE TABLE', 'VIEW') and t.table_schema = '{{ schema.upper() }}' and t.table_name = '{{ alias.upper() }}' 
ORDER BY t.table_schema,
 t.table_name;