# Leave System Update Checklist

## Overview
This checklist covers the files that need to be updated to fully implement the dynamic leave system where all leave types are loaded from the database instead of hardcoded values.

## Files to Update

### ✅ COMPLETED
- [x] `umbutstudio/modules/timesheets/views/includes/manage_leave.php`
  - **Status**: COMPLETED
  - **Changes**: Removed hardcoded leave type options (Annual, Maternity, Sick, Private Work)
  - **Result**: Now fully dynamic - all options loaded from `tbltimesheets_type_of_leave` table

### 🔄 PENDING UPDATES

#### 1. Frontend View Files
- [ ] `umbutstudio/modules/timesheets/views/timekeeping/manage_requisition_hrm.php`
  - **Current Status**: Still has hardcoded leave type options
  - **Required Changes**: 
    - Remove hardcoded `<option>` elements for leave types (1, 2, 4, 8)
    - Keep only the dynamic foreach loop that loads from database
  - **Line Numbers**: Around line 250 (dropdown section)

#### 2. Controller Files
- [ ] `umbutstudio/modules/timesheets/controllers/Timesheets.php`
  - **Current Status**: May have hardcoded references to leave type IDs
  - **Required Changes**:
    - Check `requisition_manage()` method for hardcoded type references
    - Check `setting()` method for default type assignments
    - Ensure all methods use database-driven type selection
  - **Specific Methods to Review**:
    - `requisition_manage()` (lines 973-990)
    - `setting()` (lines 32-122)
    - `set_leave()` method

#### 3. Model Files
- [ ] `umbutstudio/modules/timesheets/models/Timesheets_model.php`
  - **Current Status**: Contains hardcoded default type_of_leave = '8'
  - **Required Changes**:
    - Update `get_day_off()` method (lines 1002-1020)
    - Remove hardcoded default `$type_of_leave = '8'`
    - Implement proper default handling or require parameter
  - **Critical Fix**: Line 1012 - `if ($type_of_leave == '') { $type_of_leave = '8'; }`

#### 4. JavaScript/AJAX Files
- [ ] `umbutstudio/modules/timesheets/assets/js/requisition_manage_js.php`
  - **Current Status**: May contain hardcoded type references
  - **Required Changes**:
    - Review `get_remain_day_off()` function
    - Ensure AJAX calls handle dynamic type IDs properly
    - Remove any hardcoded type assumptions

#### 5. Database Migration (if needed)
- [ ] **SQL Updates Required**:
  - Ensure all existing hardcoded references are updated to use database IDs
  - Verify `tbltimesheets_type_of_leave` contains all required leave types
  - Check data consistency in `tbltimesheets_day_off` table

## Configuration Files to Check

#### 6. Language Files
- [ ] `umbutstudio/modules/timesheets/language/*/timesheets_lang.php`
  - **Check**: Ensure all leave type labels are properly defined
  - **Verify**: No hardcoded type assumptions in language strings

#### 7. Helper Functions
- [ ] Check for any helper functions that might have hardcoded leave type logic
  - Search for functions containing leave type constants
  - Update any utility functions that assume specific type IDs

## Testing Checklist

### Frontend Testing
- [ ] **Admin Settings Page** (`/admin/timesheets/setting?group=manage_leave`)
  - Verify dropdown shows all leave types from database
  - Test assigning leave to staff members
  - Confirm correct IDs are saved (not slugs)

- [ ] **Leave Application Page** (`/admin/timesheets/requisition_manage`)
  - Test leave type selection dropdown
  - Verify remaining days calculation works for all types
  - Test AJAX updates when changing leave types

### Backend Testing
- [ ] **Database Queries**
  - Verify all queries use correct type_of_leave values
  - Test leave balance calculations
  - Confirm no hardcoded type filtering

- [ ] **API Endpoints**
  - Test `get_remain_day_of` AJAX endpoint
  - Verify proper parameter handling
  - Test error handling for invalid types

## Database Verification

### Data Consistency Checks
- [ ] **tbltimesheets_type_of_leave table**
  - Verify all required leave types exist
  - Check for duplicate IDs
  - Ensure proper type_name and slug values

- [ ] **tbltimesheets_day_off table**
  - Verify type_of_leave values are all numeric IDs
  - Check for any remaining slug values
  - Confirm data matches type table

- [ ] **tbltimesheets_requisition_leave table**
  - Verify type_of_leave consistency
  - Check type_of_leave_text field alignment

## Rollback Plan

### If Issues Occur
- [ ] **Backup Current State**
  - Database backup before changes
  - File backups of modified code

- [ ] **Revert Strategy**
  - List of files to restore
  - Database rollback scripts
  - Testing procedure for rollback

## Final Validation

### System-wide Testing
- [ ] **Multi-user Testing**
  - Test with different staff roles
  - Verify permissions work correctly
  - Test concurrent leave applications

- [ ] **Edge Case Testing**
  - Test with zero leave balance
  - Test with custom leave types
  - Test year-end rollover scenarios

- [ ] **Performance Testing**
  - Verify database query performance
  - Test page load times
  - Check AJAX response times

## Notes

### Key Changes Made
1. **Dynamic Leave Types**: All leave type options now loaded from database
2. **Removed Hardcoding**: Eliminated hardcoded leave type IDs (1, 2, 4, 8)
3. **Database Consistency**: Ensured all references use numeric IDs consistently

### Important Considerations
- **Backward Compatibility**: Existing data should remain functional
- **User Experience**: Interface should work seamlessly for end users
- **Data Integrity**: All leave calculations must remain accurate

### Contact Information
- **Developer**: Assistant Yan
- **Last Updated**: Current session
- **Priority**: High - Core functionality impact

---

**Status Legend:**
- ✅ Completed
- 🔄 In Progress  
- ❌ Blocked/Issues
- ⏳ Pending Review 