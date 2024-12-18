
with venue_data as (
    -- Reference the seed data loaded from venuecapacity.csv
    select
        Venue as venue,  
        Capacity as venue_capacity  
    from {{ ref('venuecapacity') }}  -- Referencing the seed here
)

select
    venue,
    venue_capacity
from venue_data
