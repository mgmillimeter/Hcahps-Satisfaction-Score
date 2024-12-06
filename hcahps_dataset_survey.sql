/* HCAHPS SURVEY DATA EXPLORATION */

-- Normalize hospital capacity data to clean and prepare for analysis
WITH norm_beds AS (
    SELECT 
        -- Standardize facility_id to a 6-digit string by padding with zeros
        LPAD(CAST(facility_id AS INTEGER)::TEXT, 6, '0') AS facility_id, 
        hospital_name,
        
        -- Convert start and end date columns to DATE format for consistency
        TO_DATE(date_start, 'MM/DD/YYYY') AS start_date,
        TO_DATE(date_end, 'MM/DD/YYYY') AS end_date,
        
        -- Safely cast the number_of_beds column to INTEGER
        -- Handles cases where the value is 'NULL' or empty by converting them to NULL
        CASE 
            WHEN number_of_beds = 'NULL' OR number_of_beds = '' THEN NULL 
            ELSE CAST(number_of_beds AS INTEGER) 
        END AS number_of_beds
    FROM 
        "Hospital_Data".hospital_capacity
)

-- Main query to retrieve and join hospital capacity and HCAHPS survey data
SELECT 
    -- Standardize hospital_id to a 6-digit string for consistency
    LPAD(CAST(facility_id AS INTEGER)::TEXT, 6, '0') AS hospital_id,
    
    -- Retrieve hospital metadata
    facility_name,
    address,
    city,
    state,
    zip_code,
    county_name,
    phone_number,
    
    -- Include normalized number_of_beds from the normalized dataset
    bd.number_of_beds,
    
    -- Include HCAHPS survey data
    hcahps_measure_id,
    hcahps_question,
    hcahps_answer_description,
    hcahps_answer_percent,
    hcahps_answer_percent_footnote,
    number_of_completed_surveys,
    number_of_completed_surveys_footnote,
    survey_response_rate_percent,
    survey_response_rate_percent_footnote,
    
    -- Include the year of the survey and hospital metadata
    year,
    hospital_type,
    hospital_ownership,
    
    -- Include normalized start and end dates for the survey
    TO_DATE(start_date, 'MM/DD/YYYY') AS date_start,
    TO_DATE(end_date, 'MM/DD/YYYY') AS date_end

FROM "Hospital_Data".hcahps_survey AS hs

-- Perform a LEFT JOIN to include number_of_beds from the normalized hospital_beds dataset
-- Ensure all survey data is retained even if bed count data is missing
LEFT JOIN "postgres"."Hospital_Data".hospital_beds AS bd
ON CAST(hs.facility_id AS INTEGER) = CAST(bd.hospital_id AS INTEGER)

-- Filter out rows where the survey response percentage is NULL
WHERE hcahps_answer_percent IS NOT NULL
