<?php defined('BASEPATH') or exit('No direct script access allowed');?>
<div class="row">
  <div class="col-md-4">
    <label for="start_year_for_annual_leave_cycle" class="control-label"><?php echo _l('staff'); ?></label>
    <select name="leave_filter_staff[]" class="selectpicker" id="leave_filter_staff" onchange="filter_hanson();" data-width="100%" data-none-selected-text="" data-live-search="true" multiple>
     <?php
     foreach ($staff as $value) {?>
      <option value="<?php echo html_entity_decode($value['staffid']); ?>"><?php echo html_entity_decode($value['staffid']) . ' # ' . $value['firstname'] . ' ' . $value['lastname']; ?></option>
    <?php }?>
  </select>
</div>
<div class="col-md-4">
  <label for="start_year_for_annual_leave_cycle" class="control-label"><?php echo _l('department'); ?></label>
  <select name="leave_filter_department[]" class="selectpicker" id="leave_filter_department" onchange="filter_hanson();" data-width="100%" data-none-selected-text="" data-live-search="true" multiple>
   <?php
   foreach ($department as $value) {?>
    <option value="<?php echo html_entity_decode($value['departmentid']); ?>"><?php echo html_entity_decode($value['name']); ?></option>
  <?php }?>
</select>
</div>
<div class="col-md-4">
  <label for="start_year_for_annual_leave_cycle" class="control-label"><?php echo _l('role'); ?></label>
  <select name="leave_filter_roles[]" class="selectpicker" id="leave_filter_roles" onchange="filter_hanson();" data-width="100%" data-none-selected-text="" data-live-search="true" multiple>
   <?php
   foreach ($role as $value) {?>
    <option value="<?php echo html_entity_decode($value['roleid']); ?>"><?php echo html_entity_decode($value['name']); ?></option>
  <?php }?>
</select>
</div>
<div class="clearfix"></div>
<br>
<div class="clearfix"></div>
<div class="col-md-12">
  <?php echo form_open(admin_url('timesheets/set_leave'), array('id' => 'setting-leave-form')); ?>
  <div class="row">
   <div class="col-md-4">
     <div class="form-group">
      <?php 
          $type_of_leave_selected = 8;
          $data_type_of_leave = get_timesheets_option('type_of_leave_selected');
          if ($data_type_of_leave) {
            $type_of_leave_selected = $data_type_of_leave;
          }
       ?>
       <label for="type_of_leave" class="control-label"><?php echo _l('type_of_leave'); ?></label>           
        <select name="type_of_leave" class="selectpicker" id="rel_type" data-width="100%" data-none-selected-text="<?php echo _l('none_type'); ?>" onchange="filter_hanson()">
         <?php 
         // FULLY DYNAMIC - All options from database only, NO HARDCODED values
         foreach ($type_of_leave as $value) { ?>
          <option value="<?php echo html_entity_decode($value['id']); ?>" <?php echo ($type_of_leave_selected == $value['id'] ? 'selected' : '') ?>><?php echo html_entity_decode($value['type_name']); ?></option>    
        <?php } ?>              
      </select>
 </div>
</div>
<div class="col-md-4">
  <?php
  $start_year_for_annual_leave_cycle = date('Y');
  $data_option = get_timesheets_option('start_year_for_annual_leave_cycle');
  if ($data_option) {
   $start_year_for_annual_leave_cycle = $data_option;
 }
 $year = [];
 for ($y = (int) $start_year_for_annual_leave_cycle - 1; $y < (int) $start_year_for_annual_leave_cycle + 5; $y++) {
   array_push($year, array('id' => $y, 'name' => $y));
 }
 echo render_select('start_year_for_annual_leave_cycle', $year, array('id', 'name'), 'ts_year', $start_year_for_annual_leave_cycle, array('onchange' => 'filter_hanson()'), array(), '', '', false);
 ?>
</div>
<div class="col-md-4"></div>
<div class="col-md-8 font-italic hide">
  <br>
  <br>
  <strong class="italic">
    <?php
    $date_data = $this->timesheets_model->get_date_leave();
    ?>
  </strong>
</div>
</div>
<div class="clearfix"></div>
<br>
<div class="clearfix"></div>
<?php echo form_hidden('leave_of_the_year_data'); ?>
<div class="hot handsontable htColumnHeaders" id="example">
</div>
<div class="clearfix"></div>
<hr>
<div class="col-md-12 mtop5">
 <button class="btn btn-primary save_leave_table pull-right" onclick="get_data_hanson();" ><?php echo _l('save'); ?></button>
</div>
<?php echo form_close(); ?>
</div>
</div>



