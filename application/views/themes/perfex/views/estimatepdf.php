<?php

defined('BASEPATH') or exit('No direct script access allowed');

$dimensions = $pdf->getPageDimensions();

$info_left_column .= '<br/>';
$info_left_column .= '<span style="color:rgb(255, 255, 255);font-weight:bold;font-size:27px;">' . _l('estimate_pdf_heading') . '</span><br />';
$info_left_column .= '<span style="color:rgb(255, 255, 255);text-transform:uppercase;">' . format_estimate_status($status, '', false) . '</span><br />';
$info_left_column .= '<b >' . _l('estimate_to') . ':</b>';
$info_left_column .= '<div style="color:#424242;">';
$info_left_column .= format_customer_info($estimate, 'estimate', 'billing');
$info_left_column .= '</div>';

$info_right_column .= '<span style="font-weight:bold;font-size:27px;">' . _l('estimate_pdf_heading') . '</span><br />';
$info_right_column .= '<b style="color:#4e4e4e;">' . _l('estimate_quot_no') . ' ' . $estimate_number . '</b>';

if (get_option('show_status_on_pdf_ei') == 1) {
    $info_right_column .= '<br /><span style="color:rgb(' . estimate_status_color_pdf($status) . ');text-transform:uppercase;">' . format_estimate_status($status, '', false) . '</span>';
    $info_right_column .= '<br /><b style="color:#4e4e4e;">' . _l('estimate_dt_table_heading_date') . ': ' . _d($estimate->date) . '</b>';
}

// Write top left logo and right column info/text
pdf_multi_row($info_left_column, $info_right_column, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);

// The Table
$pdf->Ln(hooks()->apply_filters('pdf_info_and_table_separator', 10));

// The items table
$items = get_items_table_data($estimate, 'estimate', 'pdf');

$tblhtml = $items->table();

$pdf->writeHTML($tblhtml, true, false, false, false, '');

$pdf->Ln(8);
$tbltotal = '';
$tbltotal .= '<table cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';
$tbltotal .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->subtotal, $estimate->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($estimate)) {
    $tbltotal .= '
    <tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($estimate, 'percent')) {
        $tbltotal .= ' (' . app_format_number($estimate->discount_percent, true) . '%)';
    }
    $tbltotal .= '</strong>';
    $tbltotal .= '</td>';
    $tbltotal .= '<td align="right" width="15%">-' . app_format_money($estimate->discount_total, $estimate->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $tbltotal .= '<tr>
    <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)' . '</strong></td>
    <td align="right" width="15%">' . app_format_money($tax['total_tax'], $estimate->currency_name) . '</td>
</tr>';
}

if ((int)$estimate->adjustment != 0) {
    $tbltotal .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->adjustment, $estimate->currency_name) . '</td>
</tr>';
}

$tbltotal .= '
<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->total, $estimate->currency_name) . '</td>
</tr>';

$tbltotal .= '</table>';

$pdf->writeHTML($tbltotal, true, false, false, false, '');

if (get_option('total_to_words_enabled') == 1) {
    // Set the font bold
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->writeHTMLCell('', '', '', '', _l('num_word') . ': ' . $CI->numberword->convert($estimate->total, $estimate->currency_name), 0, 1, false, true, 'C', true);
    // Set the font again to normal like the rest of the pdf
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(4);
}

if (!empty($estimate->terms)) {
    $pdf->Ln(4);
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->Cell(0, 0, _l('terms_and_conditions') . ":", 0, 1, 'L', 0, '', 0);
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(2);
    $pdf->writeHTMLCell('', '', '', '', $estimate->terms, 0, 1, false, true, 'L', true);
}

if (!empty($estimate->clientnote)) {
    $pdf->Ln(4);
    $pdf->SetFont($font_name, 'B', $font_size);
    $pdf->Cell(0, 0, _l('estimate_note'), 0, 1, 'L', 0, '', 0);
    $pdf->SetFont($font_name, '', $font_size);
    $pdf->Ln(2);
    $pdf->writeHTMLCell('', '', '', '', $estimate->clientnote, 0, 1, false, true, 'L', true);
}

$info_left1_column .=  _l('Prepared by;');
$info_left1_column .= '<br/><b >' . _l('UMBUT STUDIO INTERIOR DESIGN') . '</b>';
$info_left1_column .= '<br/>';
$info_left1_column .= '<br/>';
$info_left1_column .= '<br/>';
$info_left1_column .=  _l('--------------------------------------');
$info_left1_column .= '<br/><b >' . get_staff_full_name($estimate->sale_agent) . '</b>';
$info_left1_column .= '<br/>' . _l('sale_agent_string');

$info_right2_column .= '<div style="text-align: left;">';
$info_right2_column .=  _l('Confirmed by;');
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .= '<br/>';
$info_right2_column .=  _l('--------------------------------------');
$info_right2_column .= '<br/>' . _l('Name :');
$info_right2_column .= '<br/>' . _l('Date :');
$info_right2_column .= '</div>';



// Write top left logo and right column info/text
pdf_multi_row($info_left1_column, $info_right2_column, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);
