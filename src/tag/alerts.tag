
<alerts>
  <div each={ alerts } class="alert {type}" role="alert">
    {msg}
  </div>
  <script>
    this.alerts=[]
    addAlert(opts){      
      var type=this.getType(opts.type);
      if(type!=null){
        this.alerts.push({type:type, msg: opts.msg});
        this.update();
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
