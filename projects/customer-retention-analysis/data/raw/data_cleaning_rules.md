# Data Cleaning Rules

## Missing CustomerID
- Records without CustomerID will be excluded from customer-level analysis
- They may be retained for overall sales trends where appropriate

## Negative Quantities
- Negative quantities will be treated as returns or cancellations
- Cancelled invoices will be identified using InvoiceNo patterns
- These records will be excluded from revenue KPIs unless stated otherwise

## Zero or Negative Prices
- Records with zero or negative UnitPrice will be excluded from revenue calculations

## Duplicates
- Data will be checked for duplicates using InvoiceNo, StockCode, and InvoiceDate
- Confirmed duplicates will be removed