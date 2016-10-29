
<alerts>
  <div each={ alerts } class="alert {type} {alert-dismissible:dismissible}" role="alert">
    {msg}
    <button if={ dismissible} type="button" class="close" onclick={this.parent.close} >
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <script>
    this.alerts=[]
    var self=this;

    addAlert(alert){
      var alertCpy=JSON.parse(JSON.stringify(alert))
      alertCpy.type=this._getType(alertCpy.type);
      if(alertCpy.type!=null) {
        this.alerts.push(alertCpy);
        this.update();
        if(!isNaN(alert.hideAfter)){
          setTimeout(function() {
          self._closeAlert(alertCpy);
          },alert.hideAfter);
        }
      }
    }

    close(alert){
      var alertCpy=alert.item;
      this._closeAlert(alert.item);
    }

    _closeAlert(alert){
      var index=self.alerts.indexOf(alert);
      if(isNaN(alert.fadeOutTime)){
          alert.fadeOutTime='slow';
      }
      $(self.root.children[index]).fadeOut(alert.fadeOutTime, function() {
          self.alerts=self.alerts.filter(function(el){
              return el!==alert;
            });
          self.update({alerts:self.alerts});
      });
    }

    _getType(type){
      var retType=null;
      switch(type){
        case "success":
        case "alert-success":
          retType="alert-success";          
        break;
        case "info":
        case "alert-info":
          retType="alert-info";          
        break;
        case "warn":
        case "alert-warn":
          retType="alert-warning";          
        break;
        case "error":
        case "alert-error":
          retType="alert-danger";          
        break;
        default:
          throw "Unknown type:'" + type + "'";
      }
      return retType;
    }

  </script>
</alerts>
