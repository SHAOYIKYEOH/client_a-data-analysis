# Project Background
Founder in 2008, Sky office is an importer & distributor in all type of office automation & equipment serving customers throughtout Malaysia.

The company has a significant amount of sales and demographic data that was previously underutilized due to it doesnt have a data strategy team. This project aims to create a dashboard and analyze the data to undercover insights that can help Sky office improve its business.

Insights and recommendations are provided based on the following key areas
- **Sales Trends:** An evaluation of historical sales patterns.
- **Product Performance:** An analysis of how different product impact overall sales.
- **Regional Comparison:** An analysis of regional impact on sales.

The raw data issues log can be downloaded here [link]. 

The SQL queries used to clean, organize and prepare the data for this analysis are available here [link].

An interactive Looker Studio dashboard can be found here [link].


# Data Structure & Initial Checks

Sky's database structure seen consists of following attributes: Date, Doc_No, Item_Code, Item_Description, Company_Name, Area, Qty, UOM, Unit_Price, DISC(Discount), Subtotal. With a total row count of 84,074 records

<img width="216" height="240" alt="image" src="https://github.com/user-attachments/assets/fc70e393-9a08-402b-90e7-098667708493" />

The SQL queries used to clean and inspect the data can be found here.
The raw data issues log can be found here.


# Executive Summary

### Overview of Findings
After the peak in late 2022, the company experienced a downward sales trend, including a significant decline in early 2025. The strong performance in 2022 was likely driven by a post-pandemic "return-to-work" procurement surge. Moreover the decline from 2023 to 2025 can be attributed to a natural pullback following the conclusion of corporate purchasing cycles. 

<img width="1192" height="620" alt="image" src="https://github.com/user-attachments/assets/a66cde49-c3fc-45e4-838d-3e294586a67d" />

- **Trend Reversal:** Despite a consistent downtrend from 2023 to 2025, Quarter-to-Date (QTD) revenue is up 29.3% YoY (as of Feb 13, 2026), successfully breaking the three-year downward trend observed since 2023.
- **Value over Volume:** While order frequency has slowed, the revenue surge is supported by highe value transactions.
- **Key Contributors:** The increase in revenue is driven by high-cost units (e.g., SK3100C1 Shredder) and "buy-to-order" transactions.

