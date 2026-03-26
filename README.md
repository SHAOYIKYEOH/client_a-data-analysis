# Project Background
(To protect business confidentiality, all sensitive information in this project has been anonymized)

Founder in 2008, Sky office is an importer & distributor in all type of office automation & equipment serving customers throughtout Malaysia.

The company has a significant amount of sales and demographic data that was previously underutilized due to it doesnt have a data strategy team. This project aims to create a dashboard and analyze the data to undercover insights that can help Sky office improve its business.

Insights and recommendations are provided based on the following key areas
- **Sales Trends:** An evaluation of historical sales patterns.
- **Product Performance:** An analysis of how different product impact overall sales.
- **Regional Comparison:** An analysis of regional impact on sales.

The raw data and issues log can be downloaded here [link](data/raw_data.csv). 

The SQL queries used to clean, organize and prepare the data for this analysis are available here [link].

An interactive Looker Studio dashboard can be found here [link].


# Data Structure & Initial Checks

Sky's database structure seen consists of following attributes: Date, Doc_No, Item_Code, Item_Description, Company_Name, Area, Qty, UOM, Unit_Price, DISC(Discount), Subtotal. With a total row count of 84,074 records

<img width="204" height="239" alt="image" src="https://github.com/user-attachments/assets/9e87b91b-502e-4d38-9746-b2f240ea901e" />

The SQL queries used to clean and inspect the data can be found here.

The raw data issues log can be found here.


# Executive Summary

### Overview of Findings
After the peak in late 2022, the company experienced a downward sales trend, including a significant decline in early 2025. The strong performance in 2022 was likely driven by a post-pandemic "return-to-work" procurement surge. Moreover the decline from 2023 to 2025 can be attributed to a natural pullback following the conclusion of corporate purchasing cycles. 

<img width="1057" height="558" alt="image" src="https://github.com/user-attachments/assets/6c2950c4-d02c-4669-ac88-732bc6094b00" />

- **Trend Reversal:** Despite a consistent downtrend from 2023 to 2025, Quarter-to-Date (QTD) revenue is up 29.3% YoY (as of Feb 13, 2026), successfully breaking the three-year downward trend observed since 2023.
- **Value over Volume:** While order frequency has slowed, the revenue surge is supported by highe value transactions.
- **Key Contributors:** The increase in revenue is driven by high-cost units (e.g., SK3100C1 Shredder) and "buy-to-order" transactions.
- **Revenue Porfolio:** About 70% of revenue comes from the security & access control and office equipment categories. Within office equipment, paper shredders make up over 60% of the segment every year. Similarly, in the security & access control category, time recorders and fingerprint systems are the main products, contributing around 45% to 50% of total revenue.

<img width="1018" height="573" alt="image" src="https://github.com/user-attachments/assets/c3f02d53-0a46-4e2e-b3b4-e4a629bb9fc6" />

### Recommendations (Human + AI Analysis):

-- **Recurring Revenue Model:** Office equipment — led by paper shredders at 60% of the category — currently relies on a one-and-done sales model. This leaves the company vulnerable to corporate procurement cycles and pullback periods. Offering subscription services for heavy-duty products could stabilize cash flow by converting one-off hardware sales into long-term service relationships.

-- **"BTO" as a Premium Consultancy Service:** A significant portion of revenue relies heavily on buy-to-order (BTO) transactions. BTO transactions are not just "sales" — they are specialized solutions that competitors aren't stocking. Rebranding the BTO process as consulting service, differentiated offering rather than a routine order.

