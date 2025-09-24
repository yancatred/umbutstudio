<?php

defined('BASEPATH') or exit('No direct script access allowed');

include_once(__DIR__ . '/PDF_Signature.php');

abstract class App_pdf extends TCPDF
{
    use PDF_Signature;

    public $font_size = '';

    public $font_name = '';

    public $image_scale = 1.53;

    public $jpeg_quaility = 100;

    public $pdf_author = '';

    public $swap = false;

    public $footerY = 1;

    protected $languageArray = [
        'a_meta_charset' => 'UTF-8',
    ];

    protected $tag = '';

    protected $view_vars = [];

    private $formatArray = [];

    /**
     * This is true when last page is rendered
     * @var boolean
     */
    protected $last_page_flag = false;

    protected $ci;

    public function __construct()
    {
        $this->formatArray = $this->get_format_array();

        parent::__construct($this->formatArray['orientation'], 'mm', $this->formatArray['format'], true, 'UTF-8', false, false);

        /**
         * If true print TCPDF meta link.
         * @protected
         * @since 2.3.2
         */
        $this->tcpdflink = false;

        $this->ci = &get_instance();

        $this->setLanguageArray($this->languageArray);


        $this->pdf_author = get_option('companyname');

        $this->set_font_size($this->get_default_font_size());
        $this->set_font_name($this->get_default_font_name());

        if (defined('APP_PDF_MARGIN_LEFT') && defined('APP_PDF_MARGIN_TOP') && defined('APP_PDF_MARGIN_RIGHT')) {
            $this->setMargins(APP_PDF_MARGIN_LEFT, APP_PDF_MARGIN_TOP, APP_PDF_MARGIN_RIGHT);
        }

        $this->setAutoPageBreak(true, (defined('APP_PDF_MARGIN_BOTTOM') ? APP_PDF_MARGIN_BOTTOM : PDF_MARGIN_BOTTOM));

        $this->setAuthor($this->pdf_author);
        $this->setFont($this->get_font_name(), '', $this->get_font_size());
        $this->setImageScale($this->image_scale);
        $this->setJPEGQuality($this->jpeg_quaility);

        $this->AddPage($this->formatArray['orientation'], $this->formatArray['format']);

        if ($this->ci->input->get('print') == 'true') {
            // force print dialog
            $this->IncludeJS('print(true);');
        }

        $this->set_default_view_vars();

        hooks()->do_action('pdf_construct', ['pdf_instance' => $this, 'type' => $this->type()]);
    }

    abstract public function prepare();

    abstract protected function file_path();

    abstract protected function type();

    public function set_view_vars($vars, $value = null)
    {
        if (is_null($value) && is_array($vars)) {
            $this->view_vars = array_merge($this->view_vars, $vars);
        } else {
            $this->view_vars[$vars] = $value;
        }

        return $this;
    }

    public function get_view_vars($var = null)
    {
        if (array_key_exists($var, $this->view_vars)) {
            return $this->view_vars[$var];
        }

        return $this->view_vars;
    }

    public function get_format_array()
    {
        return get_pdf_format('pdf_format_' . $this->type());
    }

    public function set_font_size($size)
    {
        $this->font_size = $size;

        return $this;
    }

    public function get_font_size()
    {
        return $this->font_size;
    }

    public function get_default_font_size()
    {
        $font_size = get_option('pdf_font_size');

        if ($font_size == '') {
            $font_size = 10;
        }

        return $font_size;
    }

    public function get_font_name()
    {
        return $this->font_name;
    }

    public function set_font_name($name)
    {
        $this->font_name = $name;

        return $this;
    }

    public function get_default_font_name()
    {
        $font = get_option('pdf_font');
        if ($font != '' && !in_array($font, get_pdf_fonts_list())) {
            $font = 'freesans';
        }

        return $font;
    }

    public function custom_fields()
    {
        $whereCF = ['show_on_pdf' => 1];
        if (is_custom_fields_for_customers_portal()) {
            $whereCF['show_on_client_portal'] = 1;
        }

        return get_custom_fields($this->type(), $whereCF);
    }

    public function isLastPage()
    {
        return $this->last_page_flag;
    }

    public function Close()
    {
        if (hooks()->apply_filters('process_pdf_signature_on_close', true)) {
            $this->processSignature();
        }

        hooks()->do_action('pdf_close', ['pdf_instance' => $this, 'type' => $this->type()]);

        $this->last_page_flag = true;

        parent::Close();
    }

    public function Header()
    { //#d9d9d9

        $this->SetY(4); // Adjust the 10 to increase or decrease the space
        $header_content = '
        <div style="text-align: right;width: 100%; background-color: #d9d9d9; line-height: 1px; ">
            <img src="' . pdf_logo_url() . '" alt="Logo" style="width: 250px;  object-fit: cover; display: block; ">
        </div>
         ';

        // Set the margins to zero for the header
        $this->SetMargins(0, 0, 0, true);
        // Write the HTML content for the header
        $this->writeHTML($header_content, true, false, true, false, '');
        // Set the margins to normal
        $this->SetMargins(10, 47, 10, true);
    }


    public function Footer()
    {

        $footer_content = '
          <div style="text-align: center; font-size: 12px; background-color: #d9d9d9; color: black; line-height: 8px;">
          <br>
          <p style="font-size: ' . ($this->getPageWidth() <= 210 && $this->getPageHeight() <= 297 ? '8px' : '12px') . '; ">ADDRESS : NO. 20, JALAN UNGU C U9/C, SUNWAY KAYANGAN, 40150 SHAH ALAM, SELANGOR</p>
          <p style="font-size: ' . ($this->getPageWidth() <= 210 && $this->getPageHeight() <= 297 ? '8px' : '12px') . '; ">NO. TEL : 03-7840 0203&nbsp; &nbsp;EMAIL : UMBUTSTUDIO@GMAIL.COM</p>
          <br>
          </div>
          ';
        // Set the margins to zero for the footer
        $this->SetMargins(0, 0, 0, true);
        // Adjust the footer placement
        $this->SetY(-16);
        // 0.5mm spacing between characters
        $this->setFontSpacing(0.7);  // 0.5mm spacing between characters
        // Write the HTML content for the header

        $this->writeHTML($footer_content, true, false, false, false, '');
        // Set the margins to normal
        $this->SetMargins(10, 50, 10, true);
    }


    public function tblh()
    { //#d9d9d9

        $this->SetY(4); // Adjust the 10 to increase or decrease the space
        $header_content = '
        <div style="text-align: right;width: 100%; background-color: #d9d9d9; line-height: 1px; ">
        <p> ADDRESS : NO.20, JALAN UNGU C U9/C, SUNWAY KAYANGAN, 40150 SHAH ALAM, SELANGOR </p>
        <p> NO. TEL : 03-7840 0203&nbsp; &nbsp;EMAIL : UMBUTSTUDIO@GMAIL.COM </p>
        </div>
         ';
    }
    public function fix_editor_html($content)
    {
        // Add <br /> tag and wrap over div element every image to prevent overlaping over text
        $content = preg_replace('/(<img[^>]+>(?:<\/img>)?)/i', '<div>$1</div>', $content);
        // Fix BLOG images from TinyMCE Mobile Upload, could help with desktop too
        $content = preg_replace('/data:image\/jpeg;base64/m', '@', $content);

        // Replace <img src="" width="100%" height="auto">
        $content = preg_replace('/width="(([0-9]*%)|auto)"|height="(([0-9]*%)|auto)"/mi', '', $content);

        // Add cellpadding to all tables inside the html
        $content = preg_replace('/(<table\b[^><]*)>/i', '$1 cellpadding="4">', $content);

        // Remove white spaces cased by the html editor ex. <td>  item</td>
        $content = preg_replace('/[\t\n\r\0\x0B]/', '', $content);
        $content = preg_replace('/([\s])\1+/', ' ', $content);

        // Tcpdf does not support float css we need to adjust this here
        $content = str_replace('float: right', 'text-align: right', $content);
        $content = str_replace('float: left', 'text-align: left', $content);

        // Tcpdf does not support float css we need to adjust this here
        $content = str_replace('float:right', 'text-align: right', $content);
        $content = str_replace('float:left', 'text-align: left', $content);

        // Image center
        $content = str_replace('margin-left: auto; margin-right: auto;', 'text-align:center;', $content);

        // Remove any inline definitions for font family as it's causing issue with
        // the PDF font, in this case, only the PDF font will be used to generate the PDF document
        // the inline defitions will be used for HTML view
        $content = preg_replace('/font-family.+?;/m', '', $content);

        return $content;
    }

    protected function load_language($client_id)
    {
        load_pdf_language(get_client_default_language($client_id));

        return $this;
    }

    protected function get_file_path()
    {
        return hooks()->apply_filters($this->type() . '_pdf_build_path', $this->file_path());
    }

    protected function build()
    {
        _bulk_pdf_export_maybe_tag($this->tag, $this);

        if ($path = $this->get_file_path()) {

            // Backwards compatible
            $pdf = $this;
            $CI  = $this->ci;

            // The view vars, also backwards compatible
            extract($this->view_vars);
            include($path);
        }

        if (ob_get_length() > 0 && ENVIRONMENT == 'production') {
            ob_end_clean();
        }

        return $this;
    }

    private function set_default_view_vars()
    {
        $this->set_view_vars([
            'pdf_custom_fields' => $this->custom_fields(),
            'swap'              => $this->swap,
            'font_size'         => $this->get_font_size(),
            'font_name'         => $this->get_font_name(),
        ]);
    }

    public function with_number_to_word($client_id)
    {
        $this->ci->load->library('app_number_to_word', ['clientid' => $client_id], 'numberword');

        return $this;
    }

    /**
     * Unset all class variables except the following critical variables.
     *
     * @param $destroyall (boolean) if true destroys all class variables, otherwise preserves critical variables.
     * @param $preserve_objcopy (boolean) if true preserves the objcopy variable
     *
     * @since 4.5.016 (2009-02-24)
     */
    public function _destroy($destroyall = false, $preserve_objcopy = false)
    {
        // restore internal encoding
        if (isset($this->internal_encoding) and !empty($this->internal_encoding)) {
            mb_internal_encoding($this->internal_encoding);
        }

        if (isset(self::$cleaned_ids[$this->file_id])) {
            $destroyall = false;
        }

        if ($destroyall and !$preserve_objcopy) {
            self::$cleaned_ids[$this->file_id] = true;
            // remove all temporary files
            if ($handle = @opendir(K_PATH_CACHE)) {
                while (false !== ($file_name = readdir($handle))) {
                    $fullPath = K_PATH_CACHE . $file_name;
                    if (strpos($file_name, '__tcpdf_' . $this->file_id . '_') === 0 && file_exists($fullPath)) {
                        unlink($fullPath);
                    }
                }

                closedir($handle);
            }

            if (isset($this->imagekeys)) {
                foreach ($this->imagekeys as $file) {
                    if (strpos($file, K_PATH_CACHE) === 0 && file_exists($file)) {
                        @unlink($file);
                    }
                }
            }
        }

        $preserve = [
            'file_id',
            'internal_encoding',
            'state',
            'bufferlen',
            'buffer',
            'cached_files',
            'imagekeys',
            'sign',
            'signature_data',
            'signature_max_length',
            'byterange_string',
            'tsa_timestamp',
            'tsa_data',
        ];

        foreach (array_keys(get_object_vars($this)) as $val) {
            if ($destroyall or !in_array($val, $preserve)) {
                if ((!$preserve_objcopy or ($val != 'objcopy')) and ($val != 'file_id') and isset($this->$val)) {
                    unset($this->$val);
                }
            }
        }
    }
}
