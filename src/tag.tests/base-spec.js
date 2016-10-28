describe('Base test', function() {

  beforeEach(function() {
    var html = document.createElement('alerts')
    document.body.appendChild(html)
    tag = riot.mount('alerts')[0]
  });

  it('mounts a hello tag', function() {
    expect(tag).toBeDefined()
    expect(tag.isMounted).toBe(true);
  })

  it('after mount tag has no elements', function() {
    expect(tag.root.children.length).toEqual(0);
  })

  it('after addAlert create DOM child', function() {
    //arrange
    tag = riot.mount('alerts')[0]
    var alerts=[{type:'info',msg:'msg1'},
                {type:'info',msg:'msg1'},
                {type:'info',msg:'msg3'}]
    //act
    tag.addAlert(alerts[0]);
    tag.addAlert(alerts[1]);
    tag.addAlert(alerts[2]);
    //assert
    expect(tag.root.children.length).toEqual(3);
  })

  it('addAlert adds copy of each elemnt to alerts array', function() {
    //arrange
    tag = riot.mount('alerts')[0]
    var alerts=[{type:'info',msg:'msg1'},
                {type:'info',msg:'msg1'},
                {type:'info',msg:'msg3'}]
    //act
    tag.addAlert(alerts[0]);
    tag.addAlert(alerts[1]);
    tag.addAlert(alerts[2]);
    //assert
    expect(tag.alerts.length).toEqual(3);
    expect(tag.alerts[0]).not.toBe(alerts[0]);
    expect(tag.alerts[1]).not.toBe(alerts[1]);
    expect(tag.alerts[2]).not.toBe(alerts[2]);

    expect(tag.alerts[0]).toEqual(alerts[0]);
    expect(tag.alerts[1]).toEqual(alerts[1]);
    expect(tag.alerts[2]).toEqual(alerts[2]);
  })
})