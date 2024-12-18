select 
    team_id, 
    team_name, 
    year_founded, 
    venue,  
    team_address
from {{ ref('stg_teams') }}




