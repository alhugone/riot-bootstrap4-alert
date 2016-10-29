describe('hideAfter spec', function() {

  beforeEach(function() {
    var html = document.createElement('alerts')
    document.body.appendChild(html)
    jasmine.clock().install();  
  });

  afterEach(function(){
    jasmine.clock().uninstall();
  });

  it('when addAlert called with hideAfter alert is removed form alerts array after hideAfter time', function() {
    //arrange
    tag = riot.mount('alerts')[0]
    var alerts=[{type:'info',msg:'msg1'},
                {type:'info',msg:'msg1',hideAfter: 1000},
                {type:'info',msg:'msg3'}]
    tag.addAlert(alerts[0]);
    tag.addAlert(alerts[1]);
    tag.addAlert(alerts[2]);

    expect(tag.alerts.length).toEqual(3);
    expect(tag.alerts[0]).toEqual(alerts[0]);
    expect(tag.alerts[1]).toEqual(alerts[1]);
    expect(tag.alerts[2]).toEqual(alerts[2]);    
    expect(tag.root.children.length).toEqual(3);
    //act
    jasmine.clock().tick(1000);
    //assert    
    expect(tag.alerts.length).toEqual(2);
    expect(tag.alerts[0]).toEqual(alerts[0]);
    expect(tag.alerts[1]).toEqual(alerts[2]);    
  })

  it('when addAlert called with hideAfter DOM element is removed after hideAfter time', function() {
    //arrange
    tag = riot.mount('alerts')[0]
    var alerts=[{type:'info',msg:'msg1'},
                {type:'info',msg:'msg1',hideAfter: 1000},
                {type:'info',msg:'msg3'}]
    tag.addAlert(alerts[0]);
    tag.addAlert(alerts[1]);
    tag.addAlert(alerts[2]);

    expect(tag.root.children.length).toEqual(3);
    //act
    jasmine.clock().tick(1000);
    //assert    
    expect(tag.root.children.length).toEqual(2);    
  })

  it('when addAlert called with hideAfter equalt to 0, hideAfter is ignored', function() {
    //arrange
    tag = riot.mount('alerts')[0]
    tag.addAlert({type:'info',msg:'msg1',hideAfter: 0});
    expect(tag.root.children.length).toEqual(1);
    //act
    jasmine.clock().tick(1000);
    //assert
    expect(tag.root.children.length).toEqual(1);
  })
})
