<?php

// Ensure that the script is accessed through the CodeIgniter framework
defined('BASEPATH') or exit('No direct script access allowed');


$dimensions = $pdf->getPageDimensions();

$info_right_column = '';
$info_left_column  = '';

$info_right_column .= '<span style="font-weight:bold;font-size:27px;">' . _l('PROPOSAL') . '</span><br />';
$info_right_column .= '<b style="color:#4e4e4e;"># ' . $number . '</b>';
$info_right_column .= '<br/><b style="font-size:15px;"> ' . $proposal->subject . '</b>';

// Write top left logo and right column info/text
pdf_multi_row($info_left_column, $info_right_column, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// Calculate number of rows occupied by proposal information
$rowcount = max([$pdf->getNumLines($proposal_info, 80)]);

// Generate HTML for client details
$client_details = '<b>' . _l('proposal_to') . '</b>';
$client_details .= '<div style="color:#424242;">';
    $client_details .= format_proposal_info($proposal, 'pdf'); // Assuming this function returns HTML
$client_details .= '</div>';

// Generate proposal date and open till information
$proposal_date = _l('proposal_date') . ': ' . _d($proposal->date);
$open_till     = '';

if (!empty($proposal->open_till)) {
    $open_till = _l('proposal_open_till') . ': ' . _d($proposal->open_till) . '<br />';
}

// Generate project information
$project = '';
if ($proposal->project_id != '' && get_option('show_project_on_proposal') == 1) {
    $project .= _l('project') . ': ' . get_project_name_by_id($proposal->project_id) . '<br />';
}

$date_details  = '';

$date_details .= '<br /><div >';
$date_details .= $proposal_date ;
$date_details .= '<br/>';
$date_details .= $open_till ;
$date_details .=  $project ;

//untuk funtion swap
$swap = get_option('swap_pdf_info');

// Assign $left_info and $right_info based on $swap
$left_info = $swap == '1' ? $date_details: $client_details;
$right_info = $swap == '1' ? $client_details : $date_details;

// Generate the PDF with the modified information
pdf_multi_row($left_info, $right_info, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// Move cursor down
$pdf->ln(5);


// Generate project information
$project = '';
if ($proposal->project_id != '' && get_option('show_project_on_proposal') == 1) {
    $project .= _l('project') . ': ' . get_project_name_by_id($proposal->project_id) . '<br />';
}

// Determine quantity heading based on proposal configuration
$qty_heading = _l('estimate_table_quantity_heading', '', false);

if ($proposal->show_quantity_as == 2) {
    $qty_heading = _l($this->type . '_table_hours_heading', '', false);
} elseif ($proposal->show_quantity_as == 3) {
    $qty_heading = _l('estimate_table_quantity_heading', '', false) . '/' . _l('estimate_table_hours_heading', '', false);
}

// Generate table for items
$items = get_items_table_data($proposal, 'proposal', 'pdf')
        ->set_headings('estimate');

$items_html = $items->table();

// Generate HTML for subtotal, discount, taxes, adjustment, and total
$items_html .= '<br /><br />';
$items_html .= '';
$items_html .= '<table cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';

$items_html .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->subtotal, $proposal->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($proposal)) {
    $items_html .= '
    <tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($proposal, 'percent')) {
        $items_html .= ' (' . app_format_number($proposal->discount_percent, true) . '%)';
    }
    $items_html .= '</strong>';
    $items_html .= '</td>';
    $items_html .= '<td align="right" width="15%">-' . app_format_money($proposal->discount_total, $proposal->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)' . '</strong></td>
    <td align="right" width="15%">' . app_format_money($tax['total_tax'], $proposal->currency_name) . '</td>
</tr>';
}

if ((int)$proposal->adjustment != 0) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->adjustment, $proposal->currency_name) . '</td>
</tr>';
}
$items_html .= '
<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->total, $proposal->currency_name) . '</td>
</tr>';
$items_html .= '</table>';

// Add total to words if enabled
if (get_option('total_to_words_enabled') == 1) {
    $items_html .= '<br /><br /><br />';
    $items_html .= '<strong style="text-align:center;">' . _l('num_word') . ': ' . $CI->numberword->convert($proposal->total, $proposal->currency_name) . '</strong>';
}

// Replace placeholder in proposal content with items table
$proposal->content = str_replace('{proposal_items}', $items_html, $proposal->content);

// Generate final HTML for the PDF
$html = <<<EOF
<div style="width:675px !important;">
$proposal->content
</div>
EOF;



// Write HTML to PDF
$pdf->writeHTML($html, true, false, true, false, '');

$pdf->ln(10);
$info_left1_column .=  _l('Prepared by;');
$info_left1_column .= '<br/><b >' . _l('UMBUT STUDIO INTERIOR DESIGN') . '</b>';
$info_left1_column .= '<br/>';
$info_left1_column .= '<br/>';
$info_left1_column .= '<br/>';
$info_left1_column .=  _l('--------------------------------------') ;
$info_left1_column .= '<br/><b >' . get_staff_full_name($estimate->sale_agent) . '</b>';
$info_left1_column .= '<br/>' . _l('sale_agent_string');

$info_right2_column .= '<div style="text-align: left;">';
$info_right2_column .=  _l('Confirmed by;');
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .=  _l('--------------------------------------') ;
$info_right2_column .= '<br/>'._l('Name :');
$info_right2_column .= '<br/>'._l('Date :');
$info_right2_column .= '</div>';



// Write top left logo and right column info/text
pdf_multi_row($info_left1_column, $info_right2_column, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);