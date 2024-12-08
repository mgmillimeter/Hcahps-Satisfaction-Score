# HCAHPS Patient Satisfaction Scores: U.S. Hospital Performance Analysis 2019

## Table of Contents

I. [Project Background](#project-background)

II. [Data Structure Overview](#data-structure-overview)

III. [Executive Summary](#executive-summary)

IV. [Recommendations](#recommendations)

V. [References](#references)

---

## I. Project Background
HCAHPS Insights, established to improve patient care and satisfaction, focuses on analyzing hospital performance based on national survey data. The project evaluates key metrics, including communication, responsiveness, and care quality, with rankings provided by state and hospital size.

The analysis leverages a substantial dataset, highlighting state-level performance patterns and ownership impact. By thoroughly analyzing this data, the project uncovers actionable insights aimed at enhancing healthcare service delivery and patient outcomes.

Insights and recommendations are provided on the following key areas:
- **_Percent of Patients Rating Hospital 9 or 10_**: Measures the overall satisfaction, indicating the percentage of patients who gave their hospital the highest ratings for their experience.
- **_Percent Difference from Cohort Mean by Question_**: Compares how individual hospitals perform against the cohort average for specific survey questions, highlighting strengths and weaknesses.
- **_Cohort Hospital Difference Spread_**: Shows the range of satisfaction scores within a group of hospitals, indicating variability in patient experiences across the cohort.
- **_Hospital Ownership Types & Satisfaction_**: Examines how different hospital ownership types (e.g., for-profit, non-profit, government) impact patient satisfaction, focusing on top ratings (9 or 10).

## II. Data Structure Overview

HCAHPS survey dataset as seen below consists of 2 tables: hcahps_survey, hospital_beds, with a total row count of 339,977 records.
![ERD_2](https://github.com/user-attachments/assets/5448d307-a464-47ba-891f-4291aa256eec)

Before analysis, dataset checks were conducted to ensure data quality and understand the structure of the data. These checks helped identify issues, validate key fields, and prepare the data for analysis. 

The SQL Queries can be found [here](https://github.com/mgmillimeter/Hcahps-Satisfaction-Score/blob/main/hcahps_survey_dataset.sql).

The Exploratory Data Analysis (EDA) is mainly done on Tableau. You can download and view it [here](https://public.tableau.com/app/profile/martin.guiller.iii/viz/U_S_HCAHPSPatientsSatisfactionScore/Dashboard1).


## III. Executive Summary
#### Overview of Findings ####

The analysis highlights key differences in patient satisfaction across hospitals. There are notable variations in the percentage of patients giving high ratings (9 or 10), reflecting overall satisfaction levels. Some hospitals perform better or worse than the average on specific survey questions, pointing to areas of strength and improvement. The spread of satisfaction scores within hospital groups shows varying patient experiences, indicating inconsistencies in care. Lastly, hospital ownership plays a role in satisfaction, with non-profit hospitals generally receiving higher ratings than government or for-profit hospitals.

Below is the overview page from the Tableau Dashboad. The entire interactive dashboard can be downloaded [here](https://public.tableau.com/app/profile/martin.guiller.iii/viz/U_S_HCAHPSPatientsSatisfactionScore/Dashboard1).
![Dashboard 1](https://github.com/user-attachments/assets/a8b8a516-aaf9-4672-85f2-136989bc16a4)

#### Percent of Patients Rating Hospital 9 or 10 ####
- The overall percentage of patients rating their hospital experience as 9 or 10 varies significantly across facilities, indicating disparities in patient satisfaction levels ranging from 99% down to 19%.

- Hospitals with higher ratings are likely excelling in key patient-centered factors such as communication, which has a nationwide average of 74.62% satisfaction. However, areas like cleanliness and responsiveness fall below 71%, with the lowest satisfaction being in staff communication about potential side effects, which only receives a 51.85% satisfaction rate.

#### Percent Difference from Cohort Mean by Question ####

- Positive Differences: Hospitals exceeding 15% above the cohort mean or the national average often stand out in areas such as staff communication, quietness of the environment, or timely assistance, indicating strong operational and cultural practices.

- Negative Differences: Hospitals with substantial negative deviations from the national average (more than negative 10% on average) struggled in areas like discharge planning, room cleanliness, or explaining treatments effectively to patients.

- This difference highlights not just the overall satisfaction but pinpoints areas where individual hospitals excel or lag compared to their peers, offering insights into specific operational strengths and weaknesses.

 #### Cohort Hospital Difference Spread #### 

 ![image](https://github.com/user-attachments/assets/db58f750-0ea8-4c25-8f87-c79fcdb61b61)
 
 - The spread of scores within a cohort (group of hospitals) reveals significant variability in patient satisfaction.
     - For example, some cohorts may show a narrow range of satisfaction scores, indicating consistent patient experiences across facilities.
     - Conversely, a wide spread in scores indicates variability, with some hospitals performing exceptionally well and others lagging significantly behind.
  
 - This variability suggests inconsistencies in how patient care standards are implemented across the cohort, which could be due to differences in staff training, resources, or patient demographics.

#### Hospital Ownership Types & Satisfaction ####
![image](https://github.com/user-attachments/assets/fd6877f8-987f-40fd-a199-d57cbdd9ef1a)

- Patient satisfaction levels vary significantly by hospital ownership type
  - Non-Profit Hospitals: These facilities, particularly voluntary non-profits, generally have higher ratings (9 or 10) which is 5.95% more than the Government Type Hospitals. This could be attributed to their focus on community service and reinvestment of profits into patient care.
  - Government Hospitals: State, local, and federal government hospitals tend to have lower ratings, likely reflecting operational challenges such as budget constraints, aging infrastructure, and staffing shortages.
  - For-Profit Hospitals: While these hospitals aim for operational efficiency, their focus on financial performance might limit investments in patient-centered services, resulting in slightly lower satisfaction ratings compared to non-profits.
 - The type of ownership appears to correlate with patient satisfaction, reflecting different priorities and operational models that impact the patient experience.

---

## IV. Recommendations
  - **Percent of Patients Rating Hospital 9 or 10:** Focus on improving communication with patients, especially about potential side effects, where satisfaction is just 51.85%. Training staff on clear and empathetic communication can help raise overall satisfaction closer to the 74.62% national average for this category.

  - **Percent Difference from Cohort Mean by Question:** Target areas with large negative gaps from the cohort average, such as discharge planning and cleanliness, which fall below 71%. Small improvements of even 5-10% in these areas can make a big difference in closing the satisfaction gap.
  
  - **Cohort Hospital Difference Spread:** Reduce inconsistencies within hospital groups by standardizing practices across facilities. For instance, if the satisfaction range is 99% to 19%, focus on bringing lower-performing hospitals closer to the group's median by sharing best practices.

  - **Hospital Ownership Types & Satisfaction:** For government hospitals, which score 5.95% lower than non-profits on average, address challenges like staffing shortages, improving staff communications and resource constraints by allocating more funding and improving efficiency in operations.

---

## V. References

- Dataset Source: [**U.S. Hospital Customer Satisfaction 2016-2020**](https://www.kaggle.com/datasets/abrambeyer/us-hospital-customer-satisfaction-20162020?select=cms_hospital_patient_satisfaction_2019.csv)


