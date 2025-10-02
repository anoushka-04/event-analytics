# Event Management Analytics SQL Project

A comprehensive event analytics mini-project built with SQLite, inspired by analytics case studies but fully tailored for event management. This project demonstrates SQL skills in schema design, data modeling, and business analysis.

## Tables

- **Events:** Stores event info (name, type, date, venue, capacity)
- **Attendees:** Records attendee data and sign-up date
- **TicketSales:** Ticket purchases by attendee and event (with quantity)
- **MarketingSpend:** Simulated marketing investments per attendee

## Features

- Total tickets sold and unique attendees per event (event performance)
- Capacity alerts: Find events close to sold out
- RFM analysis: Recency, frequency, and ticket size for segmentation
- Per-attendee marketing ROI calculation
- Monthly ticket sales trends
- Returning and churned attendees
- Average order value and frequently attended event pairs

## Usage

1. Create the schema with `schema.sql`
2. Insert sample data from `sample_data.sql`
3. Run analytics queries from `analytics_queries.sql`
4. All queries work directly in SQLite CLI or compatible tools

_This project provides a template for similar analytics applications and can be extended for more complex real-world datasets._
