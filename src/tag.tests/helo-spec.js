describe('Simple test', function() {

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
    tag = riot.mount('alerts')[0]
    tag.addAlert({type:'info',msg:'msg'});
    expect(tag.root.children.length).toEqual(1);
    expect(tag.alerts.length).toEqual(1);
  })
})
