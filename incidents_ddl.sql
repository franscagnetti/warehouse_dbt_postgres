drop table if exists public.incidents;

create table if not exists public.incidents (
    incident_number text,
    exposure_number integer,
    id text,
    address text,
    incident_date timestamp,
    call_number text,
    alarm_dttm timestamp,
    arrival_dttm timestamp,
    close_dttm text,
    city text,
    zipcode text,
    battalion text,
    station_area text,
    box text,
    suppression_units integer,
    suppression_personnel integer,
    ems_units integer,
    ems_personnel integer,
    other_units integer,
    other_personnel integer,
    first_unit_on_scene text,
    estimated_property_loss integer,
    estimated_contents_loss integer,
    fire_fatalities integer,
    fire_injuries integer,
    civilian_fatalities integer,
    civilian_injuries integer,
    number_of_alarms integer,
    primary_situation text,
    mutual_aid text,
    action_taken_primary text,
    action_taken_secondary text,
    action_taken_other text,
    detector_alerted_occupants text,
    property_use text,
    area_of_fire_origin text,
    ignition_cause text,
    ignition_factor_primary text,
    ignition_factor_secondary text,
    heat_source text,
    item_first_ignited text,
    human_factors_associated_with_ignition text,
    structure_type text,
    structure_status text,
    floor_of_fire_origin integer,
    fire_spread text,
    no_flame_spead text,
    number_of_floors_with_minimum_damage integer,
    number_of_floors_with_significant_damage integer,
    number_of_floors_with_heavy_damage integer,
    number_of_floors_with_extreme_damage integer,
    detectors_present text,
    detector_type text,
    detector_operation text,
    detector_effectiveness text,
    detector_failure_reason text,
    automatic_extinguishing_system_present text,
    automatic_extinguishing_sytem_type text,
    automatic_extinguishing_sytem_perfomance text,
    automatic_extinguishing_sytem_failure_reason text,
    number_of_sprinkler_heads_operating integer,
    supervisor_district text,
    neighborhood_district text,
    point point
);