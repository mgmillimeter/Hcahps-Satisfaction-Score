SELECT 
    -- Convert facility_id to a 6-character zero-padded string for consistent formatting
    LPAD(CAST(hs.facility_id AS INTEGER)::TEXT, 6, '0') AS hospital_id,
    
    -- Select basic hospital information
    hs.facility_name,
    hs.address,
    hs.city,
    hs.state,
    hs.zip_code,
    hs.county_name,
    hs.phone_number,
    
    -- Select HCAHPS survey-specific fields
    hs.hcahps_measure_id,
    hs.hcahps_question,
    hs.hcahps_answer_description,
    hs.patient_survey_star_rating,
    hs.patient_survey_star_rating_footnote,
    
    -- Include the number of beds from the joined table
    bd.number_of_beds,
    
    -- Include detailed HCAHPS response data
    hs.hcahps_answer_percent,
    hs.hcahps_answer_percent_footnote,
    hs.hcahps_linear_mean_value,
    hs.number_of_completed_surveys,
    hs.number_of_completed_surveys_footnote,
    hs.survey_response_rate_percent,
    hs.survey_response_rate_percent_footnote,
    
    -- Format the start and end dates to a standard date format
    TO_DATE(hs.start_date, 'MM/DD/YYYY') AS date_start,
    TO_DATE(hs.end_date, 'MM/DD/YYYY') AS date_end,
    
    -- Include additional hospital details
    hs.year,
    hs.hospital_type,
    hs.hospital_ownership,
    hs.hospital_overall_rating,
    hs.hospital_overall_rating_footnote,
    
    -- Include various national comparison metrics from HCAHPS data
    hs.mortality_national_comparison,
    hs.mortality_national_comparison_footnote,
    hs.safety_of_care_national_comparison,
    hs.safety_of_care_national_comparison_footnote,
    hs.readmission_national_comparison,
    hs.readmission_national_comparison_footnote,
    hs.patient_experience_national_comparison,
    hs.patient_experience_national_comparison_footnote,
    hs.effectiveness_of_care_national_comparison,
    hs.effectiveness_of_care_national_comparison_footnote,
    hs.timeliness_of_care_national_comparison,
    hs.timeliness_of_care_national_comparison_footnote,
    hs.efficient_use_of_medical_imaging_national_comparison,
    hs.efficient_use_of_medical_imaging_national_comparison_footnote
FROM 
    -- Specify the schema and table for HCAHPS survey data
    "postgres"."Hospital_Data".hcahps_survey AS hs
    
    -- Perform a LEFT JOIN with the hospital_beds table to include bed information
    LEFT JOIN "postgres"."Hospital_Data".hospital_beds AS bd
    ON CAST(hs.facility_id AS INTEGER) = CAST(bd.hospital_id AS INTEGER); -- Match records using facility_id and hospital_id
