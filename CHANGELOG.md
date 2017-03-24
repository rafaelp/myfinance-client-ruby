# Changelog

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
