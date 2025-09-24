# 🚀 DEPLOYMENT CHECKLIST - Timesheets Leave System Fixes

## 📋 FILES TO UPLOAD/UPDATE

### 🔧 1. CONTROLLER FILES
- [ ] `umbutstudio/modules/timesheets/controllers/Timesheets.php`
  - **Changes:** Added type casting `(int)`, dynamic mapping, approval process logic ✅ **Debug logs removed**

### 🏗️ 2. MODEL FILES
- [ ] `umbutstudio/modules/timesheets/models/Timesheets_model.php`
  - **Changes:** 
    - Added `get_leave_rel_type_mapping()` method (fully dynamic)
    - Fixed `get_day_off()` method with type casting
    - Removed duplicate methods (cleaned up compilation errors)
    - Enhanced approval logic in `get_approve_setting()` and `send_request_approve()`
    - Fixed approval logic to skip invalid approvers instead of failing
    - ✅ **CRITICAL FIX:** Fixed `add_requisition_ajax()` to use dynamic mapping for leave approvals
    - ✅ **INTELLIGENT MAPPING:** Implemented database-driven smart matching algorithm
    - ✅ **All debug logs removed - production ready**

### 🎨 3. VIEW FILES
- [ ] `umbutstudio/modules/timesheets/views/includes/manage_leave.php`
- [ ] `umbutstudio/modules/timesheets/views/timekeeping/manage_requisition_hrm.php`
- [ ] `umbutstudio/modules/timesheets/views/leave/calendar.php`
- [ ] `umbutstudio/modules/timesheets/views/table_registration_leave.php`
  - **Changes:** Replaced all hardcoded leave type options with dynamic database loading

### ⚡ 4. JAVASCRIPT FILES
- [ ] `umbutstudio/modules/timesheets/assets/js/requisition_manage_js.php`
  - **Changes:** Removed hardcoded logic that was hiding "remaining days" for non-ID-8 leave types

### 🌍 5. LANGUAGE FILES
- [ ] `umbutstudio/modules/timesheets/language/english/timesheets_lang.php`
- [ ] `umbutstudio/application/language/english/english_lang.php` ✅ **Empty lines cleaned**
  - **Changes:** Added missing language lines for leave application notifications (AL, SL, ML, EL, BL, CL)

### 📋 6. DOCUMENTATION
- [ ] `umbutstudio/DEPLOYMENT_CHECKLIST.md` (this file)
  - **Purpose:** Complete deployment guide and testing checklist

---

## 🗄️ DATABASE CHANGES (MANUAL SQL)

### ⚠️ STEP 1: Check Existing Data
```sql
-- Check if hardcoded leave types already exist
SELECT * FROM tbltimesheets_type_of_leave WHERE id IN (1,2,8);
```

### ⚠️ STEP 2: Insert Missing Leave Types (if needed)
```sql
-- Insert hardcoded leave types yang missing dalam database
INSERT IGNORE INTO `tbltimesheets_type_of_leave` (`id`, `type_name`, `slug`) VALUES 
(1, 'Sick Leave', 'sick-leave'),
(2, 'Maternity Leave', 'maternity-leave'), 
(8, 'Annual Leave', 'annual-leave');
```

---

## 🧪 TESTING CHECKLIST

### ✅ 1. Leave Application Test
- [ ] Apply Emergency Leave - ensure `type_of_leave` saves as ID (14), not string
- [ ] Apply other custom leave types - ensure proper ID insertion
- [ ] Check database: `SELECT * FROM tbltimesheets_day_off ORDER BY id DESC LIMIT 5`

### ✅ 3. Approver Assignment Test  
- [ ] Apply leave as different staff members
- [ ] Check approver assignment: `SELECT * FROM tbltimesheets_approval_details ORDER BY id DESC LIMIT 5`
- [ ] ✅ **FIXED:** Ensure approver column is NOT blank in requisition details page
- [ ] Test with staff who have/don't have direct managers
- [ ] **Critical:** Test Sick Leave applications - should now assign approvers properly

### ✅ 3. Frontend Display Test
- [ ] Check "remaining days" display shows for all leave types
- [ ] Verify leave type dropdown loads dynamically from database
- [ ] Test leave type selection and form behavior

### ✅ 4. Language/Error Test
- [ ] Apply leave and check for "Could not find language line" errors
- [ ] Check email notifications sent properly
- [ ] Verify no PHP errors in logs

### ✅ 5. Admin Panel Test
- [ ] Check requisition management table shows correct leave types
- [ ] Verify leave allocation page loads dynamic leave types
- [ ] Test approval process flow

### ✅ 6. Production Readiness Check
- [ ] ✅ **Confirm all debug logs removed from code**
- [ ] ✅ **No log_message('error', 'DEBUG') statements remain**
- [ ] Check error logs are clean after testing

---

## 🚨 ROLLBACK PLAN

### If Issues Occur:
1. **Backup current files before deployment**
2. **Database rollback:** Delete inserted leave types if needed:
   ```sql
   DELETE FROM tbltimesheets_type_of_leave WHERE id IN (1,2,8) AND slug IN ('sick-leave', 'maternity-leave', 'annual-leave');
   ```
3. **File rollback:** Restore original files from backup

---

## 📊 ISSUE SUMMARY

| **Issue** | **Files Affected** | **Status** | **Test Required** |
|-----------|-------------------|------------|-------------------|
| String vs ID insertion | `Timesheets.php` | ✅ Fixed | Database check |
| Hardcoded leave mapping | `Timesheets_model.php` + 4 views | ✅ Dynamic | Frontend test |
| Missing database leave types | Manual SQL | ⚠️ **PENDING** | SQL execution |
| Blank approver column | `Timesheets.php` + `Timesheets_model.php` | ✅ Fixed | Approval test |
| **Missing approvers for custom leaves** | **`Timesheets_model.php`** | **✅ FIXED** | **Sick leave test** |
| Hidden remaining days | `requisition_manage_js.php` | ✅ Fixed | UI test |
| Language line errors | 2 language files | ✅ Fixed | Error log check |
| Code duplication | `Timesheets_model.php` | ✅ Cleaned | PHP error check |
| Debug logs cleanup | All affected files | ✅ **CLEANED** | Production ready |

---

## 📝 DEPLOYMENT NOTES

- **Total Files:** 10 files (9 code files + 1 doc) + 1 manual SQL
- **Critical Fix Added:** Dynamic approval mapping for custom leave types
- **Backup Required:** Yes - backup all affected files before upload
- **Server Impact:** Medium - affects timesheet module functionality
- **Testing Time:** ~30 minutes comprehensive testing (extra focus on approval assignments)
- **Rollback Risk:** Low - changes are isolated to timesheet module
- **Production Ready:** ✅ All debug code removed

---

## ✅ DEPLOYMENT COMPLETION

- [ ] All files uploaded successfully
- [ ] Database changes executed
- [ ] All tests passed
- [ ] No error logs detected
- [ ] No debug logs in production code
- [ ] Stakeholder approval received

**Deployed by:** _______________  
**Date:** _______________  
**Time:** _______________

---

## 🎯 FINAL SUMMARY

**✅ COMPLETED:**
- 9 code files ready for deployment
- All debug logs removed (production clean)
- **CRITICAL:** Fixed approver assignment for custom leave types (Sick Leave, etc.)
- Comprehensive testing checklist provided
- Complete rollback plan documented
- - Database migration SQL ready

---

## 🧠 INTELLIGENT LEAVE TYPE MAPPING

### **Database-Driven Smart Matching Algorithm**

The system now uses **intelligent database-driven mapping** to automatically match leave types with approval settings:

#### **🔍 Matching Strategies (Priority Order):**

1. **Exact Match (Highest Priority)**
   - Direct string comparison: `"SICK LEAVE"` = `"SICK LEAVE"`
   - Returns immediately if found

2. **Keyword Matching**
   - Analyzes individual words in leave type names
   - Score: 10 points for exact word match, 5 points for partial match
   - Example: `"SICK"` in `"SICK LEAVE"` matches `"MEDICAL"` in `"MEDICAL LEAVE"`

3. **Semantic Matching**
   - Intelligent understanding of leave type variations
   - Built-in synonyms: `SICK ↔ MEDICAL`, `ANNUAL ↔ YEARLY`, etc.
   - Score: 15 points for semantic matches

#### **🎯 Benefits:**
- ✅ **No hardcoded mappings** - reads entirely from database
- ✅ **Admin-friendly** - new leave types automatically matched
- ✅ **Intelligent variations** - handles different naming conventions
- ✅ **Scoring system** - selects best match when multiple options exist
- ✅ **Graceful fallback** - returns original name if no match found

#### **📊 Example Matching:**
```
Input: "Sick Leave"
Database: "MEDICAL LEAVE" → related: "sick_leave"

Process:
1. Exact match: "SICK LEAVE" ≠ "MEDICAL LEAVE" → Continue
2. Keyword match: ["SICK"] vs ["MEDICAL", "LEAVE"] → Partial score
3. Semantic match: "SICK" → "MEDICAL" → Score: 15 ✅
4. Result: Return "sick_leave"
```

#### **🔧 Configuration:**
- **Primary source:** `tbltimesheets_approval_setting.name` field
- **Mapping target:** `tbltimesheets_approval_setting.related` field
- **Leave types:** `tbltimesheets_type_of_leave.type_name` field

---

**⚠️ ACTION REQUIRED:**
- Execute manual SQL on production database
- Upload all 9 files to server
- **Priority Test:** Verify sick leave applications assign approvers properly
- Run comprehensive testing
- Monitor error logs post-deployment 