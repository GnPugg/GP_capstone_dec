with source as (
    select * from {{ ref('stg_competitions') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['competition_id']) }} as competition_key,
    competition_id,
    competition_name,
    competition_type
from source
