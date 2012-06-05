<?php

require_once(dirname(__FILE__) . '/ckeditor.php');

class CKeditorWrapper {
  private $elt_name;
  private $ckeditor;

  public function __construct($basePath, $name) {
    $this->elt_name = $name;
    $this->ckeditor = new CKEditor($basePath);
    $this->ckeditor->returnOutput = true;
  }

  public function Create() {
    echo $this->CreateHtml();
  }

  public function CreateHtml() {
    return $this->ckeditor->editor($this->elt_name);
  }
}

