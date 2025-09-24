<body>
    <h3 border="0" class="text_align_center"><?php echo _l('UMBUT STUDIO INTERIOR DESIGN') . ' (' . html_entity_decode($payslip_detail['pay_slip_number']. ')' ); ?></h3>
    <?php 
        $hrp_payslip_salary_allowance = hrp_payslip_json_data_decode($payslip_detail['json_data']);
    ?>
    <p>
    <table border="0.5" class="width-100-height-55">
        <tbody>
            <tr class="height-27">
                <td class="width-20-height-27 align_left"><strong><?php echo _l('employee_name'); ?></strong></td>
                <td class="width-30-height-27"><?php echo html_entity_decode($payslip_detail['employee_name']); ?></td>
                <td class="width-20-height-27 align_left"><strong><?php echo _l('staff_departments'); ?></strong></td>
                <td class="width-30-height-27"><?php echo html_entity_decode($list_department); ?></td>
            </tr>

            <tr class="height-27">
                <td class="width-20-height-27 align_left"><strong><?php echo _l('Employee ID'); ?></strong></td>
                <td class="width-30-height-27"><?php echo html_entity_decode($payslip_detail['employee_number']); ?></td>
                <td class="width-20-height-27 align_left"><strong><?php echo _l('Month'); ?></strong></td>
                <td class="width-30-height-27"><?php echo date('M-Y', strtotime($payslip_detail['month'])); ?></td>
            </tr>

            <tr class="height-27">
                <td class="width-20-height-27 align_left"><strong><?php echo _l('job_title'); ?></strong></td>
                <td class="width-30-height-27"><?php echo $job_position_data['position_name']; ?></td>
                <td class="width-20-height-27 align_left"><strong><?php echo _l('IC no'); ?></strong></td>
                <td class="width-30-height-27"><?php echo $staff_data['identification']; ?></td>
                <!-- <td class="width-30-height-27"><//?php echo html_entity_decode(isset($employee['job_title']) ? $employee['job_title'] : ''); ?></td> -->
                <!--<td class="width-20-height-27 align_left"><strong><//?php echo _l('ps_pay_slip_number'); ?></strong></td>-->
                <!--<td class="width-30-height-27"><//?php echo html_entity_decode($payslip_detail['pay_slip_number']); ?></td>-->
            </tr>
        </tbody>
    </table>
    <p>
    <?php 
    $hrp_payslip_salary_allowance = hrp_payslip_json_data_decode($payslip_detail['json_data']);
    $currency = $currency_data[0]; 
    ?>

        <table border="0.5" class="table">
            <tbody >
                <tr >
                    <th class="thead-dark"><?php echo _l('Earnings'); ?></th>
                    <th class="thead-dark"><?php echo _l('hrp_amount'); ?></th>
                    <th class="thead-dark"></th>
                    <th class="thead-dark"><?php echo _l('deduction_list'); ?></th>
                    <th class="thead-dark"><?php echo _l('hrp_amount'); ?></th>
                </tr>
            
                <tr class="project-overview">
                    <td>Basic salary</td>
                    <td><?php echo ' ' . $currency['symbol'] . '' . $hrp_payslip_salary_allowance['basic_salary']; ?></td>
                    <td></td>
                    <td width="30%"><?php echo _l('EPF'); ?></td>
                    <td class="text-left">
                    <?php 
                    $json_data = json_decode($payslip_detail['json_data'], true);
                    $epf_amount = isset($json_data['EPF']) ? $json_data['EPF'] : 0;
                    echo html_entity_decode(isset($payslip_detail) ? $currency['symbol'] . ' ' . app_format_money($epf_amount, '') : $currency['symbol'] . '0');
                    ?>
                    </td>
                </tr>
                
                <tr class="project-overview">
                    <td><?php echo $hrp_payslip_salary_allowance['NElaun']; ?></td>
                    <td><?php echo ' ' . $currency['symbol'] . '' . $hrp_payslip_salary_allowance['alaun'] ?></td>
                    <td></td>
                    <td width="30%"><?php echo _l('SOCSO'); ?></td>
                    <td class="text-left">
                    <?php 
                    $json_data = json_decode($payslip_detail['json_data'], true);
                    $socso_amount = isset($json_data['SOCSO']) ? $json_data['SOCSO'] : 0;
                    echo html_entity_decode(isset($payslip_detail) ?$currency['symbol'] . ' ' .  app_format_money($socso_amount, '') : $currency['symbol'] . '0');
                    ?>
                    </td>
                </tr>

                <tr class="project-overview">
                    <td>A/L Taken</td>
                    <?php $found_anual_leave = false; ?>
                    <?php foreach ($timesheets_data as $timesheet): ?>
                    <?php if ($timesheet['type_of_leave'] == 8): ?>
                    <td><?php echo ' ' . $timesheet['days_off']; ?></td>
                    <td></td>
                    <?php $found_anual_leave = true; ?>
                    <?php endif; ?>
                    <?php endforeach; ?>
                    <?php if (!$found_anual_leave): ?>
                    <td></td>
                    <td></td>
                    <?php endif; ?>

                    
                    <td width="30%"><?php echo _l('SIP'); ?></td>
    				<td class="text-left">
                        <?php echo html_entity_decode(isset($payslip_detail) ? $currency['symbol'] . ' ' .  app_format_money($json_data['SIP'], '') : $currency['symbol'] . '0'); ?>
                    </td>
                </tr>

                <tr class="project-overview">
                    <td>E/L Taken</td>
                    <?php $found_emergency_leave = false; ?>
                    <?php foreach ($timesheets_data as $timesheet): ?>
                    <?php if ($timesheet['type_of_leave'] == 'emergency'): ?>
                    <td><?php echo ' ' . $timesheet['days_off']; ?></td>
                    <td></td>
                    <?php $found_emergency_leave = true; ?>
                    <?php endif; ?>
                    <?php endforeach; ?>
                    <?php if (!$found_emergency_leave): ?>
                    <td></td>
                    <td></td>
                    <?php endif; ?>

                    
                    <td class="bold"></td>
                    <td></td>
                </tr>
                <tr class="project-overview">
                    <td>Medical Leave</td>
                    <?php $found_sick_leave = false; ?>
                    <?php foreach ($timesheets_data as $timesheet): ?>
                    <?php if ($timesheet['type_of_leave'] == 1): ?>
                    <td><?php echo ' ' . $timesheet['days_off']; ?></td>
                    <td></td>
                    <?php $found_sick_leave = true; ?>
                    <?php endif; ?>
                    <?php endforeach; ?>
                    <?php if (!$found_sick_leave): ?>
                    <td></td>
                    <td></td>
                    <?php endif; ?>

                    
                    <td class="bold"></td>
                    <td></td>
                </tr>

                <tr class="project-overview">
                    <td class="bold"><?php echo _l('Total earnings'); ?></td>
                    <td>
                        <?php echo isset($payslip_detail) ? $currency['symbol'] . '' .  app_format_money($payslip_detail['gross_pay'] + $payslip_detail['commission_amount'], '') : 0; ?>
                    </td>
                    <td></td>
                    <td class="bold"><?php echo _l('Total deductions'); ?></td>
                    <td>
                    <?php
                    $epf = isset($json_data['EPF']) ? $json_data['EPF'] : 0;
                    $kwsp = isset($json_data['KWSP']) ? $json_data['KWSP'] : 0;
                    $socso = isset($json_data['SOCSO']) ? $json_data['SOCSO'] : 0;
                    $sip = isset($json_data['SIP']) ? $json_data['SIP'] : 0;
                    $total_contributions = $epf + $kwsp + $socso + $sip;
                    echo $currency['symbol'] . '' . app_format_money($total_contributions, '');
                    ?>
                    </td>
                </tr>
                <tr class="project-overview">
                    <td class="bold"><?php echo _l('hr_bank_account_number'); ?></td>
                    <td><?php echo ' ' .$staff_data['account_number']; ?></td>
                    <td><?php echo ' ' .$staff_data['issue_bank']; ?></td>
					<!--<td><//?php echo isset($payslip_detail) ?' ' .  $payslip_detail['account_number'] : 0; ?></td>-->
                    <!--<td><//?php echo isset($payslip_detail) ?' ' .  $payslip_detail['bank_name'] : 0; ?></td>-->
                    <td>Net Pay</td>
                    <td><?php echo isset($payslip_detail) ? ' ' . $currency['symbol'] . '' . app_format_money($payslip_detail['net_pay'], '') : $currency['symbol'] . '0'; ?></td>
                </tr>  
        </tbody>
    </table>

    <table border="0" class="table">
            <tbody >
                <tr >
                    <th>Type</th>
                    <th>Remain/Total</th>
                    <th>Type</th>
                    <th>Remain/Total</th>              
                </tr>
                <tr class="project-overview">
                <td>A/L Taken</td>
            <?php $found_anual_leave = false; ?>
            <?php foreach ($timesheets_data as $timesheet): ?>
                <?php if ($timesheet['type_of_leave'] == 8): ?>
                    <td><?php echo $timesheet['remain'] . '/' . $timesheet['total']; ?></td>
                    <?php $found_anual_leave = true; ?>
                <?php endif; ?>
            <?php endforeach; ?>
            <?php if (!$found_anual_leave): ?>
                <td></td>
            <?php endif; ?>
            <td>E/L Taken</td>
            <?php $found_emergency_leave = false; ?>
            <?php foreach ($timesheets_data as $timesheet): ?>
                <?php if ($timesheet['type_of_leave'] == 'emergency'): ?>
                    <td><?php echo $timesheet['remain'] . '/' . $timesheet['total']; ?></td>
                    <?php $found_emergency_leave = true; ?>
                <?php endif; ?>
            <?php endforeach; ?>
            <?php if (!$found_emergency_leave): ?>
                <td></td>
            <?php endif; ?>
                </tr>
                <tr class="project-overview">
                <td>MC Taken</td>
            <?php $found_sick_leave = false; ?>
            <?php foreach ($timesheets_data as $timesheet): ?>
                <?php if ($timesheet['type_of_leave'] == 1): ?>
                    <td><?php echo $timesheet['remain'] . '/' . $timesheet['total']; ?></td>
                    <?php $found_sick_leave = true; ?>
                <?php endif; ?>
            <?php endforeach; ?>
            <?php if (!$found_sick_leave): ?>
                <td></td>
            <?php endif; ?>

                </tr>
                 
        </tbody>
    </table>
