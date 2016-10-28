
<alerts>
  <div each={ alerts } class="alert {type}" role="alert">
    {msg}
  </div>
  <script>
    this.alerts=[]
    var self=this;

    addAlert(alert){
      var type=this.getType(alert.type);
      if(type!=null) {
        var alertCpy=JSON.parse(JSON.stringify(alert))
        this.alerts.push(alertCpy);
        this.update();
        if(alert.hideAfter!=null){
          setTimeout(function() {
            self.alerts=self.alerts.filter(function(el){
              return el!==alertCpy;
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
