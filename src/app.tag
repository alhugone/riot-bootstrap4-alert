
<app>
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
        <input name="hideAfterInput" type="number" class="form-control" placeholder=""  onchange={onHideAfterChanged}>
      </div>
      <label class="col-sm-2 col-form-label" >FadeOut Time:</label>
      <div class="col-sm-2">
        <input name="fadeOutTimeInput" type="number" class="form-control" placeholder=""  onchange={onFadeOutTimeInputChanged}>
      </div>
    </div> 
    <div class="row">
      <div class="col-xl-2 offset-sm-10">
        <button class="btn btn-primary float-xs-right" disabled={ !text } onclick={ addAlert }>Add</button>
      </div>
    </div>
  </form>
  <script>
    this.alertType = "success"

    edit(e) {
      this.text = e.target.value
    }

    addAlert(e) {
      if (this.text) {
        this.tags.alerts.addAlert(
          { type: this.alertType,
            msg:this.text,
            hideAfter:this.hideAfterInput.valueAsNumber,
            fadeOutTime: this.fadeOutTimeInput.valueAsNumber })
        }
    }

    setAlertType(e){
      this.alertType=e.target.value
    }    
  </script>

</app>
