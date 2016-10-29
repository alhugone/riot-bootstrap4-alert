
<alerts>
  <div each={ alerts } class="alert {type}" role="alert">
    {msg}
  </div>
  <script>
    this.alerts=[]
    var self=this;

    addAlert(alert){
      var alertCpy=JSON.parse(JSON.stringify(alert))
      alertCpy.type=this.getType(alertCpy.type);
      if(alertCpy.type!=null) {
        this.alerts.push(alertCpy);
        this.update();
        if(alert.hideAfter!=null && alert.hideAfter!=0){
          setTimeout(function() {
            var index=self.alerts.indexOf(alertCpy);
            if(alertCpy.fadeOutTime==null){
                alertCpy.fadeOutTime='slow';
            }
            $(self.root.children[index]).fadeOut(alertCpy.fadeOutTime, function() {
                self.alerts=self.alerts.filter(function(el){
                return el!==alertCpy;
              });
            });
            self.update();
          },alert.hideAfter);
        }
      }
    }

    getType(type){
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
