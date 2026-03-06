# Project Background
Founder in 2008, ITS office is an importer & distributor in all type of office automation & equipment serving customers throughtout Malaysia.

The company has a significant amount of sales and demographic data that was previously underutilized due to it doesnt have a data strategy team. This project aims to create a dashboard and analyze the data to undercover insights that can help ITS office improve its business.

Insights and recommendations are provided based on the following key areas
- **Sales Trends:** An evaluation of historical sales patterns.
- **Product Performance:** An analysis of how different product impact overall sales.
- **Regional Comparison:** An analysis of regional impact on sales.

The raw data issues log can be downloaded here [link]. 

The SQL queries used to clean, organize and prepare the data for this analysis are available here [link].

An interactive Looker Studio dashboard can be found here [link].


# Data Structure & Initial Checks

ITS's database structure seen consists of following attributes: Date, Doc_No, Item_Code, Item_Description, Company_Name, Area, Qty, UOM, Unit_Price, DISC(Discount), Subtotal. With a total row count of 84,074 records

<img width="216" height="240" alt="image" src="https://github.com/user-attachments/assets/fc70e393-9a08-402b-90e7-098667708493" />

The SQL queries used to clean and inspect the data can be found here.
The raw data issues log can be found here.


# Executive Summary

### Overview of Findings
After the peak in late 2022, the company experienced a downward sales trend, including a significant decline in early 2025. The strong performance in 2022 was likely driven by a post-pandemic "return-to-work" procurement surge. Moreover the decline from 2023 to 2025 can be attributed to a natural pullback following the conclusion of corporate purchasing cycles. On the other hand, as of February 13, 2026, our Quarter-to-Date (QTD) revenue has increased by 29.3% compared to the same period last year.



[Visualization, including a graph of overall trends or snapshot of a dashboard]



# Insights Deep Dive
### Category 1:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
