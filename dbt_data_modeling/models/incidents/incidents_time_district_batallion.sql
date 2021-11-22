{{ config(materialized='table') }}

with incidents_grouped_table as (

    select 
        date(incident_date) incident_day,
        battalion, 
        neighborhood_district,
        count(*) as total_incidents
    from 
        {{ source('postgres', 'incidents') }}
    group by
        date(incident_date), battalion, neighborhood_district
    order by 1, 2, 3
)

select 
    *
from 
    incidents_grouped_table