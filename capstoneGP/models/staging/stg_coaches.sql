SELECT
    coach:id AS coach_id,
    name AS team_name,
    coach:name AS coach_name,
    coach:contract.start AS contract_start_date,
    coach:contract.until AS contract_end_date,
    coach:dateOfBirth AS coach_date_of_birth,
    coach:nationality AS coach_nationality,
    
FROM {{ source('serieaA_data', 'serieA') }}


