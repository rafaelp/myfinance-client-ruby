# Changelog

## v1.2.0
### Endpoints improvements
- The `#find_all` method of all endpoints that support filtering can now receive parameters to refine the results and paginate
### Deprecations
- No longer supports `#find_by`. Use `#find_all` instead, passing filters as a hash if needed.
### Fixes
- Params encoding set to Rack

## v1.1.0

### New Endpoints
- Add endpoint Deposit Accounts filtering
- Add endpoint Entities filtering

## v1.0.0

### New Endpoints
- Add Bank Statements endpoints
- Add Categories endpoints
- Add Credit Cards endpoints
- Add Credit Cards Transactions endpoints
- Add Reconciles endpoints
- More endpoints for Financial Accounts (`find_all`, `find`)
### Improvements
- Implement search by attributes in Categories
###  Deprecations
- `FinancialAccount#destroy` and `#update` signatures are now `(entity_id, id, params)` instead of `(id, entity_id, params)`
