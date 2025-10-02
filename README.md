# Event Management Analytics SQL Project

A comprehensive event analytics mini-project built with SQLite, inspired by analytics case studies but fully tailored for event management. This project demonstrates SQL skills in schema design, data modeling, and business analysis.

## Tables

- **Events:** Stores event info (name, type, date, venue, capacity)
- **Attendees:** Records attendee data and sign-up date
- **TicketSales:** Ticket purchases by attendee and event (with quantity)
- **MarketingSpend:** Simulated marketing investments per attendee

## Features

This project includes the following analytics:

1. Total tickets sold and unique attendees per event
2. Capacity alerts for events nearing full capacity
3. RFM analysis: Recency, Frequency, and Monetary (ticket size) for attendee segmentation
4. Per-attendee marketing ROI calculation
5. Monthly ticket sales trends
6. Returning attendees analysis
7. Churned attendees identification
8. Average order value calculation
9. Analysis of frequently attended event pairs


## Usage

1. Create the schema with `schema.sql`
2. Insert sample data from `sample_data.sql`
3. Run analytics queries from `analytics_queries.sql`
4. All queries work directly in SQLite CLI or compatible tools

_This project provides a template for similar analytics applications and can be extended for more complex real-world datasets._
