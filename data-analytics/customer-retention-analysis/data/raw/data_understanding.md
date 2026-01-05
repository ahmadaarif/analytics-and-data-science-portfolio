## Dataset Source
UCI Machine Learning Repository – Online Retail dataset

## Time Period Covered
(e.g. Dec 2010 – Dec 2011)

## Grain of the Data
Each row represents:
(one line item per invoice per product)

## Key Columns
- InvoiceNo: 
- StockCode:
- Quantity:
- InvoiceDate:
- UnitPrice:
- CustomerID:
- Country:

## Initial Observations
- Some records contain missing CustomerID values
- Some product descriptions are missing
- Negative quantities are present, likely representing returns or cancellations
- No obvious duplicate rows observed on initial inspection

## Known Data Quality Issues
- Missing CustomerID values may limit customer-level analysis
- Negative quantities may distort revenue if not handled correctly
- Cancelled transactions need to be identified and treated consistently

