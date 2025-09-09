# Hotel Booking Analysis

## Executive Summary

This project applies SQL-driven data cleaning, transformation, and analysis to a hotel booking dataset of over 42,000 records and 32 fields. Key booking patterns and cancellation drivers were uncovered, including seasonal peaks, lead-time risk segments, and geographic hotspots. The insights inform targeted strategies to reduce cancellations, optimize revenue management, and enhance guest satisfaction.

## Business Problem

High cancellation rates erode hotel revenues and disrupt operational planning. Understanding when, why, and by whom bookings are canceled enables hoteliers to refine policies, personalize offers, and stabilize occupancy. This analysis quantifies cancellation trends and booking behaviors to guide data-driven decision making.

## Methodology

An end-to-end workflow was built in MySQL Workbench. The raw Kaggle dataset was imported into a `hotel_booking` database, then cleaned via SQL updates to handle missing values, correct data types, and construct a true `arrival_date` field. Analytical queries computed metrics such as monthly cancellation rates, average length of stay, country-level booking volumes, lead-time buckets, month-over-month growth, and cumulative booking totals. Results were exported to CSV and visualized in Excel, then compiled into a structured report.

## Skills and Tools

- SQL (MySQL Workbench) for data cleaning, transformation, and querying  
- Excel for charting and visual storytelling  
- Microsoft Word for professional report composition  

## Results

- Total bookings by hotel type: City Hotel vs. Resort Hotel volume comparison  
- Cancellation rate by month: seasonal peaks above 40 percent in January and early summer  
- Average length of stay: 4.32 nights at resorts vs. 2.97 at city hotels  
- Top 10 booking countries: PRT, GBR, FRA, ESP, DEU, ITA, IRL, BEL, BRA, NLD  
- Lead-time impact: “90+ days” bookings show cancellation rates above 50 percent  
- Booking rank by country: UK and Spain lead, emerging demand in China and Israel  
- Month-over-month growth: highest surge in January 2016, pronounced volatility  
- Cumulative bookings: consistent upward trajectory from July 2015 to August 2017  

## Business Recommendations

- Introduce flexible deposit or penalty structures for long lead-time reservations  
- Promote extended-stay packages at resort properties to capitalize on higher average stays  
- Target marketing spend in top-performing source countries and emerging markets  
- Align promotional campaigns with low-cancellation months and reinforce policies in high-risk periods  
- Implement dynamic pricing adjustments ahead of seasonal peaks to balance occupancy and revenue  
