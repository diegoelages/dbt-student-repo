with raw_hosts as (select * from {{ source('airbnb', 'hosts') }})
select 
	ID as host_id,
	NAME as host_name,
	IS_SUPERHOST as is_superhost,
	CREATED_AT as created_at,
	UPDATED_AT as updated_at
from raw_hosts    