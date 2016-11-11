
<alert-example>
  <alerts name="alerts"></alerts>
  <form onsubmit={ add }>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" >Message:</label>
      <div class="col-sm-10">
        <input name="msg" class="form-control"  onkeyup={ edit } placeholder="text">
      </div>
    </div>     
    <fieldset class="form-group row">
      <legend class="col-form-legend col-sm-2">Alert type:</legend>
      <div class="col-sm-10">
        <div class="form-check-inline">
          <label class="form-check-inline-label">
            <input class="form-check-inline-input" type="radio" name="gridRadios" onclick={ setAlertType } id="gridRadios1" value="success" checked>
            Success
          </label>
        </div>
        <div class="form-check-inline">
          <label class="form-check-inline-label">
            <input class="form-check-inline-input" type="radio" name="gridRadios" onclick={ setAlertType } id="gridRadios2" value="info">
            Info
          </label>
        </div>
        <div class="form-check-inline">
          <label class="form-check-inline-label">
            <input class="form-check-inline-input" type="radio" name="gridRadios" onclick={ setAlertType } id="gridRadios3" value="warn" >
            Warn
          </label>
        </div>
        <div class="form-check-inline">
          <label class="form-check-inline-label">
            <input class="form-check-inline-input" type="radio" name="gridRadios" onclick={ setAlertType } id="gridRadios4" value="error" >
            Error
          </label>
        </div>
      </div>
    </fieldset>
    <div class="form-group row">
      <label class="col-sm-2 col-form-label" >Hide after:</label>
      <div class="col-sm-2">
        <input name="hideAfterInput" type="number" class="form-control" placeholder=""  onchange={refreshCode}>
      </div>
      <label class="col-sm-2 col-form-label" >FadeOut Time:</label>
      <div class="col-sm-2">
        <input name="fadeOutTimeInput" type="number" class="form-control" placeholder=""  onchange={refreshCode}>
      </div>
      <div class="col-sm-2">
        <div class="form-check-inline">
          <label class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" name="dismissibleInput" onchange={refreshCode}>
            <span class="custom-control-indicator"></span>
            <span class="custom-control-description">Dismissible</span>
          </label>
        </div>
      </div>
    </div> 
    <div class="row">
      <div class="col-xl-2 offset-sm-10">
        <button class="btn btn-primary float-xs-right" disabled={ !text } onclick={ addAlert }>Show Alert</button>
      </div>
    </div>
  </form>

  <div class="row code-panel">
    <div class="col-sm-5">
      <div class="card highlight">                        
        <div class="card-block">
          <pre class=""><code>HTML:

&lt;alerts name="alerts"&gt&lt;/alerts&gt
</code></pre>
        </div>
    </div>
  </div>

    <div class="col-sm-6">
      <div class="card highlight">                        
        <div class="card-block">
          <pre class=""><code>JS:

this.tags.alerts.addAlert(
{code}
);</code></pre>
        </div>
      </div>
    </div>
  </div>
  
  <style>
    .highlight { background: #f7f7f9;}
    .code-panel { margin-top: 20px;}
  </style>

  <script>
  
    this.alertType = "success"
    this.on('mount', function() {
      this.refreshCode();
    });

    refreshCode() {
      this.code = JSON.stringify(this.getAlert(), null, '\t');
      this.update();
    }

    edit(e) {
      this.text = e.target.value;
      this.refreshCode();
    }

    getAlert() {
      return { type: this.alertType,
            msg: this.text,
            hideAfter: Number.isNaN(this.hideAfterInput.valueAsNumber) ? undefined : this.hideAfterInput.valueAsNumber,
            fadeOutTime: Number.isNaN(this.fadeOutTimeInput.valueAsNumber)? undefined :this.fadeOutTimeInput.valueAsNumber,
            dismissible: this.dismissibleInput.checked }
    }
    addAlert(e) {
      if (this.text) {
        var alert = this.getAlert();
        this.tags.alerts.addAlert(alert);
        this.code = JSON.stringify(alert, null, '\t');
        }
    }

    onHideAfterChanged(){
      this.refreshCode();
    }
    
    setAlertType(e){
      this.alertType = e.target.value;
      this.refreshCode();
    }    
  </script>

</alert-example>