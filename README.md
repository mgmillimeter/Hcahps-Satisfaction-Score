# HCAHPS Patient Satisfaction Scores: U.S. Hospital Performance Analysis 2019

This project features a _[dashboard](https://public.tableau.com/app/profile/martin.guiller.iii/viz/HCAHPSPatientSatisfactionScores-U_S_HospitalPerformanceAnalysis/Dashboard1)_ built using synthetic data designed to replicate the structure and trends of real-world HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) patient satisfaction survey results.

![Scrnshot_project](https://github.com/user-attachments/assets/a86b4d2d-5dfc-4018-8429-e127cf308c90)

## Summary of Insights

#### Table 1: National Average % of Patients Reporting Positive Experiences in HCAHPS Survey

| **HCAHPS Measure**                                                          | **% of Patients Reporting "Always"** |
|------------------------------------------------------------------------------|---------------------------------------|
| Doctors "always" treated them with courtesy and respect                     | 79.99%                                |
| Nurses "always" treated them with courtesy and respect                      | 79.65%                                |
| Doctors "always" communicated well                                          | 75.18%                                |
| Nurses "always" communicated well                                           | 74.63%                                |
| Doctors "always" listened carefully                                         | 73.83%                                |
| Staff "always" explained new medications                                    | 73.23%                                |
| Nurses "always" listened carefully                                          | 72.34%                                |
| Nurses "always" explained things so they could understand                   | 71.79%                                |
| Doctors "always" explained things so they could understand                  | 71.61%                                |
| Room was "always" clean                                                     | 70.21%                                |
| Patients "always" received bathroom help as soon as they wanted             | 66.48%                                |
| Patients "always" received help as soon as they wanted                      | 65.59%                                |
| Patients "always" received call button help as soon as they wanted          | 64.31%                                |
| Staff "always" explained                                                    | 62.59%                                |
| "Always" quiet at night                                                     | 58.97%                                |
| Staff "always" explained possible side effects                              | 51.85%                                |

---

#### Table 2: Top 10 States with the Highest Percentage of Patients Rating 9 or 10

| **State**            | **% Patients Rating 9 or 10** |
|-----------------------|-------------------------------|
| Wisconsin            | 76%                          |
| Maine                | 75%                          |
| Indiana              | 73%                          |
| New Hampshire        | 73%                          |
| Oregon               | 73%                          |
| Ohio                 | 72%                          |
| Louisiana            | 72%                          |
| Rhode Island         | 72%                          |
| Iowa                 | 71%                          |
| Utah                 | 71%                          |

---

#### Table 3: Bottom 10 States with the Lowest Percentage of Patients Rating 9 or 10

| **State**               | **% Patients Rating 9 or 10** |
|--------------------------|-------------------------------|
| Guam                   | 64%                          |
| New York               | 62%                          |
| District of Columbia   | 62%                          |
| Alaska                 | 61%                          |
| North Dakota           | 60%                          |
| Montana                | 60%                          |
| American Samoa         | 59%                          |
| Virgin Islands         | 59%                          |
| Puerto Rico            | 51%                          |
| Northern Mariana Islands | 49%                        |  

---

#### Table 4: Best Performing Hospitals by Size: HCAHPS Survey (Percentage of Patients Rating 9 or 10)
 
#### _Large Hospitals_
| Provider CCN | Hospital Name                     | Percentage |
|--------------|-----------------------------------|------------|
| 190184       | Citizens Medical Center           | 99%        |
| 390312       | Cancer Treatment Centers of America | 97%      |
| 451349       | Swisher Memorial Hospital         | 95%        |
| 141330       | Hopedale Hospital                 | 93%        |
| 521356       | Bellin Health Oconto Hospital     | 92%        |

#### _Medium Hospitals_
| Provider CCN | Hospital Name                     | Percentage |
|--------------|-----------------------------------|------------|
| 520196       | Oakleaf Surgical Hospital         | 95%        |
| 140100       | Midwestern Region Med Center      | 95%        |
| 101313       | Mariners Hospital                 | 95%        |
| 241327       | Sleepy Eye Municipal Hospital     | 94%        |
| 370234       | Oklahoma Heart Hospital South, LLC| 94%        |

#### _Small Hospitals_
| Provider CCN | Hospital Name                     | Percentage |
|--------------|-----------------------------------|------------|
| 241316       | Bigfork Valley Hospital           | 97%        |
| 351326       | First Care Health Center          | 96%        |
| 370215       | Oklahoma Heart Hospital, LLC      | 95%        |
| 191325       | Lady of the Sea General Hospital  | 95%        |
| 360352       | Surgical Hospital at Southwoods   | 94%        |

---

## Recommendations
  - **Improve Communication and Patient Education:** Train doctors and nurses in active listening and clear communication. Provide accessible materials and digital tools to better explain medications and side effects.
  - **Enhance Timeliness of Care:** Increase staffing during peak hours and implement smart call systems to improve response times for patient needs, such as bathroom assistance and call buttons.
  - **Replicate Best Practices from High-Performing States:** Analyze successful strategies from top states like Wisconsin and Maine. Share and implement these practices nationwide to improve patient satisfaction across the board.
 
## Dataset Limitation:
  - **Synthetic Dataset & Limited Real-World Representation:** The dataset is synthetic and does not reflect real-world patient distributions, healthcare conditions, or behaviors. This limitation means that the analysis may not fully capture the complexities and variances present in actual patient populations, which could impact the accuracy and generalizability of the findings.

---

## Exploratory Data Analysis (EDA) & Data Manipulation Process using PostgreSQL:
  - **Synthetic Hospital Dataset:**
    - **Table 1: hcahps_survey_dataset** - This table contains data from the HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) survey, which measures patients' experiences and satisfaction with hospital care across the United States. It includes hospital information, survey results, patient feedback, and quality comparisons.
    - **Table 2: hospital_beds** - This table provides information about the capacity of hospitals, specifically focusing on the number of beds available at each facility, along with the corresponding hospital identifiers and names.
   
---

This SQL [query](https://github.com/mgmillimeter/Tracking-2022-Flu-Vaccinations-Among-Active-Patients-in-Massachusetts/blob/main/PostgreSQL-Flu%20Shots%20immunizations%202022.sql) The dataset represents U.S. hospital performance and capacity, combining two key sources of information:

HCAHPS Patient Survey Data: Provides insights into patients' experiences and satisfaction with hospital care, including metrics like star ratings, response rates, and national comparisons on areas such as mortality, safety of care, and patient experience.
Hospital Beds Data: Contains information about the number of beds available in each hospital, indicating its capacity.
By linking these datasets, the query enables analysis of the relationship between hospital capacity and patient satisfaction, quality of care, and survey response patterns, offering valuable insights into healthcare performance across the country.

```sql
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
```
---

## Data Sources
- Dataset can be found _[here](https://www.kaggle.com/datasets/abrambeyer/us-hospital-customer-satisfaction-20162020?select=cms_hospital_patient_satisfaction_2019.csv)_

- _Credit:_ https://www.kaggle.com/abrambeyer
    
